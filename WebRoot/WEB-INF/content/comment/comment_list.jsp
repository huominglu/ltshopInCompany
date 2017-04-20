<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>���۹���</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
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
function submit(){
	form1.submit();
}
// function chaxun(){
// 	alert("chaxun");
// 	var obj = document.getElementById("chaxun").value="";
// 	obj.value="";
// }
</script>  
<script type="text/javascript">
$().ready(function(){
	$("#chaxun").focus(function(){
		$("#chaxun").val("");
	});
});
</script>
</head>

<body>
<div id="container">
	<h2>������Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form name="form1" action="commentList" method="post">
	        	<div id="word">������</div>
	            <div id="main1">           
	                 <!-- <select name="language" id="language">
	                            <option value="id"  selected="selected">����</option>
	                            <option value="name" >����1</option>
	                            <option value="rolename" >����2</option>
	                 </select>  -->           
	            </div>
	            <div id="main2"><input id="chaxun" type="text" name="comment.product.id" value="��������ƷID��ѯ����"/></div>
	            <div id="word"><a onclick="submit()" style="cursor: pointer;">��ѯ</a></div>
	            <div id="word"><a style="cursor: pointer;">����ɾ��</a></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>����ID</th>
                    <th>�����û���</th>
                    <th>��Ʒ���</th>
                    <th>����</th>
                    <th style="width: 80px;">��������</th>
                    <th>��������</th>
                    <th>����</th>
                </tr>
                <c:if test="${fn:length(requestScope.comments)>0 }">
	                <c:forEach items="${requestScope.comments }" var="cts">
		                <tr>
		                	<td><input type="checkbox" name="groupCheckbox"/></td>
		                    <td>${cts.id }</td>
		                    <td>${cts.username }</td>
		                    <td>${cts.product.id }</td>
		                    <td>${cts.ctitle }</td>
		                    <td style="width: 80px;" title="${cts.content }"><label style="width: 400px;;display:block;overflow:hidden;white-space:nowrap;">${cts.content }</label></td>
		                    <td>${cts.cdate }</td>
		                    <td>
		                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
		                    	<a href="deleteComment?id=${cts.id }">ɾ��</a>
		                    </c:if>
		                    </td>
		                </tr>		
	                </c:forEach>	
                </c:if>																					
        </table>
        <div align="center" id="page">
        <form  action="commentList?currentpageno=0" method="post">
			<c:if test="${currentpageno>0}">
				<a  href="commentList?currentpageno=0&pagesize=${pagesize}"  target="_self" >��ҳ</a>  
				<a  href="commentList?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>
			</c:if>	  			
			<c:if test="${currentpageno==0}"> ��ҳ &nbsp;��һҳ</c:if>
			<c:if test="${currentpageno < totalpage-1}">			
				<a  href="commentList?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>  
				<a  href="commentList?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >βҳ</a>		
			</c:if> 
			<c:if test="${currentpageno==totalpage-1}"> ��һҳ &nbsp;βҳ</c:if> ��${currentpageno+1}ҳ   ��${totalpage}ҳ    
			
		           	ÿҳ��¼��<input type="text" name="pagesize" value="${pagesize }"/>
		           			<input type="submit" value="ȷ��"/>
	 	</form>
    	</div>
    </div>
</div>
</body>
</html>

