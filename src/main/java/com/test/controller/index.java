package com.test.controller;

import com.alibaba.fastjson.JSON;
import com.test.common.utils.MD5Utils;
import com.test.entity.User;
import com.test.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;


@Controller
@RequestMapping("index")
public class index {
    @Autowired
    private UserService userService;

    /*进入登录页面*/
    @RequestMapping("/loginpage")
    public String index(){

        return "index";
    }

   /*下载测试*/
    /*@RequestMapping("/down")
    public ResponseEntity<byte[]> download() throws IOException {
        String path="F:\\dayi.png";
        File file=new File(path);
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment",path);
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }*/

    /*员工登录*/
    @RequestMapping("/login")
    @ResponseBody
    public String login(@RequestBody User user){
        String username=user.getUsername();
        String password=user.getPassword();
        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token=new UsernamePasswordToken(username,password);
        if (user.getChecked()!=null){
            token.setRememberMe(true);
        }
        try {
            subject.login(token);
        }catch (UnknownAccountException e){
            return JSON.toJSONString("找不到用户");
        }
        catch (ExcessiveAttemptsException e){
            return JSON.toJSONString("密码输累了吧,先去休息10分钟吧");
        }
        catch (Exception e){
            return JSON.toJSONString("登录失败");
        }
        User user1=userService.FindUserByName(username);
        SecurityUtils.getSubject().getSession().setAttribute("userinfo",user1);
        SecurityUtils.getSubject().getSession().setTimeout(1800000);/*session设置1800000毫秒*/
        return JSON.toJSONString("登录成功");

    }

    /*退出登录*/
    @RequestMapping("/logout")
    public String logout(){
        Subject subject=SecurityUtils.getSubject();
        subject.logout();
        return "index";
    }
    /*注册员工*/
    @RequestMapping("/register")
    @ResponseBody
    public String register(@RequestBody User user) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String pwd= MD5Utils.encodepassword(user.getPassword());/*md5加密密码*/
        user.setPassword(pwd);
        userService.insert(user);
        return JSON.toJSONString("OK");
    }

    /*获取用户信息*/
    @RequestMapping("/userinfo")
    @ResponseBody
    public User userinfo(){
        User user=null;
        user= (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
        return user;
    }
}
