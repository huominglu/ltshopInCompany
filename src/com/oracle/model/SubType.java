package com.oracle.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="subtype")
@Entity
public class SubType extends BaseEntity {
	//��ƷС������Ʒ����Ϊ���һ��ϵ
	@ManyToOne
	@JoinColumn(name="supertypeid")
	private SuperType superType;
	
	//��ƷС������ƷΪһ�Զ��ϵ
	@OneToMany(mappedBy="subType",fetch=FetchType.LAZY)
	private List<Product> prods = new ArrayList<Product>();
	
//	//��ƷС������ԵĹ�ϵΪһ�Զ�
//	@OneToMany(mappedBy="subType")
//	private List<Attr> attrs = new ArrayList<Attr>(); 
	
	@Column(nullable=false,unique=true,length=30)
	private String subtypename;

	public SuperType getSuperType() {
		return superType;
	}

	public void setSuperType(SuperType superType) {
		this.superType = superType;
	}

	public List<Product> getProds() {
		return prods;
	}

	public void setProds(List<Product> prods) {
		this.prods = prods;
	}

//	public List<Attr> getAttrs() {
//		return attrs;
//	}
//
//	public void setAttrs(List<Attr> attrs) {
//		this.attrs = attrs;
//	}

	public String getSubtypename() {
		return subtypename;
	}

	public void setSubtypename(String subtypename) {
		this.subtypename = subtypename;
	}
	
	
}
