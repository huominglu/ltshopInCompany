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
		var supertypeid = "${supertype.id}";
		$.ajax({
			type:"post",
			url:"getallsupertype",
			dataType:"json",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				var opo = "";
				$.each(jsonobj,function(i,value){
					if (value.id == supertypeid) {
						opo = "<option selected="+"'selected'"+" value='"+value.id+"'>"+value.superTypeName+"</option>";
					}else{
						opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					}
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
        <c:if test="${currentpageno==null }">
			<c:set var="currentpageno" value="0" scope="request"/>
		</c:if>
        <table cellspacing="0" cellpadding="0">
        	<c:if test="${fn:length(subtypes) > 0}">
                <tr>
                	<th><input type="checkbox" onClick="selectAll()" id="controlAll"/></th>
                    <th>С��ID</th>
                    <th>С������</th>
                    <th>��������</th>
                    <th>����</th>
                </tr>
                <c:forEach items="${subtypes}" var="subtype">
                	<tr>
                	<td><input type="checkbox" name="groupCheckbox"/></td>
                    <td>${subtype.id}</td>
                    <td>${subtype.subtypename}</td>
                    <td>${subtype.superType.superTypeName}</td>
                    <td><a href="deletesubtype?subType.id=${subtype.id}">ɾ��</a>&nbsp;&nbsp;&nbsp;
                    <a href="getsubtypebyid?subType.id=${subtype.id}">�޸�</a></td>
                </tr>
                </c:forEach>
            </c:if>																					
        </table>
        <div id="word"><input type="button" value="ɾ��"/></div>
        <div align="center" id="page">
            <form  action="subsomepagemodel?currentpageno=0" method="post">
		<c:if test="${currentpageno>0}">
			<a  href="subsomepagemodel?currentpageno=0&pagesize=${pagesize}"  target="_self" >��ҳ</a>  
			<a  href="subsomepagemodel?currentpageno=${currentpageno-1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>
		</c:if>	  			
		<c:if test="${currentpageno==0}"> ��ҳ &nbsp;��һҳ</c:if>
		<c:if test="${currentpageno < totalpage-1}">			
			<a  href="subsomepagemodel?currentpageno=${currentpageno+1}&pagesize=${pagesize}"  target="_self" >��һҳ</a>  
			<a  href="subsomepagemodel?currentpageno=${totalpage-1}&pagesize=${pagesize}"  target="_self" >βҳ</a>		
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

