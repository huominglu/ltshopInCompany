package com.oracle.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.oracle.model.ProductInCart;

public class CartAction extends ActionSupport implements SessionAware,RequestAware {
	private Map<String, Object> session;
	private ProductInCart productInCart;
	private Map<String, Object> request;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public ProductInCart getProductInCart() {
		return productInCart;
	}
	public void setProductInCart(ProductInCart productInCart) {
		this.productInCart = productInCart;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	//将商品加入购物车
	@Action(value="addCart",results={@Result(name="success",location="/cart.jsp")})
	public String addCart(){
		Map<Integer,ProductInCart> map = (Map<Integer, ProductInCart>) session.get("pics");
		if(map == null){
			System.out.println("map为空");
			Map<Integer, ProductInCart> pics = new HashMap<Integer, ProductInCart>();
			pics.put(this.productInCart.getProductid(), this.productInCart);
			session.put("pics", pics);
		}else{
			System.out.println("map不为空");
			if(map.get(productInCart.getProductid()) != null){
				//购物车内已存在相同商品，则增加数量
				ProductInCart picnotnull = map.get(productInCart.getProductid());
				int newnum = picnotnull.getNum()+this.productInCart.getNum();
				picnotnull.setNum(newnum);
				map.put(productInCart.getProductid(), picnotnull);
			}else{
				map.put(productInCart.getProductid(), productInCart);
			}
			session.put("pics", map);
		}
		//遍历map集合
		Map map2 = (Map) session.get("pics");
		Set s = map2.keySet();
		Iterator ii = s.iterator();
		int allnum = 0;
		float allprice = 0;
		while(ii.hasNext()){
			int key = (Integer) ii.next();
			ProductInCart pic2 = (ProductInCart) map2.get(key);
//			System.out.println(key+pic2.getProductname()+"购买数量："+pic2.getNum()+"单价："+pic2.getPrice()+"商品图片："+pic2.getPicture());
			allnum = allnum+pic2.getNum();
			allprice = allprice + pic2.getPrice() * pic2.getNum();
//			System.out.println("商品总数allnum："+allnum);
		}
		//获取商品总数
		session.put("allnum", allnum);
		session.put("allprice", allprice);
		System.out.println("商品总价allprice："+allprice);
		return SUCCESS;
	}
	//获得购物车列表
	@Action(value="listCart")
	public String listCart(){
		return SUCCESS;
	}
	//移除购物车内指定商品
	@Action(value="deletepic",results={@Result(name="success",location="/cart.jsp")})
	public String deletepic(){
		Map map = (Map) session.get("pics");
		
		ProductInCart pic = (ProductInCart) map.get(productInCart.getProductid());
		float allprice = (Float) session.get("allprice");
		allprice = allprice - pic.getNum()*pic.getPrice();
		int allnum = (Integer) session.get("allnum");
		allnum = allnum - pic.getNum();
		
		map.remove(productInCart.getProductid());
		session.put("pics", map);
		session.put("allprice", allprice);
		session.put("allnum", allnum);
		return SUCCESS;
	}
	//移除购物车所有商品
	@Action(value="deleteAllPic",results={@Result(name="success",location="/cart.jsp")})
	public String deleteAllPic(){
		Map map = (Map) session.get("pics");
		map.clear();
		int allnum = 0;
		float allprice = 0;
		session.put("allnum", allnum);
		session.put("allprice", allprice);
		session.put("pics", map);
		return SUCCESS;
	}
	//为购物车内指定商品数量加1
	@Action(value="addPicNum",results={@Result(name="success",location="/cart.jsp")})
	public String addPicNum(){
		Map map = (Map) session.get("pics");
		
		ProductInCart pic = (ProductInCart) map.get(productInCart.getProductid());
		int num = pic.getNum();
		pic.setNum(num+1);
		float allprice = (Float) session.get("allprice");
		allprice = allprice + pic.getPrice();
		int allnum = (Integer) session.get("allnum");
		allnum = allnum + 1;
		
		map.put(productInCart.getProductid(), pic);
		session.put("pics", map);
		session.put("allprice", allprice);
		session.put("allnum", allnum);
		return SUCCESS;
	}
	//为购物车内指定商品数量减1
	@Action(value="reducePicNum",results={@Result(name="success",location="/cart.jsp")})
	public String reducePicNum(){
		Map map = (Map) session.get("pics");
		
		ProductInCart pic = (ProductInCart) map.get(productInCart.getProductid());
		int num = pic.getNum();
		pic.setNum(num-1);
		float allprice = (Float) session.get("allprice");
		allprice = allprice - pic.getPrice();
		int allnum = (Integer) session.get("allnum");
		allnum = allnum - 1;
		
		map.put(productInCart.getProductid(), pic);
		session.put("pics", map);
		session.put("allprice", allprice);
		session.put("allnum", allnum);
		return SUCCESS;
	}
}
