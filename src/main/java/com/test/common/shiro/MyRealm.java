package com.test.common.shiro;

import com.test.entity.Permission;
import com.test.entity.Role;
import com.test.entity.User;
import com.test.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class MyRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;
    /*用户授权验证*/
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = (String)principalCollection.getPrimaryPrincipal();
        User user = userService.FindUserByName(username);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        for(Role role :user.getRoleList()){
            authorizationInfo.addRole(role.getRolename());
            for(Permission permission :role.getPermissionList()){
                authorizationInfo.addStringPermission(permission.getPermissionname());
            }
        }
        return authorizationInfo;
    }
    /*用户身份信息验证*/
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToke = (UsernamePasswordToken)authenticationToken;
        String username =  usernamePasswordToke.getUsername();
        User user = userService.FindUserByName(username);
        if(user==null){
            // 用户名不存在抛出异常
            throw new UnknownAccountException();
        }else {
            AuthenticationInfo info = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
            return info;
        }
    }
}
