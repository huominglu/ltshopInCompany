package com.oracle.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="notice")
public class Notice extends BaseEntity{
	//������ⳤ��30
	@Column(length=30)
	private String noticetitle;
	
	//�������ݳ���100
	@Column(length=100)
	private String noticecontent;
	
	//���淢��ʱ��
	private Date noticetime;

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public Date getNoticetime() {
		return noticetime;
	}

	public void setNoticetime(Date noticetime) {
		this.noticetime = noticetime;
	}

	
	
	
}
