package edu.neu.dao;

import edu.neu.pojo.Rent;

import java.util.List;

/**
 * 实现租用的crud操作
 */
public interface RentMapper {
    //添加
    int addRent(Rent rent);
    //删除
    int deleteRent(long id);
    //查询
    List<Rent> queryAllRent();
    Rent queryRentById(long id);
}
