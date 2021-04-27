package com.softeem.ssm.service;

import com.softeem.ssm.entity.Classify;

import java.util.List;

public interface ClassifyService {
    List<Classify> getClassifyLimit(int index, int len);

    List<Classify> getClassifyAll();

    int getCount();

    Classify getClassifyById(int id);

    boolean updateClassify(Classify classify);

    boolean addClassify(Classify classify);
}
