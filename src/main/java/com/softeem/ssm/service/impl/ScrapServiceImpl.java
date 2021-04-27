package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Scrap;
import com.softeem.ssm.entity.ScrapExample;
import com.softeem.ssm.mapper.ScrapMapper;
import com.softeem.ssm.model.ScrapModel;
import com.softeem.ssm.service.ScrapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScrapServiceImpl implements ScrapService {
    @Autowired
    private ScrapMapper scrapMapper;

    @Override
    public List<ScrapModel> selectScrapModelLimit(int index, int len) {
        ScrapExample scrapExample = new ScrapExample();
        scrapExample.setLimitIndex((index-1)*len);
        scrapExample.setLimitLen(len);
        return scrapMapper.selectScrapModelByIdLimit(scrapExample);
    }

    @Override
    public int getCount() {
        return (int) scrapMapper.countByExample(null);
    }

    @Override
    public boolean insertScrap(Scrap scrap) {
        return scrapMapper.insertSelective(scrap)>0;
    }
}
