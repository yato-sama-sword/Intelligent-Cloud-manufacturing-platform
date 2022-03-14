package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

/**
 * 对应数据库中的排产
 */
public class Schedule {
    private long ID;
    private long orderid;
    private long deviceid;
    private String begindate;
    private String enddate;
    //顺便存储对应实体
    private Order order;
    private Device device;
}
