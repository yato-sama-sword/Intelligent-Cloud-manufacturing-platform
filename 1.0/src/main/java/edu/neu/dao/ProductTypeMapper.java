package edu.neu.dao;

import edu.neu.pojo.ProductType;

import java.util.List;

/**
 * 实现产品类型的crud操作
 */
public interface ProductTypeMapper {
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
