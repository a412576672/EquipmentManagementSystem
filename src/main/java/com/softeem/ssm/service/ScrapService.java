package com.softeem.ssm.service;

import com.softeem.ssm.entity.Scrap;
import com.softeem.ssm.model.ScrapModel;

import java.util.List;

public interface ScrapService {
    List<ScrapModel> selectScrapModelLimit(int index,int len);

    int getCount();

    boolean insertScrap(Scrap scrap);
}
