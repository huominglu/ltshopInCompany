package com.oracle.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.AdDao;
import com.oracle.model.Advert;
import com.oracle.model.Notice;
import com.oracle.util.PageModel;
import com.oracle.util.PageSuport;
@Component(value="adDao")
public class AdDaoImpl extends PageSuport implements AdDao {

	//获取所有广告
	@Transactional(readOnly=true)
	public PageModel getAllAd(String hql, int offset, int pagesize) {
		return getRecordsByPage(hql, offset, pagesize);
	}
	//添加广告
	@Transactional(propagation=Propagation.REQUIRED)
	public void adAdd(Advert advert) {
		getSession().save(advert);
		
	}
	//通过ID查询广告
	@Transactional(readOnly=true)
	public Advert getAdById(int id) {
		Advert ad = (Advert) getSession().get(Advert.class, id);
		return ad;
	}
	//修改广告
	@Transactional(propagation=Propagation.REQUIRED)
	public void adModify(Advert advert) {
		getSession().update(advert);
	}
	//删除广告
	@Transactional(propagation=Propagation.REQUIRED)
	public void deleteAd(Advert ad) {
		getSession().delete(ad);
	}
	
	//前台显示显示广告
	@Transactional(readOnly=true)
	public List<Advert> getNewAd() {
		Query q = getSession().createQuery("from Advert order by id desc");
		q.setMaxResults(4);
		List<Advert> ads = q.list();
		return ads;
	}

}
