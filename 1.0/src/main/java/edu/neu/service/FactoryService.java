package edu.neu.service;

import edu.neu.pojo.Factory;

import java.util.List;

public interface FactoryService {
    //添加
    int addFactory(Factory factory);
    //删除
    int deleteFactoryById(long id);
    //更新
    int updateFactory(Factory factory);
    //查询
    List<Factory> queryAllFactory();
    Factory queryFactoryByUserId(long userid);
    Factory queryFactoryById(long id);
}
