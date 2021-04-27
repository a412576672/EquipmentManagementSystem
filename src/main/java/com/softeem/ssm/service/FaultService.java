package com.softeem.ssm.service;

import com.softeem.ssm.entity.Fault;
import com.softeem.ssm.model.FaultModel;

import java.util.List;

public interface FaultService {
    List<FaultModel> getFaultAllLimit(int index, int len);

    int getCount();

    boolean insertFault(Fault fault);

    FaultModel selectFaultModelById(int id);

    List<FaultModel> getFaultAll();

    boolean deleteFault(int id);
}
