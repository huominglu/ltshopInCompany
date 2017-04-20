<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公告管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- 导入js -->
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	$().ready(function(){
		var title = '${requestScope.notice.noticetitle}';
		if(title == "公告"){
			$("#gg").attr("checked","checked");
		}else if(title == "特惠"){
			$("#th").attr("checked","checked");
		}else{
			$("#yx").attr("checked","checked");
		}
		
	});
</script>
</head>

<body>
<div id="container">
	<h2>公告修改</h2>
    <div id="uboxstyle" align="center">	
        <form action="notice_modify" method="post" onClick="return checkNotice()">
            <table cellspacing="0" cellpadding="0">
            <tr>
            	<td>公告ID</td>
            	<td><input type="text" name="notice.id" value="${requestScope.notice.id}" readonly="readonly"></td>
            <tr>
            <tr>
                <td>公告标题</td>
                <td>
                	<input id="gg" type="radio" name="notice.noticetitle" value="公告">公告
                	<input id="th" type="radio" name="notice.noticetitle" value="特惠">特惠
                	<input id="yx" type="radio" name="notice.noticetitle" value="优选">优选
                </td>
            </tr>
             <tr>
                <td>公告内容</td>
                <td><input type="text" name="notice.noticecontent" size="80" value="${requestScope.notice.noticecontent }" id="notice" />
                <label id="info"></label></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="修改" style="width:90px;height:30px;color:#79A2BD;font-size:16px;line-height: 1%;cursor: pointer;">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

