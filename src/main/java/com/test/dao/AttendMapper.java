package com.test.dao;

import com.test.common.page.PageQueryCondition;
import com.test.entity.Attend;

import java.util.List;

public interface AttendMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attend record);

    int insertSelective(Attend record);

    Attend selectByPrimaryKey(Integer id);

    Attend selectTodayRecord(Integer userid);

    int updateByPrimaryKeySelective(Attend record);

    int updateByPrimaryKey(Attend record);

    int conditionCount(PageQueryCondition condition);

    List<Attend> selectAttendListByCondition(PageQueryCondition condition);

    List<Integer> selectTodayAbsence();

    void batchInsert(List<Attend> attendList);

    List<Attend> selectTodayEveningAbsence();
}