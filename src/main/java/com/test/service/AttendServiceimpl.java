package com.test.service;

import com.test.common.page.PageQueryBean;
import com.test.common.page.PageQueryCondition;
import com.test.common.utils.DateUtils;
import com.test.dao.AttendMapper;
import com.test.entity.Attend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("attendServiceimpl")
public class AttendServiceimpl implements AttendService{
    @Autowired
    private AttendMapper attendMapper;
    private static final byte ATTEND_STATUS_NORMAL=1;/*打卡正常*/
    private static final byte ATTEND_STATUS_ABNORMAL=2;/*打卡异常*/
    private static final int NOON_HOUR=12;/*中午12点的时*/
    private static final int NOON_MUNITE=00;/*中午12点的分*/
    private static final int MORNING_HOUR=9;/*早上9点30分的时*/
    private static final int MORNING_MUNITE=30;/*早上9点30分分*/
    private static final int EVENING_HOUR=18;/*下午6点30分的时*/
    private static final int EVENING_MUNITE=30;/*下午6点30分的分*/
    private static final int ABSENCE_DAY=480;/*一天480分钟*/
    /*考勤打卡业务*/
    public void attendrRcord(Attend attend) {
        Date today=new Date();
        attend.setAttendDate(today);
        if (DateUtils.GetWeek()==6||DateUtils.GetWeek()==7){
            return;
        }
        attend.setAttendWeek(DateUtils.GetWeek());
        Attend todayrecord=attendMapper.selectTodayRecord(attend.getUserid());
        Date nood= DateUtils.GetSetdate(NOON_HOUR,NOON_MUNITE);
        Date morning=DateUtils.GetSetdate(MORNING_HOUR,MORNING_MUNITE);
        /*今天没有记录的情况*/
        if (todayrecord==null){
            if(today.compareTo(nood)<=0){
                attend.setAttendMorming(today);
                if(today.compareTo(morning)>0){
                    //大于九点半迟到了
                    attend.setAttendStatus(ATTEND_STATUS_ABNORMAL);
                    attend.setAbsence(DateUtils.GetMunite(morning,today));
                }
            }else {
                attend.setAttendStatus(ATTEND_STATUS_ABNORMAL);
                attend.setAttendEvening(today);
            }
            attendMapper.insertSelective(attend);
        }
        /*今天有记录的情况*/
        else {
            /*判定上午打卡*/
            if(today.compareTo(nood)<=0){
                return;
            }else {
                /*判定下午打卡*/
                Date evening=DateUtils.GetSetdate(EVENING_HOUR,EVENING_MUNITE);
                todayrecord.setAttendEvening(today);
                /*早于下午六点半 早退 异常*/
                if (today.compareTo(evening)<0){
                    todayrecord.setAttendStatus(ATTEND_STATUS_ABNORMAL);
                    /*当前记录早上迟到*/
                    if (todayrecord.getAttendMorming()!=null&&todayrecord.getAttendMorming().compareTo(morning)>0){
                        todayrecord.setAbsence(DateUtils.GetMunite(morning,todayrecord.getAttendMorming())+DateUtils.GetMunite(today,evening));
                    }
                    if(todayrecord.getAttendMorming()!=null&&todayrecord.getAttendMorming().compareTo(morning)<=0){
                        todayrecord.setAbsence(DateUtils.GetMunite(today,evening));
                    }
                }
                else{
                    /*当前记录一切正常*/
                    if (todayrecord.getAttendMorming()!=null&&todayrecord.getAttendMorming().compareTo(morning)<=0){
                        todayrecord.setAttendStatus(ATTEND_STATUS_NORMAL);
                        todayrecord.setAbsence(0);
                    }
                    /*当前记录早上迟到*/
                    if (todayrecord.getAttendMorming()!=null&&todayrecord.getAttendMorming().compareTo(morning)>0){
                        todayrecord.setAbsence(DateUtils.GetMunite(morning,todayrecord.getAttendMorming()));
                    }

                }
                attendMapper.updateByPrimaryKeySelective(todayrecord);
            }

        }

    }
    /*考勤数据分页业务*/
    public PageQueryBean attendList(PageQueryCondition condition) {
        int count=attendMapper.conditionCount(condition);
        PageQueryBean pageresult=new PageQueryBean();
        if (count>0){
            pageresult.setTotalRows(count);
            pageresult.setCurrentPage(condition.getCurrentPage());
            pageresult.setPageSize(condition.getPageSize());
            List<Attend> attendList=attendMapper.selectAttendListByCondition(condition);
            pageresult.setItems(attendList);
        }
            return pageresult;
    }

    public void checkAttend() {

        //查询缺勤用户ID 插入打卡记录  并且设置为异常 缺勤480分钟
        int todayweek=DateUtils.GetWeek();
        if (todayweek<6){ //只检查周一到周五
            List<Integer> userIdList =attendMapper.selectTodayAbsence();
            if(!userIdList.isEmpty()){
                List<Attend> attendList = new ArrayList();
                for(Integer userId:userIdList){
                    Attend attend = new Attend();
                    attend.setUserid(userId);
                    attend.setAttendDate(new Date());
                    attend.setAttendWeek(DateUtils.GetWeek());
                    attend.setAbsence(ABSENCE_DAY);
                    attend.setAttendStatus(ATTEND_STATUS_ABNORMAL);
                    attendList.add(attend);
                }
                attendMapper.batchInsert(attendList);
            }
        }

        // 检查晚打卡 将下班未打卡记录设置为异常
        List<Attend> absenceList = attendMapper.selectTodayEveningAbsence();
        if(!absenceList.isEmpty()){
            for(Attend attend : absenceList){
                attend.setAbsence(ABSENCE_DAY);
                attend.setAttendStatus(ATTEND_STATUS_ABNORMAL);
                attendMapper.updateByPrimaryKeySelective(attend);
            }
        }

    }
}
