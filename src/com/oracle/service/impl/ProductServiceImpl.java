package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.ProductDao;
import com.oracle.model.Product;
import com.oracle.service.ProductService;
import com.oracle.util.PageModel;

@Component(value="productService")
public class ProductServiceImpl implements ProductService {
	@Resource
	private ProductDao productDao;

	
	public ProductDao getProductDao() {
		return productDao;
	}


	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}


	@Override
	public void addProduct(Product product) {
		productDao.addProduct(product);
		
	}


	
	@Override
	public PageModel getAllProductPage(String hql, int offset, int pagesize) {
		
		return productDao.getAllProductPage(hql,offset,pagesize);
	}


	
	@Override
	public void deleteProduct(Product product) {
		productDao.deleteProduct(product);
		
	}


	
	@Override
	public Product getProductById(int id) {
		
		return productDao.getProductById(id);
	}


	
	@Override
	public void modifyProduct(Product product) {
		productDao.modifyProduct(product);
		
	}


	
	@Override
	public List<Product> getProdByIssale() {
		
		return productDao.getProdByIssale();
	}


	
	@Override
	public List<Product> getProdByIsnew() {
		
		return productDao.getProdByIsnew();
	}


	
	@Override
	public List<Product> getProdByIspecial() {
		
		return productDao.getProdByIspecial();
	}


	
	@Override
	public List<Product> getProdBySuperTypeId(int id) {
		
		return productDao.getProdBySuperTypeId(id);
	}


	
	@Override
	public List<Product> getProdBySuperTypeIdPage(int startpage,
			int pagesizeno, int id) {
		
		return productDao.getProdBySuperTypeIdPage(startpage,pagesizeno,id);
	}


	
	@Override
	public int getCount(int id) {
		
		return productDao.getCount(id);
	}


	
	@Override
	public List<Product> getProdBySubTypeIdPage(int startpage, int pagesizeno,
			int id) {
		
		return productDao.getProdBySubTypeIdPage(startpage,pagesizeno,id);
	}


	
	@Override
	public int getCountBySubType(int id) {
		
		return productDao.getCountBySubType(id);
	}


	
	
}
