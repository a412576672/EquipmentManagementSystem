package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.Fault;
import com.softeem.ssm.entity.FaultExample;
import com.softeem.ssm.model.FaultModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FaultMapper {
    long countByExample(FaultExample example);

    int deleteByExample(FaultExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(Fault record);

    int insertSelective(Fault record);

    List<Fault> selectByExample(FaultExample example);

    Fault selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") Fault record, @Param("example") FaultExample example);

    int updateByExample(@Param("record") Fault record, @Param("example") FaultExample example);

    int updateByPrimaryKeySelective(Fault record);

    int updateByPrimaryKey(Fault record);

    List<FaultModel> selectByFaultModelLimit(FaultExample example);

    FaultModel selectByFaultId(int fid);

    List<Fault> selectByEid(int eid);
}