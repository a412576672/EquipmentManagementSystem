package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.Workshop;
import com.softeem.ssm.entity.WorkshopExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkshopMapper {
    long countByExample(WorkshopExample example);

    int deleteByExample(WorkshopExample example);

    int deleteByPrimaryKey(Integer wid);

    int insert(Workshop record);

    int insertSelective(Workshop record);

    List<Workshop> selectByExample(WorkshopExample example);

    Workshop selectByPrimaryKey(Integer wid);

    int updateByExampleSelective(@Param("record") Workshop record, @Param("example") WorkshopExample example);

    int updateByExample(@Param("record") Workshop record, @Param("example") WorkshopExample example);

    int updateByPrimaryKeySelective(Workshop record);

    int updateByPrimaryKey(Workshop record);
}