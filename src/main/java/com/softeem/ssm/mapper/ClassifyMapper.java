package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.ClassifyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassifyMapper {
    long countByExample(ClassifyExample example);

    int deleteByExample(ClassifyExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Classify record);

    int insertSelective(Classify record);

    List<Classify> selectByExample(ClassifyExample example);

    Classify selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Classify record, @Param("example") ClassifyExample example);

    int updateByExample(@Param("record") Classify record, @Param("example") ClassifyExample example);

    int updateByPrimaryKeySelective(Classify record);

    int updateByPrimaryKey(Classify record);

    List<Classify> selectByExampleLimit(@Param("example") ClassifyExample example,@Param("index") int index , @Param("len") int len);
}