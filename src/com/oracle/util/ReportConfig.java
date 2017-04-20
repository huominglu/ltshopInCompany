package com.oracle.util;

import java.util.List;


public class ReportConfig<T> {
	private List<T> data;//文字报表数据源
	private String jrxmlPath;//文字模板路径
	private String jrxmlExcelPath;//表格模板路径
	private String[] fields;//列名数组
	private Integer[] fieldLengths;//列名内容长度
	private String docPath;//生成文件路径
	private String docType;//生成文件类型
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
