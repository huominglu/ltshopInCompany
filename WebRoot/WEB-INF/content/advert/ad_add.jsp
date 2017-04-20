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
<title>广告管理</title>
<!-- title图标 -->
<link rel="shortcut icon" href="resources/img/hml.png">
<!-- 导入样式 -->
<link type="text/css" rel="stylesheet" href="resources/css/modify.css" />
<link type="text/css" rel="stylesheet" href="resources/css/select.css" />

<!-- 导入js -->
<!-- <script type="text/javascript" src="resources/js/select.js"></script> -->
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
<script src="resources/js/json2.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
function insertTitle(tValue){  
   var t1 = tValue.lastIndexOf("\\");  
   var t2 = tValue.lastIndexOf(".");  
   if(t1 >= 0 && t1 < t2 && t1 < tValue.length){  
    document.getElementById("filename").innerHTML = tValue.substring(t1 + 1, t2);  
   }  
}  
</script>
<script type="text/javascript">
	$().ready(function(){
		$.ajax({
			type:"post",
			url:"getallsupertype",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#superType").html("");
				$.each(jsonobj,function(i,value){
					var opo = "<option value='"+value.id+"'>"+value.superTypeName+"</option>";
					$("#superType").append(opo);
					var subtype = value.subtypes;
					if(i == 0){
						$("#subtype").html("");
						$.each(subtype,function(i,value){
							var opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
							$("#subtype").append(opo);
						});
					}
				});
			}
		});
		
		/* $.ajax({
			type:"post",
			url:"getallsubtype?superType.id=29",
			success:function(result){
				var jsonobj = JSON.parse(result);
				$("#subtype").html("");
				$.each(jsonobj,function(i,value){
					var opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
					$("#subtype").append(opo);
				});
			}
		}); */
			
		$("#superType").change(function(){
			var id = $("#superType").val();
			$.ajax({
				type:"post",
				url:"getallsubtype?superType.id="+id,
				success:function(result){
					var jsonobj = JSON.parse(result);
					$("#subtype").html("");
					$.each(jsonobj,function(i,value){
						var opo = "<option value='"+value.id+"'>"+value.subtypename+"</option>";
						$("#subtype").append(opo);
						var products = value.prods;
						if(i == 0){
							$("#productid").html("");
							$.each(products,function(j,val){
								var opo = "<option value='"+val.id+"'>"+val.id+"-"+val.productname+"</option>";
								$("#productid").append(opo);
							});
						}
					});
				}
			});
		});
		
		$("#subtype").change(function(){
			var id = $("#subtype").val();
			$.ajax({
				type:"post",
				url:"getallproductBysubtype?subType.id="+id,
				success:function(result){
					var jsonobj = JSON.parse(result);
					$("#productid").html("");
					$.each(jsonobj,function(i,value){
						var opo = "<option value='"+value.id+"'>"+value.id+"-"+value.productname+"</option>";
						$("#productid").append(opo);
					}); 
				}
			});
		});
	});
</script>
</head>

<body>
<div id="container">
	<h2>广告添加</h2>
    <div id="uboxstyle" align="center">	
        <form action="ad_add" method="post" enctype="multipart/form-data" onClick="return checkAd()">
            <table cellspacing="0" cellpadding="0" style="margin-bottom: 100px;">
            <tr>
                <td>广告类型</td>
                <td>
                <select name="adType.id" >
                      <option value="1"  selected="selected">商品推荐</option>
                      <option value="2" >商品促销</option>
                </select>     
                </td>
            </tr>
            <tr>
                <td>商品小类</td>
                <td>
	                <select id="superType">
	                	
	                </select>
	                <select name="advert.subtypeid" id="subtype">
	                	
	                 </select>     
                </td>
            </tr>
            <tr>
                <td>商品编号</td>
                <td>
                <select name="advert.productid" id="productid">
                            
                 </select>     
                </td>
            </tr>
             <tr>
                <td>广告描述</td>
                <td><input type="text" size="60" name="advert.description" /></td>
            </tr>
             <tr>
                <td>开始时间</td>
                <td><input name="advert.begintime" type="text"  class="laydate-icon" onclick="laydate()"/></td>
                
            </tr>
             <tr>
                <td>截止时间</td>
                <td><input type="text" name="advert.endtime" class="laydate-icon" onclick="laydate()" /></td>
            </tr>
            <tr>
                <td>广告图片</td>
                <td>
                	<a class="btn_addPic" href="javascript:void(0);"><span><em>+</em>添加图片</span>
                    <input class="filePrew" type="file" name="upload" onChange="if(this.value)insertTitle(this.value);">
                    </a>
                    <label id="filename"></label>
                </td>
            </tr>
            <tr>
                <td>广告状态</td>
                <td>
                <select name="adStatus.id" >
                            <option value="1"  selected="selected">应用中</option>
                            <option value="2" >过期</option>
                 </select>     
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" value="添加" style="width:90px;height:30px;color:#79A2BD;font-size:16px;line-height: 1%;cursor: pointer;">
                </td>
            </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
