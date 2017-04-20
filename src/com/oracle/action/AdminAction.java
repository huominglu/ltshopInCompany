package com.oracle.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.service.AdminService;
import com.oracle.util.PageModel;


@ParentPackage("json-default")
@Controller
public class AdminAction extends ActionSupport implements SessionAware,RequestAware{
	private Admin admin;
	private Role role;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private String code;
	private String aname;
	private int aid;
	private String result;
	private String name;
	private String info;
	
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAdminname() {
		return name;
	}
	public void setRolename(String name) {
		this.name = name;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	public Role getRole() {
		return role;
	}
	
	public void setRole(Role role) {
		this.role = role;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Admin getAdmin() {
		return admin;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	

	@Resource
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	
	
	@Action(value="/loadaddadmin",results=@Result(name="success",location="ad/admin_add.jsp"))
	public String loadAddAdmin(){
		return SUCCESS;
	}
	//注册检查名字是否重复
	@Action(value="/checkadminname",results={@Result(name="success",type="json",params={"root","result"})})
	public String checkAdminName(){
		Admin admin = adminService.checkAdminName(this.admin.getName());
		Map<String,String> infos = new HashMap<String,String>();
		if(admin != null){
			infos.put("info", "该角色名称已经存在");
		}else if (this.admin.getName() == null || "".equals(this.admin.getName())) {
			infos.put("info", "该角色名称不能为空");
		}else{
			infos.put("info", "该角色名称可以使用");
		}
		JSONObject retinfo = JSONObject.fromObject(infos);
		this.result = retinfo.toString();
		return SUCCESS;
	}
	//添加管理员
	@Action(value="addadmin",results={@Result(name="success",location="listadmin",type="redirect")})
	public String addAdmin(){
		this.admin.setRole(this.role);
		adminService.addAdmin(this.admin);
		return SUCCESS;
	}
	//删除管理员
	@Action(value="deladmin",results={@Result(name="success",location="listadmin",type="redirect")})
	public String delAdmin(){
		adminService.delAdmin(this.admin);
		return SUCCESS;
	}
	//修改
	@Action(value="modifyadmin",results={@Result(name="success",location="listadmin",type="redirect")})
	public String modifyadmin(){
//		this.admin.setRole(this.role);
		adminService.modifyAdmin(this.admin);
		return SUCCESS;
	}	
	//查询管理员
	@Action(value="selectadmin",results={@Result(name="success",location="ad/admin_list.jsp")})
	public String selectAdmin(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = null;
		if("".equals(aname)||null == aname){
			hql = "from Admin";
		}else{
			if (info.equals("name")) {
				hql="from Admin a where a.name like '%"+this.aname+"%'";
			}else if(info.equals("rolename")){
				if(aname.equals("超级管理员")){
					hql="from Admin a where a.role.id = 1";
				}else{
					hql="from Admin a where a.role.id = 2";
				}
			}else if(info.equals("id")){
				hql="from Admin a where a.id = "+this.aname;
			}
		}
		

		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) {}
		PageModel adminpm = adminService.getAdminsbyname(hql, offset, pagesize);
		request.put("pm", adminpm);
		return SUCCESS;
	}
	//调出管理员列表
	@Action(value="listadmin",results={@Result(name="success",location="ad/admin_list.jsp")})
	public String listAdmin(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = "from Admin";
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) {}
		PageModel adminpm = adminService.getAllAdmins(hql, offset, pagesize);
		request.put("pm", adminpm);
		return SUCCESS;
	}
	//后台用户登陆
	@Action(value="/adminLogin",results={@Result(name="success",location="main.jsp"),
			@Result(name="error",location="userlogin.jsp")})
	public String adminLogin(){
		Admin admin = adminService.adminLogin(this.admin);
		String securityCode = (String) session.get("securityCode");
		System.out.println("securityCode:"+securityCode+"code:"+code+"==============================");
		if(securityCode.equals(code)){
			if(admin == null || "".equals(admin)){
				request.put("infoname", "用户名或密码错误");
				return ERROR;
			}else{
				session.put("admin", admin);
				return SUCCESS;
			}
		}else{
			request.put("infocode", "验证码错误");
			return ERROR;
		}
		
		
	}
//根据id调出admin
	@Action(value="getadminbyid",results={@Result(name="success",location="ad/admin_modify.jsp")})
	public String getAdminById(){
		Admin admin = adminService.getAdminById(this.admin);
		System.out.println("admin.getName():#######################"+admin.getName());
		request.put("admin", admin);
		return SUCCESS;
	}
	
		//动态调用数据库中的角色到页面
	@Action(value="/getallrole",results=@Result(name="success",type="json",params={"root","result"}))
	public String getAllRoles(){
		List<Role> roles = adminService.getAllRoles();
		JSONArray jarray = JSONArray.fromObject(roles);
		this.result = jarray.toString();
		return SUCCESS;
	}
	//实现用户退出
	@Action(value="/logout",results={@Result(name="success",location="userlogin.jsp")})
	public String logout(){
		session.remove("admin");
		return SUCCESS;
	}
}
