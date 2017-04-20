package com.oracle.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.ProductDao;
import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;

@Component(value="productDao")
public class ProductDaoImpl extends PageSuport implements ProductDao {
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void addProduct(Product product) {
		this.getSession().save(product);
		
	}

	
	@Transactional(readOnly=true)
	public PageModel getAllProductPage(String hql, int offset, int pagesize) {
		
		return this.getRecordsByPage(hql, offset, pagesize);
	}


	
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteProduct(Product product) {
		this.getSession().delete(product);
		
	}


	
	@Transactional(readOnly=true)
	public Product getProductById(int id) {
		Product prod = null;
		String hql = "from Product p where p.id = ?";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		List<Product> prods = q.list();
		if (prods.size() > 0) {
			prod = prods.get(0);
		}
		return prod;
	}


	
	@Transactional(propagation=Propagation.REQUIRED)
	public void modifyProduct(Product product) {
		this.getSession().update(product);
		
	}


	
	@Transactional(readOnly=true)
	public List<Product> getProdByIssale() {
		String hql = "from Product p where p.issale = 1 and rownum < 5";
		
		return this.getSession().createQuery(hql).list();
	}


	
	@Transactional(readOnly=true)
	public List<Product> getProdByIsnew() {
		String hql = "from Product p  where p.isnew = 1 and rownum < 5 order by p.id";
		
		return this.getSession().createQuery(hql).list();
	}
	
	@Transactional(readOnly=true)
	public List<Product> getProdByIspecial() {
		String hql = "from Product p  where p.isspecial = 1 and rownum < 5 order by p.id";
		return this.getSession().createQuery(hql).list();
	}


	
	@Transactional(readOnly=true)
	public List<Product> getProdBySuperTypeId(int id) {
		String hql = "from Product p where p.superType.id = ? and rownum < 9";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		return q.list();
	}


	
	@Transactional(readOnly=true)
	public List<Product> getProdBySuperTypeIdPage(int startpage,
			int pagesizeno, int id) {
		String hql = "from Product p where p.superType.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		q.setFirstResult(startpage*pagesizeno);//0 ,1
		q.setMaxResults(pagesizeno);//5
		List<Product> prods = q.list();
		return prods;
	}


	
	@Transactional(readOnly=true)
	public int getCount(int id) {
		String hql = "from Product p where p.superType.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		return q.list().size();
	}


	
	@Transactional(readOnly=true)
	public List<Product> getProdBySubTypeIdPage(int startpage, int pagesizeno,
			int id) {
		String hql = "from Product p where p.subType.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		q.setFirstResult(startpage*pagesizeno);//0 ,1
		q.setMaxResults(pagesizeno);//5
		List<Product> prods = q.list();
		return prods;
	}


	
	@Transactional(readOnly=true)
	public int getCountBySubType(int id) {
		String hql = "from Product p where p.subType.id = ? ";
		Query q = this.getSession().createQuery(hql);
		q.setInteger(0, id);
		return q.list().size();
	}

}
