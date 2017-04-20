package com.oracle.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="admin")
public class Admin extends BaseEntity{

		private String name;
		public String password;
		
		@ManyToOne
		@JoinColumn(name="role_id")
		private Role role;



		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public Role getRole() {
			return role;
		}
		public void setRole(Role role) {
			this.role = role;
		}
		

}
