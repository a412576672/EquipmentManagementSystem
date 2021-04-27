package com.softeem.ssm.service.impl;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.ClassifyExample;
import com.softeem.ssm.mapper.ClassifyMapper;
import com.softeem.ssm.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ClassifyServiceImpl implements ClassifyService {
    @Autowired
    private ClassifyMapper classifyMapper;
    @Override
    public List<Classify> getClassifyLimit(int index, int len) {
        ClassifyExample classifyExample = new ClassifyExample();
        return classifyMapper.selectByExampleLimit(classifyExample,(index-1)*len,len);
    }

    @Override
    public List<Classify> getClassifyAll() {
        return classifyMapper.selectByExample(null);
    }

    @Override
    public int getCount() {
        return (int) classifyMapper.countByExample(null);
    }

    @Override
    public Classify getClassifyById(int id) {
        return classifyMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateClassify(Classify classify) {
        return classifyMapper.updateByPrimaryKeySelective(classify)>0;
    }

    @Override
    public boolean addClassify(Classify classify) {
        return classifyMapper.insertSelective(classify)>0;
    }
}
