package edu.neu.dao;

import edu.neu.pojo.Product;

import java.util.List;

/**
 * 实现产品的crud操作
 */
public interface ProductMapper {
    //添加
    int addProduct(Product product);
    //删除
    int deleteProductById(long id);
    int deleteProductByTypeId(long typeid);
    //更新
    int updateProduct(Product product);
    //查询
    List<Product> queryAllProduct();
    Product queryProductById(long id);
}
