<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>比赛通知</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/SignUp_Static/layui/css/layui.css" media="all" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/SignUp_Static/js/jquery-1.4.2.min.js"></script>
		<script src="<%=request.getContextPath() %>/SignUp_Static/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/SignUp_Static/js/Currency.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/SignUp_Static/css/myCss.css" />
		
	</head>
	<style type="text/css">
		a:hover {
			color: red;
		}
	
		.layui-form-item .layui-inline{
			margin-bottom: 4px;
		}
		
		.layui-table{
			width: 90%;
			margin-left: 56px;
		}
		
		.layui-table td, .layui-table th {
		    position: relative;
		    min-height: 20px;
		    line-height: 60px;
		    font-size: 14px;
		}
		.layui-icon {
		    font-family: layui-icon !important;
		    font-size: 24px;
		    font-style: normal;
		    -webkit-font-smoothing: antialiased;
		    -moz-osx-font-smoothing: grayscale;
		}
		
	</style>
	<script>
		$(function() {
			$("#Advanced_Search_Panel").hide();
			$("#Advanced_Search").toggle(function() {
				$("#Advanced_Search_Panel").show(150);
			}, function() {
				$("#Advanced_Search_Panel").hide(150);
			})
		})
	</script>
	<body>

		<fieldset class="layui-elem-field layui-field-title">
		  <legend class="indexTitle">比赛通知</legend>
		</fieldset>
		
		<!-- <table class="layui-table" lay-even="" lay-skin="nob">
			<colgroup>
			    <col width="150">
			    <col width="150">
			    <col width="200">
			    <col>
			</colgroup>
			<tbody>
			    <tr>
					<td>2020上海交大人工智能与人机交互全国挑战赛通知</td>
					<td style="text-align: right;">2020-09-08</td>
					<td style="text-align: right;">
						<a href="PDF/2020上海交大人工智能与人机交互全国挑战赛通知.pdf" target="_blank" style="color: #58a7ff;">
			      			查看/下载  <i class="layui-icon">&#xe601;</i>
		      			</a>
					</td>
				</tr>
	    		<tr>
					<td>变形战士比赛规则</td>
					<td style="text-align: right;">2020-09-08</td>
					<td style="text-align: right;">
						<a href="PDF/变形战士比赛规则20200908.pdf" target="_blank" style="color: #58a7ff;">
							查看/下载  <i class="layui-icon">&#xe601;</i>
						</a>
					</td>
	    		</tr>
	    		<tr>
					<td>超变战场比赛规则</td>
					<td style="text-align: right;">2020-09-08</td>
					<td style="text-align: right;">
						<a href="PDF/超变战场20200908.pdf" target="_blank" style="color: #58a7ff;">
							查看/下载  <i class="layui-icon">&#xe601;</i>
						</a>
					</td>
	    		</tr>
	    		<tr>
					<td>智慧交通_小学组比赛规则</td>
					<td style="text-align: right;">2020-09-08</td>
					<td style="text-align: right;">
						<a href="PDF/智慧交通_小学组.pdf" target="_blank" style="color: #58a7ff;">
							查看/下载  <i class="layui-icon">&#xe601;</i>
						</a>
					</td>
	    		</tr>
	    		<tr>
					<td>智慧交通_初中组比赛规则</td>
					<td style="text-align: right;">2020-09-08</td>
					<td style="text-align: right;">
						<a href="PDF/智慧交通_初中组20200908.pdf" target="_blank" style="color: #58a7ff;">
							查看/下载  <i class="layui-icon">&#xe601;</i>
						</a>
					</td>
	    		</tr>
	    		<tr>
					<td>智慧交通_高中组比赛规则</td>
					<td style="text-align: right;">2020-09-08</td>
					<td style="text-align: right;">
						<a href="PDF/智慧交通_高中组20200908.pdf" target="_blank" style="color: #58a7ff;">
							查看/下载  <i class="layui-icon">&#xe601;</i>
						</a>
					</td>
	    		</tr>
			</tbody>
		</table> -->
		
			
			
	</body>
	
	<script>
		
		$(function() {
			select_Readonly();//[Layui动态[select]只读]
				
				layui.use(['laydate','laypage', 'layer' ,'form', 'util', 'table', 'element', 'flow'], function() {
					$.ajaxSetup({async:false});
				  	var laypage = layui.laypage
				  	,layer = layui.layer;
				  	var laydate = layui.laydate;
					var flow = layui.flow;
					var util = layui.util;
					var form = layui.form;
					
					//固定块
					util.fixbar({
						css: {
							right: 10,
							bottom: 10
						},
						bgcolor: '#393D49',
						click: function(type) {}
					});
					
					
			})
		})
	</script>
	

</html>