package edu.neu.service;

import edu.neu.pojo.Device;

import java.util.List;

public interface DeviceService {
    //添加
    int addDevice(Device device);
    //删除
    int deleteDeviceById(long id);
    int deleteDeviceByTypeId(long typeid);
    //更新
    int updateDevice(Device device);
    int updateDeviceStatus(Device device);
    int repairDeviceById(long id);
    //查询
    List<Device> queryAllDevice();
    Device queryDeviceById(long id);
    List<Device> queryDeviceByFactoryId(long factoryid);
}
