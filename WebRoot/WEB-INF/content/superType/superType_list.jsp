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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ʒ����</title>
<!-- titleͼ�� -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- ������ʽ -->
<link type="text/css" rel="stylesheet" href="resources/css/list.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />
<!-- ����js -->
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/js/select.js"></script>
<script type="text/javascript" src="resources/js/json2.js"></script>
<!-- ��ѡ���ȫѡ��ȫ��ѡ -->
<script type="text/javascript">  
 function selectAll(){
 var checklist = document.getElementsByName ("ck");
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
function delSelectSuperType(){
	var checklist = document.getElementsByName("ck");
	var ids = "";
	alert(checklist.length);
	for(var i = 0;i < checklist.length;i++){
		if(checklist[i].checked){
			ids += checklist[i].value + ",";
		}
	}
	alert(ids);
	if (ids != "") {
		$.ajax({
			type:"post",
			url:"delSelectStype?ids="+ids,
			dataType:"json",
			success:function(result){
			}
		});
	}
}
</script>  
</head>

<body>
<div id="container">
	<h2>������Ϣ</h2>	
	<div id="content">
    	<div id="uboxstyle">
        	<form action="" method="post">
        	<div id="word">��ѡ��</div>
            <div id="main1">           
                 <select name="language" id="language">
                            <option value="id"  selected="selected">����</option>
                            <option value="name" >����1</option>
                            <option value="rolename" >����2</option>
                 </select>            
            </div>
            <div id="main2"><input type="text"/></div>
            <div id="word"><input type="submit" value="��ѯ"/></div>
            </form>
        </div>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(pm.datas) > 0 }">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>����ID</th>
                    <th>��������</th>
                    <th>����</th>
                </tr>
                <c:forEach items="${pm.datas}" var="st">
                <tr>
                	<td><input type="checkbox" name="ck" value="${st.id}"/></td>
                    <td>${st.id}</td>
                    <td>${st.superTypeName}</td>
                    <td>
                    <c:if test="${sessionScope.admin.role.rolename == '��������Ա' }">
                    	<a href="deletesupertypebyid?superType.id=${st.id}">ɾ��</a>&nbsp;&nbsp;&nbsp;
                    	<a href="modifygetsupertypebyid?supertypeid=${st.id}">�޸�</a>
                    </c:if>
                    </td>
                </tr>	
                </c:forEach>
                </c:if>																							
        </table>
       <!--  <div id="word"><input type="button" value="ɾ��" onclick="delSelectSuperType()"/></div> -->
        <div align="center" id="page">
            <pg:pager items="${pm.total }" url="pagemodel.action" export="currentPageNumber=pageNumber">
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

