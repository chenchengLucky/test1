package com.test.common.utils;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
    public static String encodepassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest mess=MessageDigest.getInstance("MD5");
        BASE64Encoder base64=new BASE64Encoder();
        String result=base64.encode(mess.digest(password.getBytes("utf-8")));
        return result;
    }
}
