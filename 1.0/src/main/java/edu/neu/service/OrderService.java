package edu.neu.service;

import edu.neu.pojo.Order;

import java.util.List;

public interface OrderService {
    //添加
    int addOrder(Order order);
    //删除
    int deleteOrderById(long id);
    //更新
    int updateOrder(Order order);
    int updateOrderInfo(Order order);
    //查询
    List<Order> queryAllOrder();
    Order queryOrderById(long id);
}
