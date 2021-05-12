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
		<meta charset="utf-8">
		<title>报名信息详情</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<link rel="stylesheet" href="<%=request.getContextPath() %>/SignUp_Static/layui/css/layui.css" media="all" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/SignUp_Static/js/jquery-1.4.2.min.js"></script>
		<script src="<%=request.getContextPath() %>/SignUp_Static/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/SignUp_Static/js/Currency.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/SignUp_Static/css/myCss.css" />
		
		
	</head>

	<style>
		.RequiredStyle {
			color: red;
		}
		.Input_Width{
			width: 250px!important;
		}
		.download:hover{
			color: red;
		}
		.Input_Left{
			margin-left: -36px;
		}
	</style>


	<body>
		
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title" style="text-align: center;">
				<li class="layui-this">项目信息</li>
				<li>队员信息</li>
				<li>指导老师</li>
				<!-- <li>参赛队员照片</li> -->
				<!-- <li>打印申报书</li> -->
			</ul>
			<div class="layui-tab-content">
			
				<!-- 项目信息 Strart -->
				<div class="layui-tab-item layui-show">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
						<legend style="text-align: center;color: #03A9F4;">申报项目信息</legend>
					</fieldset>

					<div class="layui-form" lay-filter="example" style="margin-top: -10px;">

						<div class="layui-form-item layui_Input">
							
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 参赛项目</label>
								<div class="layui-input-inline" style="width: 220px;">
									<select name="SUP_Project" id="SUP_Project" lay-filter="SUP_Project" lay-verify="required" >
										<option value="机甲大师青少年挑战赛">机甲大师青少年挑战赛</option>
										<option value="智慧交通-青少年机甲大师单项任务挑战赛">智慧交通-青少年机甲大师单项任务挑战赛</option>
										<option value="无人机搬运挑战赛（app操控）">无人机搬运挑战赛（app操控）</option>
										<option value="无人机穿越挑战赛（编程控制）">无人机穿越挑战赛（编程控制）</option>
									</select>
								</div>
							</div>
							
							
							<div class="layui-inline"> 
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 参赛组别</label>
								<div class="layui-input-inline" style="width: 220px;">
									<select name="SUP_Group" id="SUP_Group" lay-filter="SUP_Group" lay-verify="required" lay-search="">
										<option value="小学组">小学组</option>
										<option value="初中组">初中组</option>
										<option value="高中组">高中组</option>
									</select>  
								</div>
							</div>
							
							
						</div>

						<div class="layui-form-item layui_Input">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 单位</label>
								<div class="layui-input-inline" style="width: 565px;">
									<input type="text" name="SUP_School" id="SUP_School" lay-verify="title" autocomplete="off" placeholder=""
									 class="layui-input">
								</div>
							</div>
						</div>

						<div class="layui-form-item layui_Input">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 所在省市</label>
								<div class="layui-input-inline" style="width: 220px;">
									<select id="SUP_Area" name="SUP_Area" lay-search="" />
										<option value="北京">北京</option>
										<option value="上海">上海</option>
										<option value="天津">天津</option>
										<option value="重庆">重庆</option>
										<option value="广西">广西</option>
										<option value="内蒙">内蒙</option>
										<option value="河北省">河北省</option>
										<option value="山西省">山西省</option>
										<option value="辽宁省">辽宁省</option>
										<option value="吉林省">吉林省</option>
										<option value="黑龙江省">黑龙江省</option>
										<option value="江苏省">江苏省</option>
										<option value="浙江省">浙江省</option>
										<option value="安徽省">安徽省</option>
										<option value="福建省">福建省</option>
										<option value="江西省">江西省</option>
										<option value="山东省">山东省</option>
										<option value="河南省">河南省</option>
										<option value="湖北省">湖北省</option>
										<option value="湖南省">湖南省</option>
										<option value="广东省">广东省</option>
										<option value="海南省">海南省</option>
										<option value="四川省">四川省</option>
										<option value="贵州省">贵州省</option>
										<option value="云南省">云南省</option>
										<option value="陕西省">陕西省</option>
										<option value="甘肃省">甘肃省</option>
										<option value="青海省">青海省</option>
										<option value="台湾省">台湾省</option>
										<option value="宁夏">宁夏</option>
										<option value="新疆">新疆</option>
										<option value="西藏">西藏</option>
										<option value="香港">香港</option>
										<option value="澳门">澳门</option>
									</select>
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 联系人</label>
								<div class="layui-input-inline" style="width: 220px;">
									<input type="text" name="SUP_Contact" id="SUP_Contact" lay-verify="title" autocomplete="off" placeholder="" class="layui-input">
								</div>
							</div>
						</div>

						<div class="layui-form-item layui_Input">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 联系电话</label>
								<div class="layui-input-inline" style="width: 220px;">
									<input type="text" name="SUP_Contact_Phone" id="SUP_Contact_Phone" lay-verify="title" autocomplete="off" placeholder="" class="layui-input">
								</div>
							</div>
							
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 邮箱</label>
								<div class="layui-input-inline" style="width: 220px;">
									<input type="text" name="SUP_Contact_Email" id="SUP_Contact_Email" lay-verify="title" autocomplete="off" placeholder="" class="layui-input">
								</div>
							</div>
						</div>

						<div class="layui-form-item layui_Input">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 邮寄地址</label>
								<div class="layui-input-inline" style="width: 565px;">
									<input type="text" name="SUP_Address" id="SUP_Address" lay-verify="title" autocomplete="off" placeholder=""
									 class="layui-input">
								</div>
							</div>
						</div>
						
						<div class="layui-form-item anNiuStyle">
							<input type="hidden" id="SUP_Fill_In_Person_ID" name="SUP_Fill_In_Person_ID" />
							<input type="hidden" id="SUP_admin" value="${admin.RUR_ID}"/>
							<input type="hidden" id="SUP_Registration_Number" name="SUP_Registration_Number" />
							<input type="hidden" id="SUP_ID" name="SUP_ID" />
						</div>

					</div>
					
				</div>
				<!-- 项目信息 End -->

				<!-- 项目队员信息 Start -->
				<div class="layui-tab-item">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: -7px;">
						<legend style="text-align: center;color: #03A9F4;">项目队员信息</legend>
					</fieldset>
					
					<div class="layui-form"  style="margin-top: -10px;">
						<table class="layui-table Details_Reply" style="text-align:center;margin-top: -15px;">
							<thead>
								<td><i class="RequiredStyle">* </i>姓名</td>
								<td><i class="RequiredStyle">* </i>性别</td>
								<td><i class="RequiredStyle">* </i>学校</td>
								<td><i class="RequiredStyle">* </i>年级</td>
								<td>学籍号/身份证</td>
							</thead>
							<tbody id="data_tr">
							
							</tbody>
						</table>
					</div>
				</div>
				<!-- 项目队员信息 End -->

				<!-- 指导老师 Start -->
				<div class="layui-tab-item">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: -7px;">
						<legend style="text-align: center;color: #03A9F4;">指导老师信息</legend>
					</fieldset>
					
					<div class="layui-form"  style="margin-top: -10px;">
						<table class="layui-table Details_Reply" style="text-align:center;margin-top: -15px;">
							<thead>
								<td><i class="RequiredStyle">* </i>姓名</td>
								<td><i class="RequiredStyle">* </i>性别</td>
								<td>E-mail</td>
								<td><i class="RequiredStyle">* </i>手机</td>
								<td>职务或职称</td>
							</thead>
							<tbody id="data_SUIR">
							
							</tbody>
						</table>
					</div>
				</div>
				<!-- 指导老师 End -->
				
			</div>
			
		</div>

	</body>

	<script>
		
		function child(map) {
			console.log(map)
			$(function(){
				$.ajaxSetup({async:false});
				layui.use(['laypage', 'laydate', 'layer', 'form', 'util', 'table', 'element', 'flow', 'jquery'], function() {
					
					var laydate = layui.laydate;
					var flow = layui.flow;
					var util = layui.util;
					var laypage = layui.laypage;
					var form = layui.form;
					var layer = layui.layer;
					var jquery = layui.jquery;
					var table = layui.table;
					var element = layui.element;
		
					//Layui_edit(); //开启表格layui编辑
					
					
					load();//默认加载
					
					//默认加载
					function load(){
						find_data(map);//加载信息
					}
					
					
					
					//查询详情
					function find_data($data){
						$.post("<%=request.getContextPath()%>/Ba/Sign/find_data.do",{map:JSON.stringify($data)},success,"json");
						function success(result){
							var SUP_map = result.data.SUP_map;
							SelectedDrop_DownBox($('#SUP_Group'),SUP_map.SUP_Group);
							SelectedDrop_DownBox($('#SUP_Project'),SUP_map.SUP_Project);
							
							
							compose(SUP_map);//赋值表单
							
							var html='';
							$.each(result.data.SUDS_arr, function(i,o) {
								html+='<tr>\
										<td class="My_edit SUDS_Name">'+o.SUDS_Name+'</td>\
										<td class="SUDS_Gender">'+Get_value(o.SUDS_Gender)+'</td>\
										<td class="SUDS_School">'+Get_value(o.SUDS_School)+'</td>\
										<td class="SUDS_Grade">'+Get_value(o.SUDS_Grade)+'</td>\
										<td class="My_edit SUDS_StudentNumber">'+Get_value(o.SUDS_StudentNumber)+'</td>\
									</tr>';
								$("#data_tr").html(html);
							})
							
							
							var html='';
							$.each(result.data.SUIR_arr, function(i,o) {
								html+='<tr>\
										<td class="My_edit SUIR_Name">'+o.SUIR_Name+'</td>\
										<td class="SUIR_Gender">'+Get_value(o.SUIR_Gender)+'</td>\
										<td class="My_edit SUIR_Email">'+Get_value(o.SUIR_Email)+'</td>\
										<td class="My_edit SUIR_Phone">'+Get_value(o.SUIR_Phone)+'</td>\
										<td class="My_edit SUIR_Position">'+Get_value(o.SUIR_Position)+'</td>\
									</tr>';
								$("#data_SUIR").html(html);
							})
						}
					}
					
					
					
					
				});
			})
		}
	</script>

</html>
