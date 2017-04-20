<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb18030" contentType="text/html; charset=gb18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>��������</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
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
function submit(){
	form1.submit();
}
</script>  

</head>

<body>
<div id="container">
	<h2>��������</h2>	
	<c:if test="${currentpageno==null }">
			<c:set var="currentpageno" value="0" scope="request"/>
		</c:if>
        <table cellspacing="0" cellpadding="0">
            
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>��������id</th>
                    <th>��Ʒ����</th>
                    <th>��Ʒ�۸�</th>
                    <th>��Ʒ����</th>
              		<th>�ܽ��</th>
                    

                </tr>
                <c:if test="${fn:length(requestScope.ots)>0 }">
		                <c:forEach items="${requestScope.ots }" var="orderitem">
			                <tr>
			                	<td><input type="checkbox" name="groupCheckbox" /></td>
			                    <td>${orderitem.id}</td>
			                    <td>${orderitem.productname }</td>
			                    <td>${orderitem.price }</td>
			                    <td>${orderitem.productnum }</td>
			                    <td><c:out value="${orderitem.price*orderitem.productnum}"></c:out></td>
			                </tr>
		                </c:forEach>
                </c:if>																				
        </table>
        <div align="center" id="page">
            <form  action="ordetail?currentpageno=0" method="post">
		<c:if test="${currentpageno>0}">
			<a  href="ordetail?currentpageno=0&pagesize=${pagesize}"  target="_self" >��ҳ</a>  
			<a  href="ordetail?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>
		</c:if>	  			
		<c:if test="${currentpageno==0}"> ��ҳ &nbsp;��һҳ</c:if>
		<c:if test="${currentpageno < totalpage-1}">			
			<a  href="ordetail?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>  
			<a  href="ordetail?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >βҳ</a>		
		</c:if> 
		<c:if test="${currentpageno==totalpage-1}"> ��һҳ &nbsp;βҳ</c:if> ��${currentpageno+1}ҳ   ��${totalpage}ҳ    
		
	           	ÿҳ��¼��<input type="text" name="pagesize" value="${pagesize }"/>
	           			<input type="submit" value="ȷ��"/>
	 	</form>
	 	<a href="listorder">����</a>
    	</div>
</div>

</body>
</html>
