<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>��Ʒ����</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- ����js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
function checkSelect(){
		$("#attrvalue").html("");
		var attrtypeid = $("#attrnameid").val();
		var opo = "";
		if (attrtypeid == "1") {
			opo = "<td>����ֵ</td>"+
                "<td><input type="+"'text'"+"name="+"'attr.attrvalue'"+" /></td>";	
		}
		$("#attrvalue").append(opo);
}
$(function(){
		$.ajax({
			type:"post",
			url:"getallsupertype",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					$("#superType").append(opo);
					var subtype = value.subtypes;
					if(i == 0){
						$("#subType").html("");
						$.each(subtype,function(i,value){
							var opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
							$("#subType").append(opo);
						});
					}
			});
			}
		});
	});
function getSubType(){
		var superTypeid = $("#superType").val();
		$.ajax({
			type:"post",
			url:"getallsubtype?superType.id="+superTypeid,
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#subType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
					$("#subType").append(opo);
				});
			}
				});
}

</script>
</head>

<body>
<div id="container">
	<h2>�������</h2>
    <div id="uboxstyle" align="center">	
        <form action="addattr" method="post" onClick="return checkattr()">
            <table cellspacing="0" cellpadding="0">
	        <tr>
                <td>������Ʒ����</td>
              
                <td>
                <select name="superType.id" id="superType" onchange="getSubType()" onclick="getSubType()">
                            
                 </select>     
                </td>
            </tr>
            <tr>
                <td>������ƷС��</td>
                <td>
                <select name="subType.id" id="subType">
                            <!-- <option value="id"  selected="selected">��ƷС��1</option>
                            <option value="name" >��ƷС��2</option> -->
                 </select>     
                </td>
            </tr>
             <tr>
                <td>������</td>
                <td><input type="text" name="attr.attrname" id="attrName"/>
                <label id="info"></label>
                </td>
            </tr>
            <tr>
                <td>��������</td>
                <td>
                <select name="attr.attrnameid" id="attrnameid" onchange="checkSelect()">
                            <option value="0"  selected="selected">�ֶ�����</option>
                            <option value="1" >���б���ѡȡ</option>
                 </select>     
                </td>
            </tr>
             <tr id="attrvalue">
                <td>����ֵ(����ö��Ÿ���)</td>
                <td><input type="text" name="attr.attrValue" id="attrValue"/>
                <label id="info1"></label>
                </td>
            </tr>
             
            <tr>
                <td></td>
                <td>
                <input type="submit" value="���" style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

