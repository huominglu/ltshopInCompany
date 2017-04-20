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
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript">
function insertTitle(tValue){  
   var t1 = tValue.lastIndexOf("\\");  
   var t2 = tValue.lastIndexOf(".");  
   if(t1 >= 0 && t1 < t2 && t1 < tValue.length){  
    document.getElementById("filename").innerHTML = tValue.substring(t1 + 1, t2);  
   }  
}
$(function(){
		$.ajax({
			type:"post",
			url:"getsupertypebybrand",
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
			url:"getsubtypebybrand?superType.id="+superTypeid,
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
function getBrand(){
	var subTypeid = $("#subType").val();
	$.ajax({
		type:"post",
		url:"getbrand?subType.id="+subTypeid,
		dataType:"json",
		success:function(result){
			var jsonobj = JSON.parse(result);
			$("#brand").html("");
			$.each(jsonobj,function(i,value){
				var opo = "<option value='"+i+"'>"+value+"</option>";
				$("#brand").append(opo);
			});
		}
	});
}
/* function getAttr(){
	var subTypeid = $("#subType").val();
	$.ajax({
		type:"post",
		url:"getattr?subType.id="+subTypeid,
		dataType:"json",
		success:function(result){
			var jsonobj = JSON.parse(result);
			$("#attr").html("");
			$.each(jsonobj,function(i,value){
				var opo = "";
				if (value.attrnameid == 0) {
					opo = "<tr><td>"+value.attrname+":</td><td><input  type="+"'text'"+"id="+value.attrname+"></td></tr>";
				}else{
					opo = "<tr><td>"+value.attrname+":</td><td><select id="+value.attrname+"></select></td></tr>";
					var strs = new Array();
					strs = value.attrvalue.split(",");
					for(var i=0;i<strs.length();i++){
						var oop = "<option value="+i+">"+strs[i]+"</option>";
						$("#"+value.attrname).append(oop);
					}	
				}
				$("#prodadd").append(opo);
			});
		}
	});
} */
</script>

</head>

<body>
<div id="container">
	<h2>��Ʒ���</h2>
    <div id="uboxstyle" align="center">	
        <form action="addprod" method="post" enctype="multipart/form-data"> 
            <table cellspacing="0" cellpadding="0" id="prodadd" style="margin-bottom: 100px;">
            <tr>
                <td>��Ʒ����</td>
                <td>
                <select name="superType.id" id="superType" onchange="getSubType()" onclick="getSubType()" >
                            <!-- <option value="id"  selected="selected">��Ʒ����1</option>
                            <option value="name" >��Ʒ����2</option> -->
                 </select>     
                </td>
            </tr>
            <tr>
                <td>��ƷС��</td>
                <td>
                <select name="subType.id" id="subType" onchange="getBrand()" onclick="getBrand()">
                            <!-- <option value="id"  selected="selected">��ƷС��1</option>
                            <option value="name" >��ƷС��2</option> -->
                 </select>     
                </td>
            </tr>
            <tr>
                <td>��Ʒ����</td>
                <td>
                <input type="text" name="product.productname" />   
                </td>
            </tr>
            <tr id="attr" >
                <!-- <td>����</td>
                <td>
                <select name="product.brand" id="brand">
                            <option value="id"  selected="selected">Ʒ��1</option>
                            <option value="name" >Ʒ��2</option>
                 </select>     
                </td> -->
            </tr>
            <!-- <tr>
                <td>Ʒ��</td>
                <td>
                <select name="product.brand" id="brand">
                            <option value="id"  selected="selected">Ʒ��1</option>
                            <option value="name" >Ʒ��2</option>
                 </select>     
                </td>
            </tr> -->
             <tr>
                <td>��Ʒ����</td>
                <td><input type="text" name="product.introduce" /></td>
            </tr>
             <tr>
                <td>��Ʒ�۸�</td>
                <td><input type="text" name="product.price" /></td>
            </tr>
             <tr>
                <td>��Ʒ�ּ�</td>
                <td><input type="text" name="product.nowprice" /></td>
            </tr>
            <tr>
                <td>��ƷͼƬ</td>
                <td>
                	<a class="btn_addPic" href="javascript:void(0);"><span><em>+</em>���ͼƬ</span>
                    <input class="filePrew" type="file" name="upload" onChange="if(this.value)insertTitle(this.value);">
                    </a>
                    <label id="filename"></label>
                </td>
            </tr>
            <tr>
                <td>�ϼ�ʱ��</td>
                <td><input type="text" name="product.intime" onclick="laydate()"/></td>
            </tr>
            <tr>
                <td>�Ƿ���Ʒ</td>
                <td><input name="product.isnew" type="radio" value="1">��
					<input name="product.isnew" type="radio" value="0">��</td>
            </tr>
            <tr>
                <td>�Ƿ��ؼ�</td>
                <td><input name="product.issale" type="radio" value="1">��
					<input name="product.issale" type="radio" value="0">��</td>
            </tr>
            <tr>
                <td>�Ƿ�����</td>
                <td><input name="product.ishost" type="radio" value="1">��
					<input name="product.ishost" type="radio" value="0">��</td>
            </tr>
            <tr>
                <td>�Ƿ��ر��Ƽ�</td>
                <td><input name="product.isspecial" type="radio" value="1">��
					<input name="product.isspecial" type="radio" value="0">��</td>
            </tr>
            <tr>
                <td>��Ʒ����</td>
                <td><input type="text" name="product.productnum" /></td>
            </tr>
            <tr>
                <td>��Ʒ��Դ</td>
                <td><input type="text" name="product.origin" /></td>
            </tr>
            <tr><td><input type="submit" value="���" style="width:90px;height:30px;color:#79A2BD;font-size:16px;padding-top: 0;">
            </td>
            </tr>
            </table>
            
        </form>
    </div>
</div>
</body>
</html>


