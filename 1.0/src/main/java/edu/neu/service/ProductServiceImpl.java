package edu.neu.service;

import edu.neu.dao.ProductMapper;
import edu.neu.pojo.Product;

import java.util.List;

public class ProductServiceImpl implements ProductService{

    private ProductMapper productMapper;

    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public int addProduct(Product product) {
        return productMapper.addProduct(product);
    }

    @Override
    public int deleteProductById(long id) {
        return productMapper.deleteProductById(id);
    }

    @Override
    public int deleteProductByTypeId(long typeid) {
        return productMapper.deleteProductByTypeId(typeid);
    }

    @Override
    public int updateProduct(Product product) {
        return productMapper.updateProduct(product);
    }

    @Override
    public List<Product> queryAllProduct() {
        return productMapper.queryAllProduct();
    }

    @Override
    public Product queryProductById(long id) {
        return productMapper.queryProductById(id);
    }
}
