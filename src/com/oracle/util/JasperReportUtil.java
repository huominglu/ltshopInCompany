package com.oracle.util;

import java.awt.Color;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import net.sf.jasperreports.engine.JRAbstractExporter;
import net.sf.jasperreports.engine.JRBand;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRElement;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRStaticText;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignElement;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@SuppressWarnings("deprecation")
public class JasperReportUtil {
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public void reportMethod(ReportConfig auditReportConfig) throws Exception {
	         ArrayList<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();  
	         Map<String, Object> params = new HashMap<String, Object>(); 
	         Map map = new HashMap();
	        try {
	        	 //图表
//	            JasperDesign jdesignChart = JRXmlLoader.load(auditReportConfig.getJrxmlChartPath());  
////	            designFontSize(jdesignChart,auditReportConfig);  
//	            JasperReport jasperReportChart = JasperCompileManager.compileReport(jdesignChart);  
//	            JRDataSource dataSourceChart = new JRBeanCollectionDataSource(auditReportConfig.getDataChart());
//	            JasperPrint jasperPrintChart  = JasperFillManager
//	                    .fillReport(jasperReportChart,map,dataSourceChart);
//	            jasperPrintList.add(jasperPrintChart);
	            //文字报表
	            String docType=auditReportConfig.getDocType();
	            JasperDesign jdesign=null;
	            if("xls".equals(docType)||"csv".equals(docType)){
	            	 jdesign = JRXmlLoader  
		                     .load(auditReportConfig.getJrxmlExcelPath());  
	            }
	            else{
	        	     jdesign = JRXmlLoader  
	                     .load(auditReportConfig.getJrxmlPath());  
	            }
	             params.put("dynamicColumn",java.util.Arrays.asList(auditReportConfig.getFields()));  
	             //根据dynamiccolumn参数，对不需要显示的列进行删�?  
	             System.out.println("auditReportConfig.getFields():"+auditReportConfig.getFields().length);
	             dynamiccolumn(jdesign,params,auditReportConfig);
	             JasperReport jasperReport= JasperCompileManager.compileReport(jdesign);
	             JRDataSource dataSource = new JRBeanCollectionDataSource(auditReportConfig.getData());
	             JasperPrint jasperPrint = JasperFillManager
	                    .fillReport(jasperReport,map,dataSource);
	            //子报表集�?
	            jasperPrintList.add(jasperPrint);
	          
	            //获取目标文件路径以及后缀
	            JRAbstractExporter exporter=getJRExporter(docType,auditReportConfig.getDocPath()+"."+docType);
	            exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST,jasperPrintList);  
	            exporter.exportReport();
	        } catch (JRException e) {
	            e.printStackTrace();
	        } 
	    }

	public void reportMethod_simple(ReportConfig auditReportConfig) throws Exception {
        ArrayList<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();  
        Map<String, Object> params = new HashMap<String, Object>(); 
        Map map = new HashMap();
       try {
     
           //文字报表
           String docType=auditReportConfig.getDocType();
           JasperDesign jdesign=null;
           if("xls".equals(docType)||"csv".equals(docType)){
           	 jdesign = JRXmlLoader  
	                     .load(auditReportConfig.getJrxmlExcelPath());  
           }else{
       	     jdesign = JRXmlLoader  
                    .load(auditReportConfig.getJrxmlPath());  
           }
           
            JasperReport jasperReport= JasperCompileManager.compileReport(jdesign);  
            JRDataSource dataSource = new JRBeanCollectionDataSource(auditReportConfig.getData());
            JasperPrint jasperPrint = JasperFillManager
                   .fillReport(jasperReport,map,dataSource);
           //子报表集�?
           jasperPrintList.add(jasperPrint);
         
           //获取目标文件路径以及后缀
           JRAbstractExporter exporter=getJRExporter(docType,auditReportConfig.getDocPath()+"."+docType);
           exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST,jasperPrintList);  
           exporter.exportReport();
       } catch (JRException e) {
           e.printStackTrace();
       } 
   }
//		@SuppressWarnings({ "rawtypes", "unchecked" })
//		public void  designFontSize( JasperDesign jdesign,FortReportConfig auditReportConfig) {  
//			List<FortStatisDataObj> fortStatisDataObjs=auditReportConfig.getDataChart();
//			int length=0;
//			int fontSize=0;
//			for(FortStatisDataObj fortStatisDataObj:fortStatisDataObjs){
//				int temp=fortStatisDataObj.getFortUserName().getBytes().length;
//				if(length<temp){
//					length=temp;
//				}
//	    	}
//			if(length<22){
//				fontSize=10;
//			}
//			else{
//				fontSize=8;
//			}
//			System.out.println(fontSize);
//			JRDesignStyle style =  new  JRDesignStyle();    
//            style.setFontSize(fontSize); 
//            style.setName( "SansSerif_Normal" );   
//            JRDesignBand jrDesignBand = (JRDesignBand) jdesign.getSummary();
//            JRElement[] es= jrDesignBand.getElements();
//            for(int i=0;i<es.length;i++){
//            	JRDesignChart e= (JRDesignChart) es[i];
//            	e.setStyle(style);;
//            }
//            try {
//				jdesign.addStyle(style);
//			} catch (JRException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}   
//		}
	
	    @SuppressWarnings("rawtypes")
		public void dynamiccolumn(JasperDesign jdesign, Map params,ReportConfig auditReportConfig) {
	    
	    	int totalLen=0;
	    	Integer[] fieldLengths=auditReportConfig.getFieldLengths();
	    	int fontSize=0;
	    	for(int i=0;i<fieldLengths.length;i++){
	    		totalLen+=fieldLengths[i];
	    	}
	    	if(totalLen<100){
	    		fontSize = 10;
	    	}
	    	else if(totalLen>=100&&totalLen<110){
	    		fontSize = 9;
	    	}
	    	else{
	    		fontSize = 8;
	    	}
	    	JRDesignStyle style =  new  JRDesignStyle();    
            style.setFontSize(fontSize); 
            style.setName( "SansSerif_Normal" );   
	    	
	    	//去除不需要的列
	        Collection dynamiccolumns = (Collection) params.get("dynamicColumn");  
	        if (dynamiccolumns != null) {  
	            JRDesignBand cHeader = (JRDesignBand) jdesign.getColumnHeader();  
	            JRBand cDetailBand = jdesign.getDetailSection().getBands()[0];  
	            JRDesignBand cDetail = null;  
	            if (cDetailBand != null && cDetailBand instanceof JRDesignBand) {
	                cDetail = (JRDesignBand) cDetailBand;  
	            }  
	            JRElement[] es_header = cHeader.getElements();
	            JRElement[] es_detail = cDetail.getElements();
	            System.out.println("es_header.length1:"+es_header.length);
	            for (int i = 0; i < es_header.length; i++) {
	                JRDesignElement e = (JRDesignElement) es_header[i];
	                String v = "";
	                if (e instanceof JRStaticText) {  
	                   JRStaticText text = (JRStaticText) e;  
	                   v = text.getText(); 
	                }  
	               //找到�?要删除的列名
	                if (!dynamiccolumns.contains(v)) { 
	                		System.out.println("v:"+v);
	                    	//得到这行的第i个元�?
	                        JRDesignElement ee = (JRDesignElement) es_detail[i];
	                        //删除这一列的数据（在涉及模板时�?�需要注意属性与列名的对应关系，否则可能删除的数据不对）
	                         cDetail.removeElement(ee);  
	                    //删除列名
	                    cHeader.removeElement(e);  
	                }  
	            }  
	            cHeader = (JRDesignBand) jdesign.getColumnHeader();  
	            cDetailBand = jdesign.getDetailSection().getBands()[0];  
	            cDetail = null;  
	            if (cDetailBand != null && cDetailBand instanceof JRDesignBand) {  
	                cDetail = (JRDesignBand) cDetailBand;  
	            }  
	            es_header = cHeader.getElements();  
	            es_detail = cDetail.getElements(); 
	            


                 
	 	       //调整页面的格�?
	            int widthSum=0;
	            for (int i = 0; i < es_header.length; i++) { 
	                JRDesignElement e = (JRDesignElement) es_header[i];  
                    JRDesignElement ee = (JRDesignElement) es_detail[i];
                    ee.setX(widthSum);
                    e.setX(widthSum);
                    e.setStyle(style);
                    ee.setStyle(style);
                    String v="";
                    if (e instanceof JRStaticText) {  
 	                   JRStaticText text = (JRStaticText) e;  
 	                   v = text.getText(); 
 	                }  
                    System.out.println(v+"----"+auditReportConfig.getFieldLengths()[i]);
                    int width=535*(auditReportConfig.getFieldLengths()[i])/totalLen;
                    if(i==es_header.length-1){
                    	e.setWidth(535-widthSum);
                        e.setBackcolor(new Color(36,102,144));
                        ee.setWidth(535-widthSum);
                    }
                    else{
                        e.setWidth(width);
                        e.setBackcolor(new Color(36,102,144));
                        System.out.println("done....");
                        ee.setWidth(width);
                    }
                    widthSum+=width;
	                }  
	            }  
		        try {
					jdesign.addStyle(style);
				} catch (JRException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}   
	    }  
	    
	    /** 
	     * 传入类型，获取输出器 
	     *  
	     * @param docType 
	     * @return 
	     */  
	    @SuppressWarnings({ "rawtypes"})
		public JRAbstractExporter getJRExporter(String docType,String reportName) {  
	        JRAbstractExporter exporter = null; 
	        if("xls".equals(docType)){
	        	exporter = new JRXlsExporter();  
	            exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
	            exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录�?下面的空�?
	            exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);
	        }else if("doc".equals(docType)){
	        	exporter = new JRRtfExporter();
	        }
//	        switch (docType) {
//	        case "html":  
//	            exporter = new JRHtmlExporter();  
//	            exporter.setParameter(JRHtmlExporterParameter.IMAGES_DIR_NAME, ServletActionContext.getRequest().getSession().getServletContext().getRealPath("")+"\report");
//	            exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,""); 
//	            exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.TRUE);
//	            exporter.setParameter(JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR, Boolean.TRUE);
//	  
//	            break; 
//	        case "pdf":  
//	            exporter = new JRPdfExporter();  
//	            break;   
//	        case "xls":  
//	            exporter = new JRXlsExporter();  
//	            exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
//	            exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录�?下面的空�?
//	            exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);
//	            break;  
//	        case "csv":  
//	            exporter = new JRCsvExporter();  
//	            exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);
//	            exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);
//	            exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);
//	            break;   
//	        case "doc":  
//	            exporter = new JRRtfExporter();  
//	            break;  
//	        }
	        if("csv".equals(docType)){
	        	exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "GB2312");
	        }
	        else{
	        	 exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,"UTF-8");	
	        }
	        exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,reportName);
	        return exporter;  
	    }  
}
