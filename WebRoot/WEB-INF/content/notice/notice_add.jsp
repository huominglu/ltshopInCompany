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

	$("#submit").click(function(){
		var content = $("#content").val();
		if(content == ""){
			$("#info").html("<font color='red'>����д��������</font>");
			$("content").focus();
		}else{
			form1.submit();
		}
	});
	
});
</script>
</head>

<body>
<div id="container">
	<h2>�������</h2>
    <div id="uboxstyle" align="center">	
        <form name="form1" action="notice_add" method="post">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>�������</td>
                <td>
                	<input type="radio" name="notice.noticetitle" value="����" checked="checked">����
                	<input type="radio" name="notice.noticetitle" value="�ػ�">�ػ�
                	<input type="radio" name="notice.noticetitle" value="��ѡ">��ѡ
                	
                </td>
            </tr>
             <tr>
                <td>��������</td>
                <td><input id="content" type="text" name="notice.noticecontent" size="80" id="notice" />
                <label id="info"></label></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <label id="submit" style="width:90px;height:30px;color:#79A2BD;font-size:16px;cursor: pointer;padding-top: 0;
                border: 3px solid #e0e0e0;border-radius: 20px;padding: 5px;padding-bottom:5px;padding-left:20px;padding-right:20px;
                 background:#EBEBEB">���</label>
               
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

