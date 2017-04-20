package com.oracle.service;

import java.util.List;

import com.oracle.model.SuperType;
import com.oracle.util.PageModel;


public interface SuperTypeService {
	
	public void addSuperType(SuperType superType);

	
	public SuperType getSuperTypeByName(String supertypename);

	
	public List<SuperType> getAllSuperType();

	
	public void deleteSuperTypeById(SuperType superType);

	
	public SuperType getSuperTypeById(Integer supertypeid);

	
	public void modifySuperType(SuperType superType);

	
	public PageModel getAllSuperTypePage(String hql, int offset, int pagesize);

}
