package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.Maintain;
import com.softeem.ssm.entity.MaintainExample;
import com.softeem.ssm.model.MaintainModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MaintainMapper {
    long countByExample(MaintainExample example);

    int deleteByExample(MaintainExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(Maintain record);

    int insertSelective(Maintain record);

    List<Maintain> selectByExample(MaintainExample example);

    Maintain selectByPrimaryKey(Integer mid);

    Maintain selectByfId(Integer fid);

    int updateByExampleSelective(@Param("record") Maintain record, @Param("example") MaintainExample example);

    int updateByExample(@Param("record") Maintain record, @Param("example") MaintainExample example);

    int updateByPrimaryKeySelective(Maintain record);

    int updateByPrimaryKey(Maintain record);

    List<MaintainModel> selectMaintainModelByExample(MaintainExample example);

    MaintainModel selectMaintainModelByPrimaryKey(Integer mid);
}