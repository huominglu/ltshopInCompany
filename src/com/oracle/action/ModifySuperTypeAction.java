package com.oracle.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.oracle.model.SuperType;
import com.oracle.service.SuperTypeService;

@Controller
public class ModifySuperTypeAction {
	@Resource
	private SuperTypeService superTypeService;
	
	//struts2×Ô¶¯·â×°
	private SuperType superType;

	public SuperTypeService getSuperTypeService() {
		return superTypeService;
	}

	public void setSuperTypeService(SuperTypeService superTypeService) {
		this.superTypeService = superTypeService;
	}

	public SuperType getSuperType() {
		return superType;
	}

	public void setSuperType(SuperType superType) {
		this.superType = superType;
	}
	
	@Action(value="/modifysupertype",results=@Result(name="success",type="redirect",location="pagemodel"))
	public String modifySuperType(){
		superTypeService.modifySuperType(this.superType);
		return "success";
	}
}
