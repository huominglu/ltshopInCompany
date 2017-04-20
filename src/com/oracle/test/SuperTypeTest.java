package com.oracle.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.oracle.model.SuperType;
import com.oracle.service.SuperTypeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class SuperTypeTest {
	@Resource
	private SuperTypeService superTypeService;
//	@Test
//	public void addSuperTypeTest(){
//		SuperType sp = new SuperType();
//		sp.setSuperTypeName("汽车用品");
//		superTypeService.addSuperType(sp);
//	}
	
//	@Test
//	public void modifySuperTypeTest(){
//		SuperType sp = new SuperType();
//		sp.setId(2);
//		sp.setSuperTypeName("图书、音像、电子书");
////		superTypeService.modifySuperType(sp);
//	}
	
	@Test
	public void getSuperTypeTest(){		
		SuperType sp = superTypeService.getSuperTypeByName("家用电器"); 
		System.out.println(sp.getId()+"============"+sp.getSuperTypeName());
	}
}
