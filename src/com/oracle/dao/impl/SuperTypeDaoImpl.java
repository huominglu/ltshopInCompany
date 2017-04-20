package com.oracle.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.SuperTypeDao;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;

@Component(value="superTypeDao")
public class SuperTypeDaoImpl extends PageSuport implements SuperTypeDao {
	
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void addSuperType(SuperType superType) {
		this.getSession().save(superType);
	}


	
	@Transactional(readOnly=true)
	public SuperType getSuperTypeByName(String supertypename) {
		SuperType superType = null;
		String hql = "from SuperType st where st.superTypeName=?";
		Query q = this.getSession().createQuery(hql);
		q.setString(0, supertypename);
		List<SuperType> sts = q.list();
		if (sts.size() > 0) {
			superType = sts.get(0);
		}
		return superType;
	}


	
	@Transactional(readOnly=true)
	public List<SuperType> getAllSuperType() {
		String hql = "from SuperType";
		Query q = this.getSession().createQuery(hql);
		List<SuperType> sts = q.list();
		List<SubType> subs = sts.get(0).getSubtypes();
		return sts;
	}


	
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteSuperTypeById(SuperType superType) {
//		String hql = "delete from SuperType st where st.id = ?";
//		Query q = this.getSession().createQuery(hql);
//		q.setInteger(0, supertypeid);
//		int count = q.executeUpdate();
//		return count;
		this.getSession().delete(superType);
	}


	
	@Transactional(readOnly=true)
	public SuperType getSuperTypeById(Integer supertypeid) {
		SuperType st = null;
		String hql = "from SuperType st where st.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, supertypeid);
		List<SuperType> sts = q.list();
		if (sts.size() > 0) {
			st = sts.get(0);
		}
		return st;
	}


	
	@Transactional(propagation=Propagation.REQUIRED)
	public void modifySuperType(SuperType superType) {
//		String hql = "update SuperType as st set st.superTypeName = ? where st.id=?";
//		Query q = this.getSession().createQuery(hql);
//		q.setString(0, superType.getSuperTypeName());
//		q.setInteger(1, superType.getId());
//		int count = q.executeUpdate();
		this.getSession().update(superType);
	}



	
	@Transactional(readOnly=true)
	public PageModel getAllSuperTypePage(String hql, int offset, int pagesize) {
		
		return this.getRecordsByPage(hql,offset,pagesize);
	}

}
