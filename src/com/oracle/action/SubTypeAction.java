package com.oracle.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.oracle.model.Product;
import com.oracle.model.SubType;
import com.oracle.model.SuperType;
import com.oracle.service.SubTypeService;
import com.oracle.service.SuperTypeService;
import com.oracle.util.PageModel;

@ParentPackage("json-default")
@Controller
public class SubTypeAction implements RequestAware,SessionAware{
	//struts2自动封装
	private SuperType superType;
	
	//struts2自动封装
	private SubType subType;
	
	//当前页码
	private String currentpageno;
	//每页显示记录数
	private String pagesize;
	
	@Resource
	private SubTypeService subTypeService;
	
	@Resource
	private SuperTypeService superTypeService;
	
	private Map<String,Object> request;
	
	private Map<String,Object> session;
	
	private String result;
	
	private String resultset;
	

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getCurrentpageno() {
		return currentpageno;
	}

	public void setCurrentpageno(String currentpageno) {
		this.currentpageno = currentpageno;
	}

	public String getPagesize() {
		return pagesize;
	}

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public String getResultset() {
		return resultset;
	}

	public void setResultset(String resultset) {
		this.resultset = resultset;
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

	public SubType getSubType() {
		return subType;
	}

	public void setSubType(SubType subType) {
		this.subType = subType;
	}

	public SubTypeService getSubTypeService() {
		return subTypeService;
	}

	public void setSubTypeService(SubTypeService subTypeService) {
		this.subTypeService = subTypeService;
	}
	
	
	public SuperTypeService getSuperTypeService() {
		return superTypeService;
	}

	public void setSuperTypeService(SuperTypeService superTypeService) {
		this.superTypeService = superTypeService;
	}

	@Action(value="/addsubtype",results=@Result(name="success",type="redirect",location="subpagemodel"))
	public String addSubType(){
		subType.setSuperType(superType);
		subTypeService.addSubType(this.subType);
		return "success";
	}
	
	@Action(value="/subpagemodel",results=@Result(name="success",location="subType/subType_list.jsp"))
	public String getAllSuperTypePage(){
		HttpServletRequest hrequest = ServletActionContext.getRequest();
		String hql = "from SubType st order by st.id";
		int offset = 0;
		int pagesize = 10;
		try {
			offset = Integer.parseInt(hrequest.getParameter("pager.offset"));
		} catch (NumberFormatException e) { }
		PageModel stPageModel = new PageModel();
		stPageModel = subTypeService.getAllSubTypePage(hql,offset,pagesize);
		request.put("pm", stPageModel);
		return "success";
	}
	
	@Action(value="/subsomepagemodel",results=@Result(name="success",location="subType/superTypePageSelect.jsp"))
	public String getSomeSuperTypePage(){
		if (this.superType != null) {
			SuperType supt = superTypeService.getSuperTypeById(this.superType.getId());
			session.put("supertype", supt);
		}
		int startpage = 0;// 起始页
		int totalpage = 0;// 总页数
		int pagesizeno = 5;// 每页显示数据
		int totalnum = 0;// 总记录数
		
//		/* 初始化数据 */
		if (currentpageno != null) {
			startpage = Integer.parseInt(currentpageno);
		}
		if (pagesize != null) {
			pagesizeno = Integer.parseInt(pagesize);
		}
		
		
		List<SubType> subts = subTypeService.getSubTypeById(startpage,pagesizeno,((SuperType)session.get("supertype")).getId());
		totalnum = subTypeService.getCount(((SuperType)session.get("supertype")).getId());//6
		
		/* 分页具体算法 */
		if (totalnum % pagesizeno != 0) {
			totalpage = totalnum / pagesizeno + 1;// 6/5+1 = 2;
		} else {
			totalpage = totalnum / pagesizeno;
		}
		
		request.put("currentpageno", currentpageno);// 根据计算得到当前页码 
		request.put("pagesize", pagesizeno);// 得到每页显示记录数 5
		request.put("totalpage", totalpage);// 得到总页数
		request.put("subtypes", subts);
		return "success";
	}
	
	@Action(value="/deletesubtype",results=@Result(name="success",type="redirect",location="subpagemodel"))
	public String delSubType(){
		SubType subtype = subTypeService.getSubTypeById(this.subType.getId());
		subTypeService.deleteSubType(subtype);
		return "success";
	}
	@Action(value="/getsubtypebyid",results=@Result(name="success",location="subType/subType_modify.jsp"))
	public String getSubTypeById(){
		SubType subtype = subTypeService.getSubTypeById(this.subType.getId());
		request.put("subtype", subtype);
		return "success";
	}
	
	@Action(value="/modifysubtype",results=@Result(name="success",location="subpagemodel",type="redirect"))
	public String modifySubType(){
		SuperType st = superTypeService.getSuperTypeById(this.superType.getId());
		System.out.println();
		this.subType.setSuperType(st);
		subTypeService.modifySubType(this.subType);
		return "success";
	}
	@Action(value="/checksubtypename",results=@Result(name="success",type="json",params={"root","result"}))
	public String getSubTypeByName(){
		SubType subt =  subTypeService.getSubTypeByName(this.subType.getSubtypename());
		Map<String,String> info = new HashMap<String,String>();
		if (subt != null) {
			info.put("retjson", "该商品小类名称已经存在");
		}else {
			info.put("retjson", "");
		}
		JSONObject jo = JSONObject.fromObject(info);
		this.result = jo.toString();
		return "success";
	}
	
	@Action(value="/getallsubtype",results=@Result(name="success",type="json",params={"root","resultset"}))
	public String getSubTypeBySuperTypeId(){
		List<SubType> subts = subTypeService.getSubTypeBySuperTypeId(this.superType.getId());
		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jarray = JSONArray.fromObject(subts,jsonconfig);
		this.resultset = jarray.toString();
		return "success";
	}
	
	@Action(value="/getsubtypebybrand",results=@Result(name="success",type="json",params={"root","resultset"}))
	public String getSubTypeByBrand(){
		List<SubType> subts = subTypeService.getSubTypeBySuperTypeId(this.superType.getId());
		List<SubType> subtypes = new ArrayList<SubType>();
		for (int i = 0; i < subts.size(); i++) {
			SubType subt = subts.get(i);
//			List<Attr> ats = subt.getAttrs();
//			for (int j = 0; j < ats.size(); j++) {
//				Attr attr = ats.get(j);
//				if ("品牌".equals(attr.getAttrname())) {
					subtypes.add(subt);
//					break;
//				}
//			}
		}
		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jarray = JSONArray.fromObject(subtypes,jsonconfig);
		this.resultset = jarray.toString();
		return "success";
	}
	@Action(value="/getallsubtypes",results=@Result(name="success",type="json",params={"root","resultset"}))
	public String getAllSubType(){
		
		List<SubType> subts = subTypeService.getAllSubType();
		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jarray = JSONArray.fromObject(subts,jsonconfig);
		this.resultset = jarray.toString();
		return "success";
	}
	
	//通过小类id获取其旗下所有商品  by hml
	@Action(value="getallproductBysubtype",results={@Result(name="success",type="json",params={"root","result"})})
	public String getallproductBysubtype(){
//		List<Product> products = subTypeService.getallproductBysubtype(subType.getId());
		SubType subt = subTypeService.getSubTypeById(subType.getId());
		List<Product> products = subt.getProds();
		JsonConfig jsonconfig = new JsonConfig();
		jsonconfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jarray = JSONArray.fromObject(products,jsonconfig);
		this.result = jarray.toString();
		return "success";
	}
}

