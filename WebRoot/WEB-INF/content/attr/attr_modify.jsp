<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
			opo = "<td>����ֵ(����ö��Ÿ���)</td>"+
                "<td><input type="+"'text'"+"name="+"'attr.attrvalue'"+" /></td>";	
		}
		$("#attrvalue").append(opo);
}

$(function(){
		var subtypeid = "${attr.subType.id}";
		$.ajax({
			type:"post",
			url:"getallsubtypes",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#subType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "";
					if (value.id == subtypeid) {
						opo = "<option value='"+value.id+"'selected="+"'selected'"+">"+value.subtypename+"</option>";
					}else{
						opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
					}
					$("#subType").append(opo);
				});
			}
				});
});
</script>
</head>

<body>
<div id="container">
	<h2>�����޸�</h2>
    <div id="uboxstyle" align="center">	
        <form action="modifyattr" method="post" onClick="return checkattr()">
            <table cellspacing="0" cellpadding="0">
            <tr>
                <td>����ID</td>
                <td><input type="text" name="attr.id" readonly="readonly" value="${attr.id}"/></td>
            </tr>
             <tr>
                <td>������</td>
                <td><input type="text" name="attr.attrname" value="${attr.attrname}" id="attrName"/>
                <label id="info"></label>
                </td>
            </tr>
             <tr>
                <td>��������</td>
                <td>
                <select name="attr.attrnameid" id="attrnameid" onchange="checkSelect()">
                            <c:if test="${attr.attrnameid == 0}">
                            	<option value="${attr.attrnameid}" selected="selected">�ֶ�����</option>
                            	<option value="1">���б���ѡȡ</option>
                            </c:if>
                            <c:if test="${attr.attrnameid == 1}">
                            	<option value="0">�ֶ�����</option>
                            	<option value="1" selected="selected">���б���ѡȡ</option>
                            </c:if>
                            
                 </select>     
                </td>
            </tr>
            <tr id="attrvalue">
            	<c:if test="${attr.attrnameid == 1}">
		           	<td>����ֵ(����ö��Ÿ���)</td>
		            <td><input type="text" name="attr.attrvalue" value="${attr.attrvalue}" id="attrValue"/>
		            <label id="info1"></label>
		            </td>
            	</c:if>   
            </tr>
             <tr>
                <td>��ƷС��</td>
                <td>
                <select name="subType.id" id="subType">
                            <!-- <option value="id"  selected="selected">��ƷС��1</option>
                            <option value="name" >��ƷС��2</option> -->
                 </select>     
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="�޸�" style="width:90px;height:30px;color:#79A2BD;font-size:16px">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>


