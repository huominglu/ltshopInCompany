package com.oracle.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="role")
public class Role extends BaseEntity{
	private String rolename;
	
	@OneToMany(mappedBy="role")
	private List<Admin> admins = new ArrayList<Admin>();

	public List<Admin> setAdmins() {
		return admins;
	}
	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	
	

	

}
