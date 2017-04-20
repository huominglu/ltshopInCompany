package com.oracle.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.oracle.model.Admin;
import com.oracle.model.Role;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.service.AdminService;
import com.oracle.service.SuperTypeService;
import com.oracle.util.PageModel;

@ParentPackage("json-default")
@Controller
public class SuperTypeAction implements RequestAware,SessionAware{
	//struts2自动封装
	private SuperType superType;
	
	//
	private String supertypename;
	
	private Integer supertypeid;
	
	//modify使用
	private Integer sTypeId;
	
	//modify使用
	private String sTypeName;
	
	private String result;
	
	private String ret;
	
	@Resource
	private SuperTypeService superTypeService;
	@Resource
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	private Map<String,Object> request;
	
	private Map<String,Object> session;
	
	private String ids;
	
	private String arr;
	
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getArr() {
		return arr;
	}

	public void setArr(String arr) {
		this.arr = arr;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getRet() {
		return ret;
	}

	public void setRet(String ret) {
		this.ret = ret;
	}

	public Integer getsTypeId() {
		return sTypeId;
	}

	public void setsTypeId(Integer sTypeId) {
		this.sTypeId = sTypeId;
	}

	public String getsTypeName() {
		return sTypeName;
	}

	public void setsTypeName(String sTypeName) {
		this.sTypeName = sTypeName;
	}

	public Integer getSupertypeid() {
		return supertypeid;
	}

	public void setSupertypeid(Integer supertypeid) {
		this.supertypeid = supertypeid;
	}

	public String getSupertypename() {
		return supertypename;
	}

	public void setSupertypename(String supertypename) {
		this.supertypename = supertypename;
	}
	
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public SuperType getSuperType() {
		return superType;
	}

	public void setSuperType(SuperType superType) {
		this.superType = superType;
	}

	public SuperTypeService getSuperTypeService() {
		return superTypeService;
	}

	public void setSuperTypeService(SuperTypeService superTypeService) {
		this.superTypeService = superTypeService;
	}

	@Action(value="/load",results=@Result(name="success",location="main.jsp"))
	public String loadPage(){
		return "success";
	}
	
	@Action(value="/loadaddsupertypepage",results=@Result(name="success",location="superType/superType_add.jsp"))
	public String loadAddSuperTypePage(){
		return "success";
	}
	
	@Action(value="/addsupertype",results=@Result(name="success",type="redirect",location="pagemodel"))
	public String addSuperType(){
		superTypeService.addSuperType(superType);
		return "success";
	}
//	@Action(value="/getallsupertype",results=@Result(name="success",type="json",params={"root","result"}))
//	public String getSuperTypes(){
//		List<SuperType> sts = superTypeService.getAllSuperType();
//		
//		List<SuperType> supts = new ArrayList<SuperType>();
//		for(int i = 0;i < sts.size();i ++){
//			SuperType supt =  sts.get(i);
//			if (supt.getSubtypes().size() > 0) {
//				supts.add(supt);
//			}
//		}
//		
//		JsonConfig config = new JsonConfig();
//		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
//		JSONArray jsonArray = JSONArray.fromObject(supts,config);
//		System.out.println("========================++++++"+jsonArray.toString());
////		this.result = "{\"id\":1}";
//		this.result = jsonArray.toString();
//		return "success";
//	}
	
//	@Action(value="/getallsupertypes",results=@Result(name="success",type="json",params={"root","result"}))
//	public String getSuperTypes2(){
//		List<SuperType> sts = superTypeService.getAllSuperType();
//		
//		
//		JsonConfig config = new JsonConfig();
//		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
//		config.setExcludes(new String[]{"prods"});
//		JSONArray jsonArray = JSONArray.fromObject(sts,config);
//		this.result = jsonArray.toString();
//		return "success";
//	}
	
	@Action(value="/getsupertypes",results=@Result(name="success",type="json",params={"root","result"}))
	public String getAllSuperTypes(){
		List<SuperType> sts = superTypeService.getAllSuperType();
		
		JsonConfig config = new JsonConfig();
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[]{"prods","subtypes"});
		JSONArray jsonArray = JSONArray.fromObject(sts,config);
		this.result = jsonArray.toString();
		return "success";
	}
	
	@Action(value="/getsupertypebybrand",results=@Result(name="success",type="json",params={"root","arr"}))
	public String getSuperTypesByBrand(){
		List<SuperType> sts = superTypeService.getAllSuperType();

		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonconfig.setExcludes(new String[]{"prods"});
		JSONArray jarray = JSONArray.fromObject(sts,jsonconfig);
		this.arr = jarray.toString();
		return "success";
	}
	
	@Action(value="/checksupertypename",results=@Result(name="success",type="json",params={"root","result"}))
	public String getSuperTypeByName(){
		SuperType st =  superTypeService.getSuperTypeByName(this.supertypename);
		Map<String,String> info = new HashMap<String,String>();
		if (st != null) {
			info.put("retjson", "该商品大类名称已经存在");
		}else {
			info.put("retjson", "");
		}
		JSONObject jo = JSONObject.fromObject(info);
		this.result = jo.toString();
		return "success";
	}
	
	@Action(value="/modifychecksupertypename",results=@Result(name="success",type="json",params={"root","result"}))
	public String checkSuperTypeByName(){
		SuperType st =  superTypeService.getSuperTypeByName(this.supertypename);
		Map<String,String> info = new HashMap<String,String>();
		SuperType supt = (SuperType) session.get("suptype");
		if (st != null) {
			if (supt.getSuperTypeName().equals(this.supertypename)) {
				info.put("retjson", "");
			}else{
				info.put("retjson", "该商品大类名称已经存在");
			}
		}else {
			info.put("retjson", "");
		}
		JSONObject jo = JSONObject.fromObject(info);
		this.result = jo.toString();
		return "success";
	}
//	@Action(value="/test",results=@Result(name="success",location="/index.jsp"))
//	public String test(){
//		
//		return "success";
//	}
	
	@Action(value="/deletesupertypebyid",results=@Result(name="success",location="pagemodel",type="redirect"))
	public String deleteSuperTypeById(){
		SuperType st = superTypeService.getSuperTypeById(this.superType.getId());
		superTypeService.deleteSuperTypeById(st);
		return "success";
	}
	
	@Action(value="/getsupertypebyid",results=@Result(name="success",location="superType/superType_modify.jsp"))
	public String getSuperTypeById(){
		SuperType st = superTypeService.getSuperTypeById(this.supertypeid);
		request.put("stype", st);
		return "success";
	}
	
	@Action(value="/modifygetsupertypebyid",results=@Result(name="success",location="superType/superType_modify.jsp"))
	public String modifyGetSupTypeById(){
		SuperType st = superTypeService.getSuperTypeById(this.supertypeid);
		session.put("suptype", st);
		return "success";
	}
	
	@Action(value="/pagemodel",results=@Result(name="success",location="superType/superType_list.jsp"))
	public String getAllSuperTypePage(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = "from SuperType st order by st.id";
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) { }
		PageModel stPageModel = new PageModel();
		stPageModel = superTypeService.getAllSuperTypePage(hql,offset,pagesize);
		request.put("pm", stPageModel);
		return "success";
	}
	
	@Action(value="/delSelectStype",results=@Result(name="success",type="json",params={"root","ret"}))
	public String delSelectSuperType(){
		System.out.println(this.ids);
		String[] sids = this.ids.split(",");
		System.out.println(sids.length);
		return "success";
	}
	
	@Action(value="/loadaddsubtpage",results=@Result(name="success",location="subType/subType_add.jsp"))
	public String loadAddSubTypePage(){
//		List<SuperType> sts = superTypeService.getAllSuperType();
//		request.put("superTypes", sts);
		return "success";
	}
	@Action(value="/getsupts",results=@Result(name="success",location="/index.jsp"))
	public String getSupts(){
		List<SuperType> supts = superTypeService.getAllSuperType();
		System.out.println("=======================supts.size()"+supts.size());
		session.put("supertypes", supts);
		return "success";
	}
}
