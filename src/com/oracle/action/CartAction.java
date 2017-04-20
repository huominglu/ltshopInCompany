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
	//����Ʒ���빺�ﳵ
	@Action(value="addCart",results={@Result(name="success",location="/cart.jsp")})
	public String addCart(){
		Map<Integer,ProductInCart> map = (Map<Integer, ProductInCart>) session.get("pics");
		if(map == null){
			System.out.println("mapΪ��");
			Map<Integer, ProductInCart> pics = new HashMap<Integer, ProductInCart>();
			pics.put(this.productInCart.getProductid(), this.productInCart);
			session.put("pics", pics);
		}else{
			System.out.println("map��Ϊ��");
			if(map.get(productInCart.getProductid()) != null){
				//���ﳵ���Ѵ�����ͬ��Ʒ������������
				ProductInCart picnotnull = map.get(productInCart.getProductid());
				int newnum = picnotnull.getNum()+this.productInCart.getNum();
				picnotnull.setNum(newnum);
				map.put(productInCart.getProductid(), picnotnull);
			}else{
				map.put(productInCart.getProductid(), productInCart);
			}
			session.put("pics", map);
		}
		//����map����
		Map map2 = (Map) session.get("pics");
		Set s = map2.keySet();
		Iterator ii = s.iterator();
		int allnum = 0;
		float allprice = 0;
		while(ii.hasNext()){
			int key = (Integer) ii.next();
			ProductInCart pic2 = (ProductInCart) map2.get(key);
//			System.out.println(key+pic2.getProductname()+"����������"+pic2.getNum()+"���ۣ�"+pic2.getPrice()+"��ƷͼƬ��"+pic2.getPicture());
			allnum = allnum+pic2.getNum();
			allprice = allprice + pic2.getPrice() * pic2.getNum();
//			System.out.println("��Ʒ����allnum��"+allnum);
		}
		//��ȡ��Ʒ����
		session.put("allnum", allnum);
		session.put("allprice", allprice);
		System.out.println("��Ʒ�ܼ�allprice��"+allprice);
		return SUCCESS;
	}
	//��ù��ﳵ�б�
	@Action(value="listCart")
	public String listCart(){
		return SUCCESS;
	}
	//�Ƴ����ﳵ��ָ����Ʒ
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
	//�Ƴ����ﳵ������Ʒ
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
	//Ϊ���ﳵ��ָ����Ʒ������1
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
	//Ϊ���ﳵ��ָ����Ʒ������1
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
