package com.softeem.ssm.mapper;

import com.softeem.ssm.entity.EquipmentExample;
import com.softeem.ssm.entity.Scrap;
import com.softeem.ssm.entity.ScrapExample;
import com.softeem.ssm.model.EquipmentModel;
import com.softeem.ssm.model.ScrapModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScrapMapper {
    long countByExample(ScrapExample example);

    int deleteByExample(ScrapExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(Scrap record);

    int insertSelective(Scrap record);

    List<Scrap> selectByExample(ScrapExample example);

    Scrap selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") Scrap record, @Param("example") ScrapExample example);

    int updateByExample(@Param("record") Scrap record, @Param("example") ScrapExample example);

    int updateByPrimaryKeySelective(Scrap record);

    int updateByPrimaryKey(Scrap record);

    List<ScrapModel> selectScrapModelByIdLimit(ScrapExample example);
}