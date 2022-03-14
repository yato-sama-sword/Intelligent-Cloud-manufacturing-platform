package edu.neu.service;

import edu.neu.pojo.DeviceType;

import java.util.List;

public interface DeviceTypeService {

    //添加设备类型信息
    int addDeviceType(DeviceType deviceType);
    //删除设备类型信息
    int deleteDeviceTypeById(long id);
    //更新设备类型信息
    int updateDeviceType(DeviceType deviceType);
    //id查询设备类别信息
    DeviceType queryDeviceTypeById(long id);
    //查询全部设备类型信息
    List<DeviceType> queryAllDeviceType();

}
