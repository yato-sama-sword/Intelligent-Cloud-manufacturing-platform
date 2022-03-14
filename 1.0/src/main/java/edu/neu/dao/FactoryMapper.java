package edu.neu.dao;


import edu.neu.pojo.Factory;

import java.util.List;

/**
 * 实现工厂的crud操作
 */
public interface FactoryMapper {
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
