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
<title>�������</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- ����js -->
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	$().ready(function(){
		var title = '${requestScope.notice.noticetitle}';
		if(title == "����"){
			$("#gg").attr("checked","checked");
		}else if(title == "�ػ�"){
			$("#th").attr("checked","checked");
		}else{
			$("#yx").attr("checked","checked");
		}
		
	});
</script>
</head>

<body>
<div id="container">
	<h2>�����޸�</h2>
    <div id="uboxstyle" align="center">	
        <form action="notice_modify" method="post" onClick="return checkNotice()">
            <table cellspacing="0" cellpadding="0">
            <tr>
            	<td>����ID</td>
            	<td><input type="text" name="notice.id" value="${requestScope.notice.id}" readonly="readonly"></td>
            <tr>
            <tr>
                <td>�������</td>
                <td>
                	<input id="gg" type="radio" name="notice.noticetitle" value="����">����
                	<input id="th" type="radio" name="notice.noticetitle" value="�ػ�">�ػ�
                	<input id="yx" type="radio" name="notice.noticetitle" value="��ѡ">��ѡ
                </td>
            </tr>
             <tr>
                <td>��������</td>
                <td><input type="text" name="notice.noticecontent" size="80" value="${requestScope.notice.noticecontent }" id="notice" />
                <label id="info"></label></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="�޸�" style="width:90px;height:30px;color:#79A2BD;font-size:16px;line-height: 1%;cursor: pointer;">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

