package com.oracle.test;

import javax.annotation.Resource;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.oracle.dao.AdDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class Test {
	@Resource
	private AdDao adDao;
	@org.junit.Test
	public void test(){
		System.out.println(adDao.getAllAd("from Advert", 0, 10));
		
	}
	public AdDao getAdDao() {
		return adDao;
	}
	public void setAdDao(AdDao adDao) {
		this.adDao = adDao;
	}
}
