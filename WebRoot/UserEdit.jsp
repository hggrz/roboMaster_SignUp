<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>用户信息编辑</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/static/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/HistoricalOrder.css" media="all">
		<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/jquery-1.4.2.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/Currency.js"></script>
	</head>
	<body class="layui-container">
		<form class="layui-form" action="" lay-filter="example" style="margin-top: 5%;">
			<div class="layui-form-item">
				<input type="hidden" name="ID" id="ID" />
				<label class="layui-form-label">手机号：</label>
				<div class="layui-input-inline">
					<input type="text" id="PHONE" name="PHONE" lay-verify="PHONE" autocomplete="off" placeholder="手机号" class="layui-input">
				</div>
				<label class="layui-form-label">公司名称：</label>
				<div class="layui-input-inline">
					<input type="text" id="COMPANY_NAME" name="COMPANY_NAME" lay-verify="COMPANY_NAME" autocomplete="off" placeholder="公司名称" class="layui-input">
				</div>
				<label class="layui-form-label">邮政编码：</label>
				<div class="layui-input-inline">
					<input type="text" id="ZIP_CODE" name="ZIP_CODE" lay-verify="ZIP_CODE" autocomplete="off" placeholder="邮政编码" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">联系地址：</label>
				<div class="layui-input-block">
					<input type="text" style="width: 78.7%;min-width: 233px;" id="CONTACT_ADDRESS" name="CONTACT_ADDRESS" lay-verify="CONTACT_ADDRESS" autocomplete="off" placeholder="联系地址" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">公司网址：</label>
				<div class="layui-input-inline">
					<input type="text" name="COMPANY_WEBSITE" id="COMPANY_WEBSITE" lay-verify="COMPANY_WEBSITE" autocomplete="off" placeholder="公司网址" class="layui-input">
				</div>
				<label class="layui-form-label">职务：</label>
				<div class="layui-input-inline">
					<input type="text" id="POSITION" name="POSITION" lay-verify="POSITION" autocomplete="off" placeholder="职务" class="layui-input">
				</div>
				<label class="layui-form-label">部门：</label>
				<div class="layui-input-inline">
					<input type="text" id="DEPARTMENT" name="DEPARTMENT" lay-verify="DEPARTMENT" autocomplete="off" placeholder="部门" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<button id="Sub" class="layui-btn layui-bg-blue" style="margin-left: 40%">保存修改</button>
			</div>
		</form>
	</body>
	<script>
		function child(data) {
		    layui.use(['form', 'layedit', 'laydate','jquery','element'], function() {
			var form = layui.form,
				layer = layui.layer,
				layedit = layui.layedit,
				laydate = layui.laydate;
			var $ = layui.jquery,element = layui.element; 
			
			
			$("#Sub").click(function(){
				
				UpdUSer(getParam());
			})
			
			function getParam(){
					var map={};
				    map.ID=$("#ID").val();
					if($.trim($("#PHONE").val()).length!=0){map.PHONE=$.trim($("#PHONE").val())}
					if($.trim($("#COMPANY_NAME").val()).length!=0){map.COMPANY_NAME=$.trim($("#COMPANY_NAME").val())}
					if($.trim($("#ZIP_CODE").val()).length!=0){map.ZIP_CODE=$.trim($("#ZIP_CODE").val())}
					if($.trim($("#CONTACT_ADDRESS").val()).length!=0){map.CONTACT_ADDRESS=$.trim($("#CONTACT_ADDRESS").val())}
					if($.trim($("#COMPANY_WEBSITE").val()).length!=0){map.COMPANY_WEBSITE=$.trim($("#COMPANY_WEBSITE").val())}
					if($("#POSITION").val().length!=0){map.POSITION=$.trim($("#POSITION").val())}
					if($.trim($("#DEPARTMENT").val()).length!=0){map.DEPARTMENT=$.trim($("#DEPARTMENT").val())}
					return map;
			}
			
			function UpdUSer($data){
				$.post("<%=request.getContextPath()%>/sa/user/UpdUSer.ba",{map:JSON.stringify($data)},success,'json');
				LayuiSXparents();  
				function success(result){
						var $Ts=result.Message==true?"更新数据成功！":"更新数据失败……";
						  msg($Ts,1);
				 }
			}
			lading(data);
			function lading(data){
				var id=data.id!=null && data.id!="-"?data.id:"";
				var PHONE=data.PHONE!=null&&data.PHONE!="-"?data.PHONE:"";
				var COMPANY_NAME=data.COMPANY_NAME!=null&&data.COMPANY_NAME!="-"?data.COMPANY_NAME:"";
				var ZIP_CODE=data.ZIP_CODE!=null&&data.ZIP_CODE!="-"?data.ZIP_CODE:"";
				var CONTACT_ADDRESS=data.CONTACT_ADDRESS!=null&&data.CONTACT_ADDRESS!="-"?data.CONTACT_ADDRESS:"";
				var COMPANY_WEBSITE=data.COMPANY_WEBSITE!=null&&data.COMPANY_WEBSITE!="-"?data.COMPANY_WEBSITE:"";
				var POSITION=data.POSITION!=null&&data.POSITION!="-"?data.POSITION:"";
				var DEPARTMENT=data.DEPARTMENT!=null&&data.DEPARTMENT!="-"?data.DEPARTMENT:"";
				//表单初始赋值
				form.val('example',{
					"ID":id,
					"PHONE": PHONE ,
					"COMPANY_NAME": COMPANY_NAME,
					"ZIP_CODE": ZIP_CODE,
					"CONTACT_ADDRESS": CONTACT_ADDRESS,
					"COMPANY_WEBSITE": COMPANY_WEBSITE,
					"POSITION": POSITION,
					"DEPARTMENT":DEPARTMENT
				})
			}
		});
			
		}
		
	</script>
	
</html>
