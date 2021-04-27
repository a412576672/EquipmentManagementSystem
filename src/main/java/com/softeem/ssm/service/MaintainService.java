package com.softeem.ssm.service;

import com.softeem.ssm.entity.Maintain;
import com.softeem.ssm.model.MaintainModel;

import java.util.List;

public interface MaintainService {
    List<MaintainModel> selectMaintainLimit(int index, int len);

    int getCount();

    List<Maintain> selectMaintainAll();

    List<MaintainModel> selectMaintainModelStatus(String status);

    boolean insertMaintain(Maintain maintain);

    MaintainModel selectModelByMId(int id);

    boolean updateById(Maintain maintain);

    Maintain selectById(int id);
}
