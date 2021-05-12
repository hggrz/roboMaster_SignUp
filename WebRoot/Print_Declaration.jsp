<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>申报书打印</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<link rel="stylesheet" href="static/layui/css/layui.css" media="all" />
		<script type="text/javascript" src="static/js/jquery-1.4.2.min.js"></script>
		<script src="static/js/Currency.js"></script>
		<script src="static/layui/layui.js"></script>
	</head>

	<style>
		.RequiredStyle {
			color: red;
		}
		.Input_Width{
			width: 250px!important;
		}
		.layui-table td{
			border-width: 1px;
		    border-style: solid;
		    border-color: #333;
		}
	</style>
	<body>
	<!--startprint-->
		<table class="layui-table" style="width: 100%; text-align: center; margin: auto;margin-top: 60px;">
			
			<tr>
				<td colspan="6" style="text-align: center;height: 50px;font-size: 1.3em;"><strong >2019年上海市中小学机器人竞赛报名单</strong></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;height: 40px;width: 150px;"><strong>参赛项目</strong></td>
				<td colspan="2" style="text-align: center;"><strong>组别</strong></td>
				<td colspan="2" style="text-align: center;"><strong>区</strong></td>
			</tr>
			<tr>
				<td colspan="2" class="My_edit" style="height: 40px;" id="SUP_Project"></td>
				<td colspan="2" class="My_edit" id="SUP_Group"></td>
				<td colspan="2" class="My_edit" id="SUP_Area"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;height: 40px;"><strong>队员姓名</strong></td>
				<td width="8%"><strong>性别</strong></td>
				<td style="text-align: center;"><strong>学籍号</strong></td>
				<td colspan="2" style="text-align: center;"><strong>学籍所在学校(按单位公章填写)</strong></td>
			</tr>
			<tr>
				<td colspan="2" class="My_edit" style="height: 40px;" id="SUDS_One_Name"></td>
				<td class="My_edit" id="SUDS_One_Gender"></td>
				<td class="My_edit" id="SUDS_One_StudentNumber"></td>
				<td colspan="2" class="My_edit" id="SUDS_One_School"></td>
			</tr>
			<tr>
				<td colspan="2" class="My_edit" style="height: 40px;" id="SUDS_Tow_Name"></td>
				<td class="My_edit" id="SUDS_Tow_Gender"></td>
				<td class="My_edit" id="SUDS_Tow_StudentNumber"></td>
				<td colspan="2" class="My_edit" id="SUDS_Tow_School"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;height: 40px;"><strong>指导老师姓名</strong></td>
				<td style="text-align: center;"><strong>性别</strong></td>
				<td style="text-align: center;"><strong>职务/职称</strong></td>
				<td colspan="2" style="text-align: center;"><strong>所在单位(按单位公章填写)</strong></td>
			</tr>
			<tr>
				<td colspan="2" class="My_edit" style="height: 40px;" id="SUP_Coach_Name"></td>
				<td class="My_edit" id="SUP_Coach_Gender"></td>
				<td class="My_edit" id="SUP_Coach_Position"></td>
				<td colspan="2" class="My_edit" id="SUP_Coach_Unit"></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;height: 40px;"><strong>手机号码</strong></td>
				<td colspan="3" class="My_edit" id="SUP_Coach_Phone"></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;height: 40px;"><strong>电子邮箱</strong></td>
				<td colspan="3" class="My_edit" id="SUP_Coach_Email"></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;height: 40px;"><strong>打印时间</strong></td>
				<td colspan="3" class="My_edit" id="Print_Time"></td>
			</tr>
			<tr>
				<td rowspan="4" colspan="6" style="text-align: center;height: 120px;">
					<!-- <div style="height: 200px;width:550px;">
						<strong>在此请盖学校公章</strong>
					</div> -->
				<strong>在此请盖学校公章</strong>
				
				</td>
			</tr>
			
		</table>
		
		<div class="layui-form-item anNiuStyle">
			<input type="text" id="Map_Hide" style="width: 0px;border: 0px;">
		</div>
	<!--endprint-->
	</body>

	<script>
		function child(Map) {
			//console.log(Map);
			$(function() {
				$.ajaxSetup({async: false});
				layui.use(['laypage', 'laydate', 'layer', 'form', 'util', 'table', 'element', 'flow', 'jquery'], function() {
					var laydate = layui.laydate;
					var flow = layui.flow;
					var util = layui.util;
					var laypage = layui.laypage;
					var form = layui.form;
					var layer = layui.layer;
					var jquery = layui.jquery;
					var table = layui.table;
					
					//Layui_edit(); //开启表格layui编辑
					select_Readonly(); //[Layui动态[select]只读]
					$('#Map_Hide').focus();//光标移至文本框 放置打印窗口不确定的 BUG
					//固定块
					util.fixbar({
						css: {
							right: 10,
							bottom: 50
						},
						bgcolor: '#393D49',
						click: function(type) {}
					});
					
					//赋值时间
					$('#Print_Time').html(getdatetime(gitData()));
					
					
					find_data(Map);
					
					function find_data(Map) {
						
							$("#SUP_Project").html(Map.SUP_map.SUP_Project);
							$("#SUP_Group").html(Map.SUP_map.SUP_Group);
							$("#SUP_Area").html(Map.SUP_map.SUP_Area);
							//第一队员
							$("#SUDS_One_Name").html(Map.SUDS_One_Name);
							$("#SUDS_One_Gender").html(Map.SUDS_One_Gender);
							$("#SUDS_One_StudentNumber").html(Map.SUDS_One_StudentNumber);
							$("#SUDS_One_School").html(Map.SUDS_One_School);
							$("#SUDS_One_YearOfGraduation").html(Map.SUDS_One_YearOfGraduation);
							//第二队员
							$("#SUDS_Tow_Name").html(Map.SUDS_Tow_Name);
							$("#SUDS_Tow_Gender").html(Map.SUDS_Tow_Gender);
							$("#SUDS_Tow_StudentNumber").html(Map.SUDS_Tow_StudentNumber);
							$("#SUDS_Tow_School").html(Map.SUDS_Tow_School);
							$("#SUDS_Tow_YearOfGraduation").html(Map.SUDS_Tow_YearOfGraduation);
							//教练员信息
							$("#SUP_Coach_Name").html(Map.SUP_map.SUP_Coach_Name);
							$("#SUP_Coach_Gender").html(Map.SUP_map.SUP_Coach_Gender);
							$("#SUP_Coach_Position").html(Map.SUP_map.SUP_Coach_Position);
							$("#SUP_Coach_Unit").html(Map.SUP_map.SUP_School);
							$("#SUP_Coach_Phone").html(Map.SUP_map.SUP_Coach_Phone);
							$("#SUP_Coach_Email").html(Map.SUP_map.SUP_Coach_Email);
					}


					//返回
					$("#FH").click(function() {
						close_layer();
					})
					doPrint();//打印
					

      
				});

			})
		}
		
	</script>

</html>
