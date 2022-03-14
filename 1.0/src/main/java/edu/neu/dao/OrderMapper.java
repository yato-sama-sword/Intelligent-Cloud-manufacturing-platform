package edu.neu.dao;

import edu.neu.pojo.Order;

import java.util.List;

/**
 * 实现订单的crud操作
 */
public interface OrderMapper {
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
