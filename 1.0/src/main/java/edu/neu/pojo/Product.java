package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的产品
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Product {
    private long ID;
    private long typeid;
    private String productname;
    private String norms;
    private String describe;
    private String productno;
    //顺便存储对应的产品类型信息
    private ProductType productType;
}
