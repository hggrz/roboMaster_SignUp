<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="Expires" content="0">
		<base href="<%=basePath%>">
		<title>上传文件</title>
		<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
		<script type="text/javascript" src="static/js/jquery-1.4.2.min.js"></script>
		<script src="static/layui/layui.js"></script>
		<script src="static/js/Currency.js"></script>
		<style type="text/css">
			.red{
				color: #FF5722!important;
			}
		</style>
	</head>

	<body style="width:90%;margin-left: 5%;" >
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>上传文件</legend>
		</fieldset>
		<blockquote class="layui-elem-quote layui-quote-nm "style="border-color:#ffb64b ;font-size: 1.2em;">
		    <font style="color: #FF5722!important">  上传pdf文件须知</font>： <br>
		     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;支持上传压缩文件格式： [ <font class="red">.pdf</font>  ]  <br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传文件最大上限：[3M]
		</blockquote>
		
		
		<form class="layui-form" action="<%=request.getContextPath()%>/Ba/Sys/Upload_file_PDF.do" id="example" name="example" lay-filter="example" method="post" enctype="multipart/form-data" >
			<div class="layui-form-item">
				<label class="layui-form-label">压缩文件：</label>
				<div class="layui-input-block">
					<input type="file"  name="obj" required style="margin-top: 6px;"  class="layui-btn-radius layui-bg-blue">
					<input type="hidden" name="TUFS_Name"  id="TUFS_Name" />
					<input type="hidden" name="TUFS_SUPID"  id="TUFS_SUPID" />
					<input type="hidden" name="TUFS_Category"  id="TUFS_Category"  />
					<input type="hidden" name="SUP_School"  id="SUP_School"  />
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-bg-blue" lay-submit="" lay-filter="demo1">立即提交</button>
					<div class="layui-btn layui-bg-orange" id="FH" style="width:100px;">返回</div>
				</div>
			</div>
		</form>

	</body>
	<c:if test="${Message!=null}">
		<script type="text/javascript">
		layui.use(['layer'],function(){
			var layer=layui.layer;
			FriendlyPrompt("${Message}"); 
			if("${Message}"=='上传文件成功！'){
				setTimeout(function(){//刷新
					close_layer();//关闭窗口刷新
				 },1500);
				
			}
		})
		</script>
	</c:if>	      
	  <script type="text/javascript">
		  $(function(){
				//返回
				$('#FH').click(function(){
					//console.log($('#TUFS_SUPID').val())
					//console.log($('#TUFS_Category').val())
					//console.log($('#TUFS_Name').val())
					close_layer();
				})
		   })
	  </script>        
	  <script type="text/javascript">
	  function child(map){
		  $(function(){
		  layui.use(['form'],function(){
				var form=layui.form;
				//console.log(map)
				 //compose(map);//赋值数据
				 $('#TUFS_SUPID').val(map.TUFS_SUPID);
				 $('#TUFS_Category').val(map.TUFS_Category);
				 $('#TUFS_Name').val(map.TUFS_Name);
				 $('#SUP_School').val(map.SUP_School);
			})
		  })
	  }
	  </script>        
	          
</html>
