<%@ page language="java" import="java.util.*" pageEncoding="gb2312" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
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
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
<!-- <!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<!-- ��ѡ���ȫѡ��ȫ��ѡ -->
<script type="text/javascript">  
 function selectAll(){
 var checklist = document.getElementsByName ("groupCheckbox");
   if(document.getElementById("controlAll").checked)
   {
   for(var i=0;i<checklist.length;i++)
   {
      checklist[i].checked = 1;
   } 
 }else{
  for(var j=0;j<checklist.length;j++)
  {
     checklist[j].checked = 0;
  }
 }
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
			});
			}
		});
	});
</script>  

</head>

<body>
<div id="container">
	<h2>С����Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="subsomepagemodel" method="post">
        	<div id="word">��ѡ��������ƣ�</div>
            <div id="main1">           
                 <select name="superType.id" id="superType" onchange="form1.submit();">
                            
                 </select>            
            </div>
            <div id="word"><input value="��ѯ" type="submit"/></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>С��ID</th>
                    <th>С������</th>
                    <th>��������</th>
                    <th>����</th>
                </tr>
                <c:forEach items="${pm.datas}" var="subtype">
                	<tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>${subtype.id}</td>
                    <td>${subtype.subtypename}</td>
                    <td>${subtype.superType.superTypeName}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
                    	<a href="deletesubtype?subType.id=${subtype.id}">ɾ��</a>&nbsp;&nbsp;&nbsp;
                    	<a href="getsubtypebyid?subType.id=${subtype.id}">�޸�</a>
                    </c:if>
                    </td>
                </tr>
                </c:forEach>
            </c:if>																					
        </table>
        <div id="word"><input type="button" value="ɾ��"/></div>
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="subpagemodel.action" export="currentPageNumber=pageNumber">
                <pg:first>
                    <a href="${pageUrl}">��ҳ</a>
                </pg:first>
                <pg:prev>
                    <a href="${pageUrl}">ǰҳ</a>
                </pg:prev>
                <pg:pages>
                    <c:choose>
                        <c:when test="${ currentPageNumber eq pageNumber}">
                            <font>${pageNumber}</font>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageUrl }">${pageNumber }</a>
                        </c:otherwise>
                    </c:choose>
                </pg:pages>
                <pg:next>
                    <a href="${pageUrl }">��ҳ</a>
                </pg:next>
                <pg:last>
                    <a href="${pageUrl }">βҳ</a>
                </pg:last>
            </pg:pager>
    	</div>
    </div>
</div>
</body>
</html>

