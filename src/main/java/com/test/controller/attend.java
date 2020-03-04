package com.test.controller;

import com.alibaba.fastjson.JSON;
import com.test.common.page.PageQueryBean;
import com.test.common.page.PageQueryCondition;
import com.test.entity.Attend;
import com.test.entity.User;
import com.test.service.AttendService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("attend")
public class attend {
    @Autowired
    private AttendService attendService;

    /*进入考勤系统*/
    @RequestMapping("/toattend")
    public String toattend(){
        return "toattend";
    }

    @RequestMapping("/about")
    public String attendtest(){
        return "attendtest";
    }

    /*添加考勤打卡记录*/
    @RequestMapping("/attendin")
    @ResponseBody
    public String attendin(@RequestBody Attend attend){
        if (attend.getUserid()==null){
            User user= (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
            attend.setUserid(user.getId());
        }
        attendService.attendrRcord(attend);
        return JSON.toJSONString("success");
    }

    /*查询考勤数据并分页*/
    @RequestMapping("/attendlist")
    public String attendlist(){
        return "attendlist";
    }

    @RequestMapping("/attendlistajax")
    @ResponseBody
    public PageQueryBean attendlistajax(@RequestBody PageQueryCondition condition){
        User user= (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
        condition.setUserid(user.getId());
        String [] rangeDate = condition.getRangeDate().split("/");
        condition.setStarDate(rangeDate[0]);
        condition.setEndDate(rangeDate[1]);
        PageQueryBean result=attendService.attendList(condition);
        return result;
    }
}

