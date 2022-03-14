package edu.neu.dao;

import edu.neu.pojo.Capacity;

import java.util.List;

/**
 * 实现产能的crud操作
 * 对于产能的操作应该有
 * 1.配置 2.更新 3.删除
 */
public interface CapacityMapper {
    //配置产能
    int addCapacity(Capacity capacity);
    //删除产能
    int deleteCapacityById(long id);
    //更新产能
    int updateCapacity(Capacity capacity);
    //查询当前设备下所有产能
    List<Capacity> queryAllCapacity();
    Capacity queryCapacityById(long id);
    List<Capacity> queryAllCapacityByDeviceId(long deviceid);
}
