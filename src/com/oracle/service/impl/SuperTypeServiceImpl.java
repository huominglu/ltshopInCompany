package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.SuperTypeDao;
import com.oracle.model.SuperType;
import com.oracle.service.SuperTypeService;
import com.oracle.util.PageModel;

@Component(value="superTypeService")
public class SuperTypeServiceImpl implements SuperTypeService {
	@Resource
	private SuperTypeDao superTypeDao;
	
	
	
	public SuperTypeDao getSuperTypeDao() {
		return superTypeDao;
	}



	public void setSuperTypeDao(SuperTypeDao superTypeDao) {
		this.superTypeDao = superTypeDao;
	}



	
	public void addSuperType(SuperType superType) {
		
		superTypeDao.addSuperType(superType);
	}



	
	public SuperType getSuperTypeByName(String supertypename) {
		
		return superTypeDao.getSuperTypeByName(supertypename);
	}



	
	public List<SuperType> getAllSuperType() {
		
		return superTypeDao.getAllSuperType();
	}

	public void deleteSuperTypeById(SuperType superType) {
		superTypeDao.deleteSuperTypeById(superType);
	}



	
	@Override
	public SuperType getSuperTypeById(Integer supertypeid) {
		
		return superTypeDao.getSuperTypeById(supertypeid);
	}



	
	@Override
	public void modifySuperType(SuperType superType) {
		
		superTypeDao.modifySuperType(superType);
	}



	
	@Override
	public PageModel getAllSuperTypePage(String hql, int offset, int pagesize) {
		
		return superTypeDao.getAllSuperTypePage(hql,offset,pagesize);
	}

}
