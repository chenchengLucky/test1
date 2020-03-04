package com.test.common.shiro;

import com.test.common.utils.MD5Utils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.atomic.AtomicInteger;

public class MyCredentialsMatcher extends SimpleCredentialsMatcher {
    private Cache<String,AtomicInteger> passwordRetryCache;

    public MyCredentialsMatcher(CacheManager cacheManager) {
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");
    }
    @Override
    /*用户密码匹配*/
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken usertoken = (UsernamePasswordToken) token;
        String password = String.valueOf(usertoken.getPassword());
        String username = String.valueOf(usertoken.getUsername());
        AtomicInteger retryCount = passwordRetryCache.get(username);
        if (retryCount == null) {
            retryCount = new AtomicInteger(0);
            passwordRetryCache.put(username, retryCount);
        }
        // 自定义一个验证过程：当用户连续输入密码错误5次以上禁止用户登录一段时间
        if (retryCount.incrementAndGet() > 5) {
            throw new ExcessiveAttemptsException();
        }
        Object tokenCredentials = null;
        try {
            tokenCredentials = MD5Utils.encodepassword(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Object accountCredentials =getCredentials(info);
        boolean match = equals(tokenCredentials,accountCredentials);
        if (match) {
            passwordRetryCache.remove(username);
        }
        return match;

    }
}
