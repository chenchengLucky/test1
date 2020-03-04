package com.test.controller;

import com.alibaba.fastjson.JSON;
import com.test.common.page.PageQueryBean;
import com.test.common.page.PageQueryReattend;
import com.test.entity.Reattend;
import com.test.entity.User;
import com.test.service.ReattendService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("reattend")
public class reattend {
    private static byte REATTEND_STATUS_NULL=0;
    @Autowired
    private ReattendService reattendService;


    @RequestMapping("/addreattend")
    @ResponseBody
    public String addreattend(@RequestBody Reattend reattend) throws ParseException {
        if (reattendService.findbyattendid(reattend.getAttendId())!=null){
            return JSON.toJSONString("不能重复交，fail");
        }else {
            User user= (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
            reattend.setReattendUserid(user.getId());
            reattend.setReattendChinesename(user.getChineseName());
            reattend.setStatus(REATTEND_STATUS_NULL);
            System.out.println(reattend.getStringmorning());
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            Date morning = sdf.parse(reattend.getStringmorning());
            Date evening = sdf.parse(reattend.getStringevening());
            reattend.setReattendMorning(morning);
            reattend.setReattendEvening(evening);
            reattendService.addreattend(reattend);
            return JSON.toJSONString("提交成功，success");
        }
    }

    @RequestMapping("/tomyreattend")
    public String tomyreattend(Model model){
        User user= (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
        List<Reattend> reattendList=reattendService.findbyuserid(user.getId());
        if (!reattendList.isEmpty()){
            for (int i=0;i<reattendList.size();i++){
                Reattend reattend=reattendList.get(i);
                SimpleDateFormat formatd=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat formatt=new SimpleDateFormat("HH:mm:ss");
                reattend.setStringdate(formatd.format(reattend.getAttendDate()));
                reattend.setStringmorning(formatt.format(reattend.getReattendMorning()));
                reattend.setStringevening(formatt.format(reattend.getReattendEvening()));
                reattendList.set(i,reattend);
            }
            model.addAttribute("reattendList",reattendList);
        }
        return "myreattend";
    }
    @RequestMapping("/toreattendlist")
    public String toreattendlist(){
        return "reattendlist";
    }

    @RequestMapping("/reattendajax")
    @ResponseBody
    public PageQueryBean reattendajax(@RequestBody PageQueryReattend pageQueryReattend){
        PageQueryBean pageQueryBean=reattendService.reattendList(pageQueryReattend);
        return pageQueryBean;
    }

    @RequestMapping("/execute")
    @ResponseBody
    public String execute(@RequestBody Reattend reattend){
        Reattend newReattend=reattendService.findbyid(reattend.getId());
        if (newReattend!=null){
            newReattend.setStatus(reattend.getStatus());
            User user= (User) SecurityUtils.getSubject().getSession().getAttribute("userinfo");
            newReattend.setHandler(user.getChineseName());
            reattendService.updatereattend(newReattend);
            return JSON.toJSONString("success");
        }else {
            return JSON.toJSONString("fail");
        }
    }
}
