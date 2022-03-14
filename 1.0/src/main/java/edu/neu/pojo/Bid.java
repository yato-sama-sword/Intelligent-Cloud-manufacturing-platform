package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 对应数据库里的投标
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Bid {
    private long ID;
    private long orderid;
    private long factoryid;
    private Double bidprice;
    //0代表未中标 1代表中标
    private int bidstatus;
    //
    private Order order;
    private Factory factory;
}
