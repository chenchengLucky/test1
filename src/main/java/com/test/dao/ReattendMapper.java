package com.test.dao;

import com.test.common.page.PageQueryReattend;
import com.test.entity.Reattend;

import java.util.List;

public interface ReattendMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Reattend record);

    int insertSelective(Reattend record);

    Reattend selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reattend record);

    int updateByPrimaryKey(Reattend record);

    Reattend selectByAttendid(Integer attendid);

    List<Reattend> selectByUserid(Integer userid);

    int reattendCount(PageQueryReattend pageQueryReattend);

    List<Reattend> selectListByStatus(PageQueryReattend pageQueryReattend);
}