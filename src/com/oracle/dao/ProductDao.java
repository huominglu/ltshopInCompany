package com.oracle.dao;

import java.util.List;

import com.oracle.model.Product;
import com.oracle.util.PageModel;


public interface ProductDao {

	
	public void addProduct(Product product);

	
	public PageModel getAllProductPage(String hql, int offset, int pagesize);

	
	public void deleteProduct(Product product);

	
	public Product getProductById(int id);

	
	public void modifyProduct(Product product);

	public List<Product> getProdByIssale();

	
	public List<Product> getProdByIsnew();

	
	public List<Product> getProdByIspecial();

	
	public List<Product> getProdBySuperTypeId(int id);

	
	public List<Product> getProdBySuperTypeIdPage(int startpage,
			int pagesizeno, int id);

	
	public int getCount(int id);

	
	public List<Product> getProdBySubTypeIdPage(int startpage, int pagesizeno,
			int id);

	
	public int getCountBySubType(int id);

}
