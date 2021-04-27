package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.Repairman;
import com.softeem.ssm.entity.RepairmanExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepairmanMapper {
    long countByExample(RepairmanExample example);

    int deleteByExample(RepairmanExample example);

    int deleteByPrimaryKey(Integer rid);

    int insert(Repairman record);

    int insertSelective(Repairman record);

    List<Repairman> selectByExample(RepairmanExample example);

    Repairman selectByPrimaryKey(Integer rid);

    int updateByExampleSelective(@Param("record") Repairman record, @Param("example") RepairmanExample example);

    int updateByExample(@Param("record") Repairman record, @Param("example") RepairmanExample example);

    int updateByPrimaryKeySelective(Repairman record);

    int updateByPrimaryKey(Repairman record);
}