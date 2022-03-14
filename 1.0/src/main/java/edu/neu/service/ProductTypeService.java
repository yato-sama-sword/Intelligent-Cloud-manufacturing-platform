package edu.neu.service;

import edu.neu.pojo.ProductType;

import java.util.List;

public interface ProductTypeService {
    //添加产品类别信息
    int addProductType(ProductType productType);
    //删除产品类别信息
    int deleteProductTypeById(long id);
    //更新产品类别信息
    int updateProductType(ProductType productType);
    //查询产品类别信息
    List<ProductType> queryAllProductType();
    ProductType queryProductTypeById(long id);
}
