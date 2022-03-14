package edu.neu.service;

import edu.neu.pojo.Capacity;
import edu.neu.pojo.DeviceType;

import java.util.List;

public interface CapacityService {
    //配置产能
    int addCapacity(Capacity capacity);
    //删除产能
    int deleteCapacityById(long id);
    //更新产能
    int updateCapacity(Capacity capacity);
    //查询当前设备下所有产能
    Capacity queryCapacityById(long id);
    List<Capacity> queryAllCapacity();
    List<Capacity> queryAllCapacityByDeviceId(long deviceid);
}
