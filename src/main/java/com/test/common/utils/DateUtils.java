package com.test.common.utils;

import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;

import java.util.Calendar;
import java.util.Date;

public class DateUtils {
    private static Date date=new Date();
    private static Calendar calendar=Calendar.getInstance();
    /*得到今天星期几*/
    public static byte GetWeek(){
        calendar.setTime(date);
        byte week= (byte) (calendar.get(Calendar.DAY_OF_WEEK)-1);
        if (week<=0){
            week=7;
        }
        return week;
    }
    /*计算时间差（分钟）*/
    public static int GetMunite(Date stardate,Date enddate){
        long star=stardate.getTime();
        long end=enddate.getTime();
        int munite= (int) ((end-star)/(1000*60));
        return munite;
    }
    /*获取设置的当天时间*/
    public static Date GetSetdate(int hour,int mnite){
        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,mnite);
        return calendar.getTime();
    }
}
