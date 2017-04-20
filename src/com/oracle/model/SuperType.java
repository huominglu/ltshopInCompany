package com.oracle.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="supertype")
@Entity
public class SuperType extends BaseEntity{
	//大类名称，列名为typename,不能为空，且唯一
	@Column(name="superypename",nullable=false,length=20,unique=true)
	private String superTypeName;
	
	//大类与商品为多对一关系
	@OneToMany(mappedBy="superType",fetch=FetchType.LAZY)
	private List<Product> prods = new ArrayList<Product>();
	
	//商品大类与商品小类为一对多关系
	@OneToMany(mappedBy="superType")
	private List<SubType> subtypes = new ArrayList<SubType>();

	public String getSuperTypeName() {
		return superTypeName;
	}

	public void setSuperTypeName(String superTypeName) {
		this.superTypeName = superTypeName;
	}

	public List<Product> getProds() {
		return prods;
	}

	public void setProds(List<Product> prods) {
		this.prods = prods;
	}

	public List<SubType> getSubtypes() {
		return subtypes;
	}

	public void setSubtypes(List<SubType> subtypes) {
		this.subtypes = subtypes;
	}
	
	
}
