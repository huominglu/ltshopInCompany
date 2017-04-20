package com.oracle.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileUpDownUtils {
	
	    private static final String REALNAME = "realName";  
	    private static final String STORENAME = "storeName";  
	    private static final String SIZE = "size";  
	    private static final String SUFFIX = "suffix";  
	    private static final String CONTENTTYPE = "contentType";  
	    private static final String CREATETIME = "createTime";  
	    private static final String UPLOADDIR = "uploadDir/";  

	    /**
	     * 下载
	     * @param downLoadPath 文件路径及文件名
	     * @param realName 文件�?
	     */
	    public static void download(HttpServletRequest request,  
	            HttpServletResponse response, String downLoadPath, String contentType,  
	            String realName) throws Exception {  
	    	
	    	String isIE = request.getParameter("isIE");
	       // response.setContentType("application/zip;charset=UTF-8");  
	        request.setCharacterEncoding("UTF-8");  
	        BufferedInputStream bis = null;  
	        BufferedOutputStream bos = null;
	        long fileLength = new File(downLoadPath).length();
	        //response.reset();
	        response.setContentType(contentType);  
//	        if ("IE".equals(isIE)) {  
	            realName = URLEncoder.encode(realName, "UTF-8");  
	        /*} else {  
	            realName = new String(realName.getBytes("UTF-8"), "ISO8859-1");  
	        }  */
	        
	        response.setHeader("Content-Disposition", "attachment; filename="+realName);  
	        response.setHeader("Content-Length", String.valueOf(fileLength));  
            response.setHeader("pragma","public");
            response.setHeader("Cache-Control", "public");  
	        bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
	        bos = new BufferedOutputStream(response.getOutputStream());  
	        byte[] buff = new byte[2048];  
	        int bytesRead;  
	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
	            bos.write(buff, 0, bytesRead);  
	        }  
	        bis.close();  
	        bos.close();  
	    }  
	    
	    /**
	     * 下载
	     * @param downLoadPath 文件路径及文件名
	     * @param realName 文件�?
	     */
	    public static void zh_cn_download(HttpServletRequest request,  
	            HttpServletResponse response, String downLoadPath, String contentType,  
	            String realName,String Browser) throws Exception {  
	    	
	    	String isIE = request.getParameter("isIE");
	       // response.setContentType("application/zip;charset=UTF-8");  
	        request.setCharacterEncoding("UTF-8");  
	        BufferedInputStream bis = null;  
	        BufferedOutputStream bos = null;
	        long fileLength = new File(downLoadPath).length();
	        //response.reset();
	        response.setContentType(contentType);  
	        System.out.println("!!!!!!!!!!"+Browser);
            if ("IE".equals(Browser)) {  
	            realName = URLEncoder.encode(realName, "UTF-8");  
	        } else {  
	            realName = new String(realName.getBytes("UTF-8"), "ISO8859-1");  
	        }  
	        
	        response.setHeader("Content-Disposition", "attachment; filename="+realName);  
	        response.setHeader("Content-Length", String.valueOf(fileLength));  
            response.setHeader("pragma","public");
            response.setHeader("Cache-Control", "public");  
	        bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
	        bos = new BufferedOutputStream(response.getOutputStream());  
	        byte[] buff = new byte[2048];  
	        int bytesRead;  
	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
	            bos.write(buff, 0, bytesRead);  
	        }  
	        bis.close();  
	        bos.close();  
	    }  
	    
	    
	   /**
	    * 通用打包（同�?路径下的多个文件�?
	    * @param FilPath 文件路径，不包含文件�?
	    * @param zipName 压缩文件�?
	    * @param fileName �?要打包的文件�?
	    */
	    public static void zipDownload(HttpServletRequest request,  
	            HttpServletResponse response,String contentType,String filePath, String zipName,
            String... fileName) throws Exception {  
    	    request.setCharacterEncoding("UTF-8");   
    	    String tmpFileName = zipName;  
	        byte[] buffer = new byte[1024];  
	        String ZipPath = filePath + tmpFileName;  
	        try {  
	             ZipOutputStream out = new ZipOutputStream(new FileOutputStream(ZipPath));  
	              // �?要同时下载的多个文件 
	             File[] files=new File[fileName.length]; 
	             for(int i=0;i<fileName.length;i++){
	            	 files[i]=new File(filePath+fileName[i]);
	             }
	             for (int i = 0; i < files.length; i++) {  
	                 FileInputStream fis = new FileInputStream(files[i]);  
	                 out.putNextEntry(new ZipEntry(files[i].getName()));  
	                 int len;  
	                 // 读入�?要下载的文件的内容，打包到zip文件  
	                 while ((len = fis.read(buffer)) > 0) {  
	                     out.write(buffer, 0, len);  
	                 }  
	                 out.closeEntry();  
	                 fis.close();  
	             }  
	             out.close();  
	             //下载打包文件
	             download(request,response,ZipPath,contentType,tmpFileName);
	          } catch (Exception e) {  
	            e.printStackTrace(); 
	          }  
	    }  
}
