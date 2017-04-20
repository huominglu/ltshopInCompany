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
//		sp.setSuperTypeName("������Ʒ");
//		superTypeService.addSuperType(sp);
//	}
	
//	@Test
//	public void modifySuperTypeTest(){
//		SuperType sp = new SuperType();
//		sp.setId(2);
//		sp.setSuperTypeName("ͼ�顢���񡢵�����");
////		superTypeService.modifySuperType(sp);
//	}
	
	@Test
	public void getSuperTypeTest(){		
		SuperType sp = superTypeService.getSuperTypeByName("���õ���"); 
		System.out.println(sp.getId()+"============"+sp.getSuperTypeName());
	}
}
