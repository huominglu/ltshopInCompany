package com.oracle.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
@Controller
public class UserLoginAction extends ActionSupport {

	@Action(value="/test",results={@Result(name="success",location="userlogin.jsp")})
	public String test(){
		return SUCCESS;
	}
}
