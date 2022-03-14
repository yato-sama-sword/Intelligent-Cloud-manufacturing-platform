package edu.neu.service;

import edu.neu.dao.ProductTypeMapper;
import edu.neu.pojo.ProductType;

import java.util.List;

public class ProductTypeServiceImpl implements ProductTypeService{

    //设置一个set接口调用dao层的操作，方便Spring管理
    private ProductTypeMapper productTypeMapper;
    public void setProductTypeMapper(ProductTypeMapper productTypeMapper){this.productTypeMapper=productTypeMapper;};

    @Override
    public int addProductType(ProductType productType) {
        return productTypeMapper.addProductType(productType);
    }

    @Override
    public int deleteProductTypeById(long id) {
        return productTypeMapper.deleteProductTypeById(id);
    }

    @Override
    public int updateProductType(ProductType productType) {
        return productTypeMapper.updateProductType(productType);
    }

    @Override
    public List<ProductType> queryAllProductType() {
        return productTypeMapper.queryAllProductType();
    }

    @Override
    public ProductType queryProductTypeById(long id) {
        return productTypeMapper.queryProductTypeById(id);
    }

}
