package com.oracle.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.SubTypeDao;
import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;

@Component(value="subTypeDao")
public class SubTypeDaoImpl extends PageSuport implements SubTypeDao {

	
	@Transactional(propagation=Propagation.REQUIRED)
	public void addSubType(SubType subType) {
		this.getSession().save(subType);
	}

	
	@Transactional(readOnly=true)
	public PageModel getAllSubTypePage(String hql, int offset, int pagesize) {
		
		return this.getRecordsByPage(hql, offset, pagesize);
	}


	
	@Transactional(readOnly=true)
	public SubType getSubTypeById(int id) {
		SubType subt = null;
		String hql = "from SubType sbt where sbt.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<SubType> subts = q.list();
		if (subts.size() > 0) {
			subt = subts.get(0);
		}
		return subt;
	}


	
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteSubType(SubType subtype) {
		this.getSession().delete(subtype);
	}


	
	@Transactional(propagation=Propagation.REQUIRED)
	public void modifySubType(SubType subType) {
		this.getSession().update(subType);
//		String hql = "Update SubType as sut set sut.superType.id = ? ,sut.subtypename = ? where sut.id = ?";
//		Query q = this.getSession().createQuery(hql);
//		q.setInteger(0, subType.getSuperType().getId());
//		q.setString(1, subType.getSubtypename());
//		q.setInteger(2, subType.getId());
//		q.executeUpdate();
		
	}


	
	@Transactional(readOnly=true)
	public SubType getSubTypeByName(String subtypename) {
		SubType subt = null; 
		String hql = "from SubType sut where sut.subtypename = ?";
		Query q = this.getSession().createQuery(hql);
		q.setString(0, subtypename);
		List<SubType> subts = q.list();
		if (subts.size() > 0) {
			subt = subts.get(0);
		}
		return subt;
	}


	
	@Transactional(readOnly=true)
	public List<SubType> getSubTypeBySuperTypeId(int id) {
		String hql = "from SubType subt where subt.superType.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<SubType> subts = q.list();
		return subts;
	}


	
	@Transactional(readOnly=true)
	public List<SubType> getAllSubType() {
		String hql = "from SubType";
		Query q = this.getSession().createQuery(hql);
		List<SubType> subts = q.list();
		return subts;
	}


	
	@Transactional(readOnly=true)
	public List<SubType> getSubTypeById(int startpage, int pagesizeno, int id) {
		String hql = "from SubType sbt where sbt.superType.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		q.setFirstResult(startpage*pagesizeno);//0 ,1
		q.setMaxResults(pagesizeno);//5
		List<SubType> subtypes = q.list();
		return subtypes;
	}


	
	@Transactional(readOnly=true)
	public int getCount(int id) {
		String hql = "from SubType sbt where sbt.superType.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<SubType> subtypes = q.list();
		int count = subtypes.size();
		return count;
	}


	@Override
	public List<Product> getallproductBysubtype(int id) {
		System.out.println("id%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+id);
		String sql = "select * from  product where SUBTYPEID = ?";
//		Query q = getSession().createQuery("from Product where subType.id = ?");
//		q.setInteger(0, id);
//		List<Product> products = q.list();
		SQLQuery sq = getSession().createSQLQuery(sql);
		sq.setInteger(0, id);
		List<Product> products = sq.list();
		return products;
	}

}
