package com.oracle.service;

import java.util.List;

import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.util.PageModel;


public interface SubTypeService {

	
	public void addSubType(SubType subType);

	
	public PageModel getAllSubTypePage(String hql, int offset, int pagesize);

	
	public SubType getSubTypeById(int id);

	
	public void deleteSubType(SubType subtype);

	
	public void modifySubType(SubType subType);

	
	public SubType getSubTypeByName(String subtypename);

	
	public List<SubType> getSubTypeBySuperTypeId(int id);

	
	public List<SubType> getAllSubType();

	
	public List<SubType> getSubTypeById(int startpage, int pagesizeno, int id);

	
	public int getCount(int id);

	public List<Product> getallproductBysubtype(int id);

}
