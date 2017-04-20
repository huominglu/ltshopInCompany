package com.oracle.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.Product;

@Controller
public class TestAction extends ActionSupport implements RequestAware{
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	
	@Action(value="/test",results={@Result(name="success",location="userlogin.jsp")})
	public String test(){
		return SUCCESS;
	}
	@Action(value="/test2",results={@Result(name="success",location="/view.jsp")})
	public String test2(){
		Product p = new Product();
		p.setId(45);
		p.setProductname("要评论的商品");
		p.setPicture("7504b1f2-1748-4d6b-a994-442411841396.jpg");
		request.put("prod", p);
		return SUCCESS;
	}
	
}
