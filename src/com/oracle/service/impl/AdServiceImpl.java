package com.oracle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.oracle.dao.AdDao;
import com.oracle.model.Advert;
import com.oracle.model.Notice;
import com.oracle.service.AdService;
import com.oracle.util.PageModel;
@Component(value="adService")
public class AdServiceImpl implements AdService {
	@Resource
	private AdDao adDao;
	public AdDao getAdDao() {
		return adDao;
	}
	public void setAdDao(AdDao adDao) {
		this.adDao = adDao;
	}
	@Override
	public PageModel getAllAd(String hql, int offset, int pagesize) {
		return adDao.getAllAd(hql,offset,pagesize);
	}
	@Override
	public void adAdd(Advert advert) {
		adDao.adAdd(advert);
		
	}
	@Override
	public Advert getAdById(int id) {
		return adDao.getAdById(id);
	}
	@Override
	public void adModify(Advert advert) {
		adDao.adModify(advert);
	}
	@Override
	public void deleteAd(Advert ad) {
		adDao.deleteAd(ad);
	}
	@Override
	public List<Advert> getNewAd() {
		return adDao.getNewAd();
	}
	

}
