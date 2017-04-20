package com.oracle.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="t_user")
public class User extends BaseEntity {
	//�û���¼��
	@Column(length=20,nullable=false,unique=true)
	private String username;
	
	//�û���¼����
	@Column(length=20,nullable=false)
	private String password;
	
	//�û�email
	@Column(length=50,nullable=false)
	private String email;
	
	//�û���ʵ����
	@Column(length=20)
	private String realname;
	
	//�û��Ա�
	@Column(length=10)
	private Integer gender;
	
	//�û�����
	private Date birthday;
	
	//�û���ַ
	@Column(length=100)
	private String address;
	
	//�û��ʱ�
	@Column(length=20)
	private String postcode;
	
	//�û��̶��绰
	@Column(length=20)
	private String phone;
	
	//�û��ƶ��绰
	@Column(length=20,nullable=false)
	private String mobil;
	
	//�û����֣�Ĭ��1000
	@Column()
	private Integer score;
	
	//�������
	@Column(length=10)
	private String status;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobil() {
		return mobil;
	}

	public void setMobil(String mobil) {
		this.mobil = mobil;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
