package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 对应数据库中的产能
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Capacity {
    private long ID;
    private long deviceid;
    private long productid;
    private long velocity;
    //顺带存储实体
    private Device device;
    private Product product;
}
