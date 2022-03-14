package edu.neu.service;

import edu.neu.pojo.Product;

import java.util.List;

public interface ProductService {
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
