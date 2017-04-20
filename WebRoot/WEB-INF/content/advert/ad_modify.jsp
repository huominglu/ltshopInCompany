<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String realpath = basePath+"upfile/";
pageContext.setAttribute("realpath", realpath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>广告管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- 导入js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
function insertTitle(tValue){  
   var t1 = tValue.lastIndexOf("\\");  
   var t2 = tValue.lastIndexOf(".");  
   if(t1 >= 0 && t1 < t2 && t1 < tValue.length){  
    document.getElementById("filename").innerHTML = tValue.substring(t1 + 1, t2);  
   }  
}  
</script>
<script type="text/javascript">
	 $().ready(function(){
		var adtype = '${requestScope.advert.adType.id}';
		if(adtype == 1){
			$("#adType option:eq(0)").attr("selected","selected");
		}else{
			$("#adType option:eq(1)").attr("selected","selected");
		}
		var adstatus = '${requestScope.advert.adStatus.id}';
		if(adstatus == 1){
			$("#status option:eq(0)").attr("selected","selected");
		}else{
			$("#status option:eq(1)").attr("selected","selected");
		}
	 }); 
</script>
</head>

<body onload="getInitVal()">
<div id="container">
	<h2>广告修改</h2>
    <div id="uboxstyle" align="center">	
        <form action="ad_modify" method="post" enctype="multipart/form-data" onClick="return checkAd()">
            <table cellspacing="0" cellpadding="0" style="margin-bottom: 100px;">
            <tr>
                <td>广告ID</td>
                <td><input type="text" name="advert.id" value="${advert.id }"  /></td>
            </tr>
            <tr>
                <td>广告类型</td>
                <td>
                <select name="adType.id" id="adType">
                            <option value="1" selected="selected" >商品推荐</option>
                            <option value="2" >商品促销</option>
                 </select>     
                </td>
            </tr>
            <tr>
                <td>商品小类</td>
                <td>
                <select name="advert.subtypeid" id="language2">
                            <option value="1"  selected="selected">商品小类1</option>
                            <option value="2" >商品小类2</option>
                 </select>     
                </td>
            </tr>
            <tr>
                <td>商品编号</td>
                <td>
                <select name="advert.productid" id="language1">
                            <option value="1"  selected="selected">编号1</option>
                            <option value="2" >编号2</option>
                 </select>     
                </td>
            </tr>
             <tr>
                <td>广告描述</td>
                <td><input type="text" name="advert.description" value="${requestScope.advert.description }" id="description"/>
                <label id="info"></label>
                </td>
            </tr>
             <tr>
                <td>开始时间</td>
                <td><input type="text" name="advert.begintime" value="${requestScope.advert.begintime }" class="laydate-icon" onclick="laydate()" /></td>
            </tr>
             <tr>
                <td>截止时间</td>
                <td><input type="text" name="advert.endtime" value="${requestScope.advert.endtime }" class="laydate-icon" onclick="laydate()"/></td>
            </tr>
            <tr>
                <td>广告图片</td>
                <td>
                	<img src="${pageScope.realpath }${advert.picture}" width="300" height="150"/>
                	<a class="btn_addPic" href="javascript:void(0);"><span><em>+</em>修改图片</span>
                    <input class="filePrew" type="file" name="upload"  onChange="if(this.value)insertTitle(this.value);">
                    <input name="picture" type="hidden" value="${advert.picture}">
                    </a>
                     <label id="filename"></label>
                </td>
            </tr>
            <tr>
                <td>广告状态</td>
                <td>
                <select id="status" name = "adStatus.id">
                            <option value="1"  selected="selected">应用中</option>
                            <option value="2" >过期</option>
                 </select>     
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="修改" style="width:90px;height:30px;color:#79A2BD;font-size:16px;padding-top: 0;cursor: pointer;">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

