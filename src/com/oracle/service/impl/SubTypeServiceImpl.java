package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.SubTypeDao;
import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.service.SubTypeService;
import com.oracle.util.PageModel;

@Component(value="subTypeService")
public class SubTypeServiceImpl implements SubTypeService {
	
	@Resource
	private SubTypeDao subTypeDao;
	
	public SubTypeDao getSubTypeDao() {
		return subTypeDao;
	}

	public void setSubTypeDao(SubTypeDao subTypeDao) {
		this.subTypeDao = subTypeDao;
	}

	@Override
	public void addSubType(SubType subType) {
		subTypeDao.addSubType(subType);
	}

	
	@Override
	public PageModel getAllSubTypePage(String hql, int offset, int pagesize) {
		
		return subTypeDao.getAllSubTypePage(hql,offset,pagesize);
	}

	
	@Override
	public SubType getSubTypeById(int id) {
		
		return subTypeDao.getSubTypeById(id);
	}

	
	@Override
	public void deleteSubType(SubType subtype) {
		subTypeDao.deleteSubType(subtype);
		
	}

	
	@Override
	public void modifySubType(SubType subType) {
		subTypeDao.modifySubType(subType);
		
	}

	
	@Override
	public SubType getSubTypeByName(String subtypename) {
		
		return subTypeDao.getSubTypeByName(subtypename);
	}

	
	@Override
	public List<SubType> getSubTypeBySuperTypeId(int id) {
		
		return subTypeDao.getSubTypeBySuperTypeId(id);
	}

	
	@Override
	public List<SubType> getAllSubType() {
		
		return subTypeDao.getAllSubType();
	}

	
	@Override
	public List<SubType> getSubTypeById(int startpage, int pagesizeno, int id) {
		
		return subTypeDao.getSubTypeById(startpage,pagesizeno,id);
	}

	
	@Override
	public int getCount(int id) {
		
		return subTypeDao.getCount(id);
	}

	@Override
	public List<Product> getallproductBysubtype(int id) {
		return subTypeDao.getallproductBysubtype(id);
	}

}
