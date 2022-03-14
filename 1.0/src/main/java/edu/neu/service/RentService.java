package edu.neu.service;

import edu.neu.pojo.Rent;

import java.util.List;

public interface RentService {
    //添加
    int addRent(Rent rent);
    //删除
    int deleteRent(long id);
    //查询
    List<Rent> queryAllRent();
    Rent queryRentById(long id);
}
