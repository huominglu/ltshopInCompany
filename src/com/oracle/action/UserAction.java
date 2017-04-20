package com.oracle.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.User;
import com.oracle.service.UserService;
import com.oracle.util.PageModel;
@Controller
@ParentPackage("json-default")
@Result(name="input",location="/error.jsp")
public class UserAction extends ActionSupport implements SessionAware,RequestAware {
	private String info;
	private String result;
	private User user;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private String code;
	private int id;
	private String ids;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	@Resource
	private UserService userService;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	//获取用户列表
	@Action(value="user_list",results={@Result(name="success",location="user/user_list.jsp")})
	public String user_list(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = null;
		if(user!= null ){
				hql = "from User  where  username like '%"+user.getUsername()+"%' or realname like '%"+user.getUsername()+"%'";
		}else{
			hql = "from User";
		}
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) {
		}
		
		PageModel pm  = userService.getAllUser(hql, offset, pagesize);
		
		request.put("pm", pm);
		return SUCCESS;
	}
	//前台用户注册
	@Action(value="register",results={@Result(name="success",location="/login.jsp")})
	public String register(){
		user.setScore(1000);
		user.setStatus("可用");
		userService.registerUser(user);
		request.put("registerinfo", "恭喜您，注册成功！");
		return SUCCESS;
	}
	//注册验证
	@Action(value="registercheck",results={@Result(name="success",type="json",params={"root","result"})})
	public String registercheck(){
		User user = userService.checkRegister(info);
		Map<String,String> result = new HashMap<String,String>();
		if(user == null){
			result.put("re", "可以使用");
		}else{
			result.put("re", "已经存在");
		}
		this.result = JSONObject.fromObject(result).toString();
		return SUCCESS;
	}
	//前台用户登录
	@Action(value="login",results={@Result(name="success",location="/index.jsp"),
			@Result(name="error",location="/login.jsp")})
	public String login(){
		String securityCode = (String) session.get("securityCode");
		if(securityCode.equals(code)){
			User user = userService.loginUser(this.user);
			if(user != null){
				if(user.getStatus().equals("禁用")){
					request.put("infostatus", "此用户已被禁用");
					return ERROR;
				}else{
					session.put("user", user);
					return SUCCESS;
				}
			}else{
				request.put("infoname", "用户名或密码错误");
				return ERROR;
			}
		}else{
			request.put("infocode", "验证码错误");
			return ERROR;
		}
	}
	//用户信息修改
	@Action(value="userInfoModify",results={@Result(name="success",location="/index.jsp")})
	public String userInfoModify(){
		userService.modifyUser(this.user);
		session.put("user", user);
		return SUCCESS;
	}
	//用户禁用与启用
	@Action(value="userStatusModify",results={@Result(name="success",location="user_list",type="redirect")})
	public String userStatusModify(){
		User user = userService.getUserById(id);
		if(user.getStatus().equals("禁用")){
			user.setStatus("可用");
		}else{
			user.setStatus("禁用");
		}
		userService.modifyUser(user);
		return SUCCESS;
	}
	//删除用户
	@Action(value="userDelete",results={@Result(name="success",location="user_list",type="redirect")})
	public String userDelete(){
		User user = userService.getUserById(id);
		userService.deleteUser(user);
		return SUCCESS;
	}
	//退出登陆
	@Action(value="exitUser",results={@Result(name="success",location="/index.jsp")})
	public String exitUser(){
		session.clear();
		return SUCCESS;
	}
	//批量删除用户
	@Action(value="delSelectUser",results={@Result(name="success",location="user_list",type="redirect")})
	public String delSelectUser(){
		String[] idss = ids.split(",");
		for (String str : idss) {
			int tid = Integer.parseInt(str);
			User user = userService.getUserById(tid);
			userService.deleteUser(user);
		}
		return SUCCESS;
	}
	
	
	
	
}
