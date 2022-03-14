package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的订单
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Order {
    private long ID;
    private String orderno;
    private long productid;
    //订单的产品数目
    private int ordernum;
    //订单的投标截止日期
    private String deaddate;
    //订单的交付截止日期
    private String deliverdate;
    private int orderstatus;
    private long factoryid;
    //是经销商的id，其实也就是userid
    private long publisherid;
    //存储对应实体
    private Product product;
    private Factory factory;
    private Userinfo userinfo;
}
