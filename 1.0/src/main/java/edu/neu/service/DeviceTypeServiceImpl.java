package edu.neu.service;

import edu.neu.dao.DeviceTypeMapper;
import edu.neu.dao.UserinfoMapper;
import edu.neu.pojo.DeviceType;

import java.util.List;

public class DeviceTypeServiceImpl implements DeviceTypeService{

    //设置一个set接口调用dao层的操作，方便Spring管理
    private DeviceTypeMapper deviceTypeMapper;
    public void setDeviceTypeMapper(DeviceTypeMapper deviceTypeMapper){
        this.deviceTypeMapper=deviceTypeMapper;
    }

    @Override
    public int addDeviceType(DeviceType deviceType) {
        return deviceTypeMapper.addDeviceType(deviceType);
    }

    @Override
    public int deleteDeviceTypeById(long id) {
        return deviceTypeMapper.deleteDeviceTypeById(id);
    }

    @Override
    public int updateDeviceType(DeviceType deviceType) {
        return deviceTypeMapper.updateDeviceType(deviceType);
    }

    @Override
    public DeviceType queryDeviceTypeById(long id) {
        return deviceTypeMapper.queryDeviceTypeById(id);
    }

    @Override
    public List<DeviceType> queryAllDeviceType() {
        return deviceTypeMapper.queryAllDeviceType();
    }


}
