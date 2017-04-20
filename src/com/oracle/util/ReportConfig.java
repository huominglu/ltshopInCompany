package com.oracle.util;

import java.util.List;


public class ReportConfig<T> {
	private List<T> data;//���ֱ�������Դ
	private String jrxmlPath;//����ģ��·��
	private String jrxmlExcelPath;//���ģ��·��
	private String[] fields;//��������
	private Integer[] fieldLengths;//�������ݳ���
	private String docPath;//�����ļ�·��
	private String docType;//�����ļ�����
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public String getJrxmlPath() {
		return jrxmlPath;
	}
	public void setJrxmlPath(String jrxmlPath) {
		this.jrxmlPath = jrxmlPath;
	}
	public String getJrxmlExcelPath() {
		return jrxmlExcelPath;
	}
	public void setJrxmlExcelPath(String jrxmlExcelPath) {
		this.jrxmlExcelPath = jrxmlExcelPath;
	}
	public String[] getFields() {
		return fields;
	}
	public void setFields(String[] fields) {
		this.fields = fields;
	}
	public Integer[] getFieldLengths() {
		return fieldLengths;
	}
	public void setFieldLengths(Integer[] fieldLengths) {
		this.fieldLengths = fieldLengths;
	}
	public String getDocPath() {
		return docPath;
	}
	public void setDocPath(String docPath) {
		this.docPath = docPath;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
	
}
