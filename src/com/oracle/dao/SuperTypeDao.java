package com.oracle.dao;

import java.util.List;

import com.oracle.model.SuperType;
import com.oracle.util.PageModel;


public interface SuperTypeDao {

	
	public void addSuperType(SuperType superType);

	
	public SuperType getSuperTypeByName(String supertypename);


	
	public List<SuperType> getAllSuperType();


	public void deleteSuperTypeById(SuperType supertType);


	
	public SuperType getSuperTypeById(Integer supertypeid);


	
	public void modifySuperType(SuperType superType);


	/**
	 * @param hql
	 * @param offset
	 * @param pagesize
	 * @return
	 */
	public PageModel getAllSuperTypePage(String hql, int offset, int pagesize);

}
