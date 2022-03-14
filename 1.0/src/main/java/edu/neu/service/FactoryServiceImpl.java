package edu.neu.service;

import edu.neu.dao.FactoryMapper;
import edu.neu.pojo.Factory;

import java.util.List;

public class FactoryServiceImpl implements FactoryService{
    private FactoryMapper factoryMapper;

    public void setFactoryMapper(FactoryMapper factoryMapper) {
        this.factoryMapper = factoryMapper;
    }

    @Override
    public int addFactory(Factory factory) {
        return factoryMapper.addFactory(factory);
    }

    @Override
    public int deleteFactoryById(long id) {
        return factoryMapper.deleteFactoryById(id);
    }

    @Override
    public int updateFactory(Factory factory) {
        return factoryMapper.updateFactory(factory);
    }

    @Override
    public List<Factory> queryAllFactory() {
        return factoryMapper.queryAllFactory();
    }

    @Override
    public Factory queryFactoryByUserId(long userid) {
        return factoryMapper.queryFactoryByUserId(userid);
    }

    @Override
    public Factory queryFactoryById(long id) {
        return factoryMapper.queryFactoryById(id);
    }
}
