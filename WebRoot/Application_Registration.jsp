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
		<title>报名申请</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/SignUp_Static/layui/css/layui.css" media="all" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/SignUp_Static/js/jquery-1.4.2.min.js"></script>
		<script src="<%=request.getContextPath() %>/SignUp_Static/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/SignUp_Static/js/Currency.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/SignUp_Static/css/myCss.css" />
		<style type="text/css">
			.red{
				color: red;
			}
		</style>


		<!-- layui 步骤条样式 -->
		<link rel="stylesheet" href="SignUp_Static/layui/extend/steps/style.css">

		<link rel="stylesheet" href="SignUp_Static/layui/extend/steps/style.css">

		<script type="text/javascript" src="SignUp_Static/layui/config.js"></script>

	</head>

	<style>
		.RequiredStyle {
			color: red;
		}
		.Input_Width{
			width: 250px!important;
		}
		.layui-bg-blue {
			background-color: #5FB878 !important;
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
			</ul>
			
			<div class="layui-tab-content">

				<!-- 项目信息 Strart -->
				<div class="layui-tab-item layui-show">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: -7px;">
						<legend style="text-align: center;color: #03A9F4;">申报项目信息</legend>
					</fieldset>

					<div class="layui-form" lay-filter="example" style="margin-top: -10px;">

						<div class="layui-form-item layui_Input Input_Left">

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
									<select name="modules" id="SUP_Group" lay-filter="SUP_Group" lay-verify="required" lay-search="">
										<!-- <option value="小学组">小学组</option>
										<option value="初中组">初中组</option>
										<option value="高中组">高中组</option>
										<option value="大学组">大学组</option> -->
									</select>  
								</div>
							</div>
							
						</div>

						<div class="layui-form-item layui_Input Input_Left">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 单位</label>
								<div class="layui-input-inline SUP_School" style="width: 565px;">
									<input type="text" name="" id="SUP_School" lay-verify="title" autocomplete="off" placeholder=""
									 class="layui-input">
								</div>
							</div>
						</div>

						<div class="layui-form-item layui_Input Input_Left">
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
									<input type="text" name="" id="SUP_Contact" maxlength="10" class="layui-input">
								</div>
							</div>
						</div>

						<div class="layui-form-item layui_Input Input_Left">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 联系电话</label>
								<div class="layui-input-inline" style="width: 220px;">
									<input type="text" name="" id="SUP_Contact_Phone" maxlength="15" class="layui-input">
								</div>
							</div>
							
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 邮箱</label>
								<div class="layui-input-inline" style="width: 220px;">
									<input type="text" name="" id="SUP_Contact_Email"  class="layui-input">
								</div>
							</div>
						</div>

						<div class="layui-form-item layui_Input Input_Left">
							<div class="layui-inline">
								<label class="layui-form-label "><i class="RequiredStyle">*</i> 邮寄地址</label>
								<div class="layui-input-inline" style="width: 565px;">
									<input type="text" name="" id="SUP_Address" lay-verify="title" autocomplete="off" placeholder=""
									 class="layui-input">
								</div>
							</div>
						</div>
						

						<blockquote class="layui-elem-quote layui-text" style="margin-top: 15px;">
									<lable style="">填写完【项目信息】后请点击上方【队员信息】继续填写报名信息</label>
						</blockquote>

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
								<td width="3%">操作</td>
							</thead>
							<tbody id="data_tr">
							
							</tbody>
						</table>
					</div>
					
					
					<blockquote class="layui-elem-quote layui-text" style="margin-top: 15px;">
								<lable style="">填写完【队员信息】后请点击上方【指导老师】继续填写报名信息</label>
					</blockquote>
				</div>
				<!-- 项目队员信息 End -->

				<!-- 指导老师 Start -->
				<%-- <div class="layui-tab-item">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: -7px;">
						<legend style="text-align: center;color: #03A9F4;">指导老师一</legend>
					</fieldset>

					<div class="layui-field-box">

						<div class="layui-form" lay-filter="example" style="margin-top: -20px;">

							<div class="layui-form-item layui_Input Input_Left">
								<div class="layui-inline">
									<label class="layui-form-label "><i class="RequiredStyle">*</i> 姓名</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_Name" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label "><i class="RequiredStyle">*</i> 性别</label>
									<div class="layui-input-inline Input_Width">
										<select id="SUP_Coach_Gender" name="SUP_Coach_Gender" lay-search="" />
										<option value="男">男</option>
										<option value="女">女</option>
										</select>
									</div>
								</div>
							</div>

							<div class="layui-form-item layui_Input Input_Left">
								<div class="layui-inline">
									<label class="layui-form-label "><i class="RequiredStyle">*</i> E-mail</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_Email" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>
								
								<div class="layui-inline">
									<label class="layui-form-label "><i class="RequiredStyle">*</i> 手机</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_Phone" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>
							</div>
							
							<div class="layui-form-item layui_Input Input_Left">
								<div class="layui-inline">
									<label class="layui-form-label ">职务或职称</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_Position" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>
							</div>

						</div>

					</div>
					
					
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: -7px;">
						<legend style="text-align: center;color: #03A9F4;">指导老师二</legend>
					</fieldset>

					<div class="layui-field-box">

						<div class="layui-form" lay-filter="example" style="margin-top: -20px;">

							<div class="layui-form-item layui_Input Input_Left">
								<div class="layui-inline">
									<label class="layui-form-label "> 姓名</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_NameTwo" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label ">性别</label>
									<div class="layui-input-inline Input_Width">
										<select id="SUP_Coach_GenderTwo" name="SUP_Coach_GenderTwo" lay-search="" />
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
									</div>
								</div>
							</div>

							<div class="layui-form-item layui_Input Input_Left">
								<div class="layui-inline">
									<label class="layui-form-label ">E-mail</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_EmailTwo" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>
								
								<div class="layui-inline">
									<label class="layui-form-label ">手机</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_PhoneTwo" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>
							</div>
							
							<div class="layui-form-item layui_Input Input_Left">
								<div class="layui-inline">
									<label class="layui-form-label ">职务或职称</label>
									<div class="layui-input-inline Input_Width">
										<input type="text" name="" id="SUP_Coach_PositionTwo" lay-verify="title" autocomplete="off" placeholder=""
										 class="layui-input">
									</div>
								</div>
							</div>

						</div>

					</div><!-- 指导老师二 -->
					
					<div class="layui-form-item anNiuStyle">
						<!-- <div id="sub" class="layui-btn layui-btn-normal layui-btn-radius">保存</div> -->
						<button class="layui-btn layui-bg-blue" id="sub" style="margin-left: 55px; margin-top: 5px; width: 205px;height: 36px; border-radius: 12px;">提交报名信息</button>
						<input type="hidden" id="SUP_Fill_In_Person_ID" name="SUP_Fill_In_Person_ID" />
						<input type="hidden" id="SUP_admin" value="${admin.RUR_ID}"/>
						<!-- <input type="hidden" id="SUP_Registration_Number" name="SUP_Registration_Number" /> -->
					</div>
							
					<blockquote class="layui-elem-quote layui-text" style="margin-top: 15px;">
						<lable style=""><font color="red">填写完【指导老师】提交成功之后 ，系统将跳转至 【报名信息查看】。</font> </label>
					</blockquote>
				</div> --%>
				
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
								<td width="3%">操作</td>
							</thead>
							<tbody id="data_SUIR">
							
							</tbody>
						</table>
					</div>
					
					<div class="layui-form-item anNiuStyle">
						<!-- <div id="sub" class="layui-btn layui-btn-normal layui-btn-radius">保存</div> -->
						<button class="layui-btn layui-bg-blue" id="sub" style="margin-left: 55px; margin-top: 5px; width: 205px;height: 36px; border-radius: 12px;">提交报名信息</button>
						<input type="hidden" id="SUP_Fill_In_Person_ID" name="SUP_Fill_In_Person_ID" />
						<input type="hidden" id="SUP_admin" value="${admin.RUR_ID}"/>
						<!-- <input type="hidden" id="SUP_Registration_Number" name="SUP_Registration_Number" /> -->
					</div>
					
					<blockquote class="layui-elem-quote layui-text" style="margin-top: 15px;">
						<lable style=""><font color="red">填写完【指导老师】提交成功之后 ，系统将跳转至 【报名信息查看】。</font> </label>
					</blockquote>
				</div>
				<!-- 指导老师 End -->

			</div>
			
		</div>

	</body>

	<script>
		$('#Three_Span').hide();
		$('#Four_Span').hide();
		$('#Fives_Span').hide();
	
		$(function(){
			
			layui.use(['laypage', 'laydate', 'layer', 'form', 'util', 'table', 'element', 'flow', 'jquery'], function() {
				$.ajaxSetup({async:false});
				var laydate = layui.laydate;
				var flow = layui.flow;
				var util = layui.util;
				var laypage = layui.laypage;
				var form = layui.form;
				var layer = layui.layer;
				var jquery = layui.jquery;
				var table = layui.table;
				var element = layui.element;
				
				Layui_edit(); //开启表格layui编辑
	
				//触发事件
				var active = {
					tabAdd: function() {
						//新增一个Tab项
						element.tabAdd('demo', {
							title: '新选项' + (Math.random() * 1000 | 0) //用于演示
								,
							content: '内容' + (Math.random() * 1000 | 0),
							id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
						})
					},
					tabDelete: function(othis) {
						//删除指定Tab项
						element.tabDelete('demo', '44'); //删除：“商品管理”
	
	
						othis.addClass('layui-btn-disabled');
					},
					tabChange: function() {
						//切换到指定Tab项
						element.tabChange('demo', '22'); //切换到：用户管理
					}
				};
				
				
				load();//默认加载
				
				//默认加载
				function load(){
					
					Group_change();	//组别切换 项目加载
					Group_grade();//组别切换 年级加载
					load_SUDS();//加载面板
					load_SUIR();//加载指导老师信息面板
				}
				
				
				//项目切换
				form.on('select(SUP_Project)', function (data) {
					
					Group_change();	//项目切换  组别加载
					Group_grade();//组别切换 年级加载
					
				});
				
				
				//组别切换
				form.on('select(SUP_Group)', function (data) {
					
					Group_grade();//组别切换 年级加载
					
				});
				
				
				
				//项目切换  组别加载
				function Group_change(){
					var Map = {};
					/* Map['小学组'] =['智慧交通','变形战士','超变战场'];
					Map['初中组'] =['虚拟现实','智慧交通','变形战士','超变战场'];
					Map['高中组'] =['虚拟现实','智慧交通','变形战士'];
					Map['大学组'] =['虚拟现实','智慧交通']; */
					
					Map['机甲大师青少年挑战赛'] =['小学组','初中组','高中组'];
					Map['智慧交通-青少年机甲大师单项任务挑战赛'] =['小学组','初中组','高中组'];
					Map['无人机搬运挑战赛（app操控）'] =['小学组','初中组','高中组'];
					Map['无人机穿越挑战赛（编程控制）'] =['小学组','初中组','高中组'];
					
					var html = '';
					$.each(Map[$("#SUP_Project").val()],function(i,o){
						html += '<option value="'+o+'">'+o+'</option>';
					})
					$('#SUP_Group').html(html);
					layui.form.render('select');
				}
				
				
				//组别切换 年级加载
				function Group_grade(){
					var Map = {};
					Map['小学组'] =['一年级','二年级','三年级','四年级','五年级'];
					Map['初中组'] =['预备班','初一','初二','初三'];
					Map['高中组'] =['高一','高二','高三'];
					
					var html = '';
					$.each(Map[$("#SUP_Group").val()],function(i,o){
						html += '<option value="'+o+'">'+o+'</option>';
					})
					$('#SUDS_Grade').html(html);
					layui.form.render('select');
				}
				
				
				//加载面板
				function load_SUDS(){
					var html='';
					html+='<tr class="add_span">\
							<td id="SUDS_Name" class="My_edit SUDS_Name"></td>\
							<td style="width:100px;">\
								<select name="SUDS_Gender" id="SUDS_Gender" lay-verify="required" lay-search="">\
									<option value="男">男</option>\
									<option value="女">女</option>\
								</select>\
							</td>\
							<td id="SUDS_School" class="My_edit SUDS_School"></td>\
							<td style="width:100px;">\
								<select id="SUDS_Grade" name="SUDS_Grade" lay-filter="SUDS_Grade" lay-search="">\
								</select>\
							</td>\
							<td id="SUDS_StudentNumber" class="My_edit SUDS_StudentNumber"></td>\
							<td>\
								<div id="add_SUDS" class="layui-btn layui-btn-warm layui-btn-sm"><i class="layui-icon">&#xe654;</i></div>\
							</td>\
						</tr>';
					$("#data_tr").append(html);
					layui.form.render('select');//渲染下拉框
					Group_grade();//组别切换 年级加载
				}
				
				//添加面板信息
				$("#add_SUDS").live('click',function(){
					if(VerificationHtml($("#SUDS_Name"),"姓名不能为空哦！")==true &&
							Verificationval($("#SUDS_Gender"),"性别不能为空哦！")==true &&
							Verificationval($("#SUDS_Grade"),"年级不能为空哦！")==true &&
							VerificationHtml($("#SUDS_School"),"学校不能为空哦！")==true){
						
						
						var SUDS_Name = $("#SUDS_Name").html();// 姓名
						var SUDS_Gender = Get_value($('#SUDS_Gender').val());// 性别
						var SUDS_School = $("#SUDS_School").html();// 学校
						var SUDS_Grade = Get_value($('#SUDS_Grade').val());// 年级
						var SUDS_StudentNumber = $('#SUDS_StudentNumber').html();// 学籍副号
						
						$('.add_span').remove();//删除面板
						
						var html='<tr >\
								<td class="SUDS_Name My_edit">'+SUDS_Name+'</td>\
								<td class="SUDS_Gender">'+SUDS_Gender+'</td>\
								<td class="SUDS_School My_edit">'+SUDS_School+'</td>\
								<td class="SUDS_Grade">'+SUDS_Grade+'</td>\
								<td class="SUDS_StudentNumber My_edit">'+SUDS_StudentNumber+'</td>\
								<td>\
									<div class="layui-btn layui-bg-red layui-btn-sm del_span"><i class="layui-icon">&#xe640;</i></div>\
								</td>\
								</tr>';
						$("#data_tr").append(html);
						load_SUDS();//加载添加面板
						Group_grade();//组别切换 年级加载
					}
				})
				
				
					
				//面板删除
				$(".del_span").live("click",function(){
					$(this).parent().parent().remove();
				})
				
				
				//性别更改
				$('.SUDS_Gender').live('click',function(){
					
					var _this = $(this);
					var SUDS_Gender = _this.parent().children(".SUDS_Gender").html()=='男'?'女':'男';
					
					_this.parent().children(".SUDS_Gender").html(SUDS_Gender);
				
				})
				
				
				
				//加载指导老师面板
				function load_SUIR(){
					var html='';
					html+='<tr class="add_SUIR_span">\
							<td id="SUIR_Name" class="My_edit SUIR_Name"></td>\
							<td style="width:100px;">\
								<select name="SUIR_Gender" id="SUIR_Gender" lay-verify="required" lay-search="">\
									<option value="男">男</option>\
									<option value="女">女</option>\
								</select>\
							</td>\
							<td id="SUIR_Email" class="My_edit SUIR_Email"></td>\
							<td id="SUIR_Phone" class="My_edit SUIR_Phone"></td>\
							<td id="SUIR_Position" class="My_edit SUIR_Position"></td>\
							<td>\
								<div id="add_SUIR" class="layui-btn layui-btn-warm layui-btn-sm"><i class="layui-icon">&#xe654;</i></div>\
							</td>\
						</tr>';
					$("#data_SUIR").append(html);
					layui.form.render('select');//渲染下拉框
				}
				
				
				//添加面板信息
				$("#add_SUIR").live('click',function(){
					if(VerificationHtml($("#SUIR_Name"),"姓名不能为空哦！")==true &&
							Verificationval($("#SUIR_Gender"),"性别不能为空哦！")==true &&
							VerificationHtml($("#SUIR_Phone"),"手机号不能为空哦！")==true){
						
						
						var SUIR_Name = $("#SUIR_Name").html();// 姓名
						var SUIR_Gender = Get_value($('#SUIR_Gender').val());// 性别
						var SUIR_Email = $("#SUIR_Email").html();// E-mail
						var SUIR_Phone = $('#SUIR_Phone').html();// 手机
						var SUIR_Position = $('#SUIR_Position').html();// 职务或职称
						
						$('.add_SUIR_span').remove();//删除面板
						
						var html='<tr >\
								<td class="SUIR_Name My_edit">'+SUIR_Name+'</td>\
								<td class="SUIR_Gender">'+SUIR_Gender+'</td>\
								<td class="SUIR_Email My_edit">'+SUIR_Email+'</td>\
								<td class="SUIR_Phone My_edit">'+SUIR_Phone+'</td>\
								<td class="SUIR_Position My_edit">'+SUIR_Position+'</td>\
								<td>\
									<div class="layui-btn layui-bg-red layui-btn-sm del_SUIR_span"><i class="layui-icon">&#xe640;</i></div>\
								</td>\
								</tr>';
						$("#data_SUIR").append(html);
						load_SUIR();//加载添加面板
					}
				})
				
				
					
				//面板删除
				$(".del_SUIR_span").live("click",function(){
					$(this).parent().parent().remove();
				})
				
				
	
	
				//获取参数
				function getParameter(){
					var map = {};
					
					var SUP_map = {}; //报名 map
					var SUDS_arr = []; //报名详情 list
					var SUIR_arr = []; //指导老师 list
					
					//区域 map
					var Area_map = {};
						Area_map['河北省'] = 'HB';
						Area_map['山西省'] = 'SX';
						Area_map['辽宁省'] = 'LN';
						Area_map['吉林省'] = 'JL';
						Area_map['黑龙江省 '] = 'HLJ';
						Area_map['江苏省'] = 'JS';
						Area_map['浙江省'] = 'ZJ';
						Area_map['安徽省'] = 'AH';
						Area_map['福建省'] = 'FJ';
						Area_map['江西省'] = 'JX';
						Area_map['山东省'] = 'SD';
						Area_map['河南省'] = 'HN';
						Area_map['湖北省'] = 'HB';
						Area_map['湖南省'] = 'HN';
						Area_map['广东省'] = 'GD';
						Area_map['海南省'] = 'HN';
						Area_map['四川省'] = 'SC';
						Area_map['贵州省'] = 'GZ';
						Area_map['云南省'] = 'YN';
						Area_map['陕西省'] = 'SX';
						Area_map['甘肃省'] = 'GS';
						Area_map['青海省'] = 'QH';
						Area_map['台湾省'] = 'TW';
						Area_map['北京'] = 'BJ';
						Area_map['天津'] = 'TJ';
						Area_map['上海'] = 'SH';
						Area_map['重庆'] = 'CQ';
						Area_map['内蒙'] = 'NM';
						Area_map['广西'] = 'GX';
						Area_map['宁夏'] = 'NX';
						Area_map['新疆'] = 'XJ';
						Area_map['西藏'] = 'XZ';
						Area_map['香港'] = 'XG';
						Area_map['澳门'] = 'AM';
					//项目 map
					var Project_map = {};
						Project_map['机甲大师青少年挑战赛'] = 'J';
						Project_map['智慧交通-青少年机甲大师单项任务挑战赛'] = 'Z';
						Project_map['无人机搬运挑战赛（app操控）'] = 'A';
						Project_map['无人机穿越挑战赛（编程控制）'] = 'B';
					//组别 map
					var Group_map = {};
						Group_map['小学组'] = 'A';
						Group_map['初中组'] = 'B';
						Group_map['高中组'] = 'C';
						
					SUP_map.SUP_Registration_Number = Area_map[$("#SUP_Area").val()]+'_'+Project_map[$('#SUP_Project').val()]+'_'
					+Group_map[$('#SUP_Group').val()]+"_";
					
					
					//项目信息
					SUP_map.SUP_Project = not_null_Get_val($('#SUP_Project')); // 参赛项目
					SUP_map.SUP_Group = not_null_Get_val($('#SUP_Group')); // 参赛组别
					SUP_map.SUP_School = not_null_Get_val($('#SUP_School')); // 单位
					SUP_map.SUP_Area = not_null_Get_val($('#SUP_Area')); //  所在省市
					SUP_map.SUP_Contact = not_null_Get_val($('#SUP_Contact')); // 联系人
					SUP_map.SUP_Contact_Phone = not_null_Get_val($('#SUP_Contact_Phone')); // 联系电话
					SUP_map.SUP_Contact_Email = not_null_Get_val($('#SUP_Contact_Email')); // 邮箱
					SUP_map.SUP_Address = not_null_Get_val($('#SUP_Address')); // 邮寄地址
	
					//指导老师一
					/* SUP_map.SUP_Coach_Name = not_null_Get_val($('#SUP_Coach_Name')); // 指导老师姓名
					SUP_map.SUP_Coach_Gender = not_null_Get_val($('#SUP_Coach_Gender')); // 指导老师性别
					SUP_map.SUP_Coach_Position = not_null_Get_val($('#SUP_Coach_Position')); // 指导老师职务或职称
					SUP_map.SUP_Coach_Email = not_null_Get_val($('#SUP_Coach_Email')); // 指导老师E_mail
					SUP_map.SUP_Coach_Phone = not_null_Get_val($('#SUP_Coach_Phone')); //  指导老师手机 */
					
					//指导老师二
					/* SUP_map.SUP_Coach_NameTwo = not_null_Get_val($('#SUP_Coach_NameTwo')); // 指导老师姓名
					SUP_map.SUP_Coach_GenderTwo = not_null_Get_val($('#SUP_Coach_GenderTwo')); // 指导老师性别
					SUP_map.SUP_Coach_PositionTwo = not_null_Get_val($('#SUP_Coach_PositionTwo')); // 指导老师职务或职称
					SUP_map.SUP_Coach_EmailTwo = not_null_Get_val($('#SUP_Coach_EmailTwo')); // 指导老师E_mail
					SUP_map.SUP_Coach_PhoneTwo = not_null_Get_val($('#SUP_Coach_PhoneTwo')); //  指导老师手机 */
					
					SUP_map.SUP_Fill_In_Person_ID = not_null_Get_val($('#SUP_admin')); // 填写人ID
					
					
					//队员信息
					$('#data_tr tr').not("tr:last").each(function(i){
						var Per_Map = {};
						var _this = $(this);
						
						Per_Map.SUDS_Name  = not_null_Get_html(_this.children(".SUDS_Name"));//姓名
						Per_Map.SUDS_Gender  = not_null_Get_html(_this.children(".SUDS_Gender"));//性别
						Per_Map.SUDS_School  = not_null_Get_html(_this.children(".SUDS_School"));//学校
						Per_Map.SUDS_Grade  = not_null_Get_html(_this.children(".SUDS_Grade"));//年级	
						Per_Map.SUDS_StudentNumber  = not_null_Get_html(_this.children(".SUDS_StudentNumber"));//学籍号/身份证	
						
						
						SUDS_arr.push(Per_Map);
					});
					
					
					//指导老师信息
					$('#data_SUIR tr').not("tr:last").each(function(i){
						var Per_Map = {};
						var _this = $(this);
						
						Per_Map.SUIR_Name  = not_null_Get_html(_this.children(".SUIR_Name"));//姓名
						Per_Map.SUIR_Gender  = not_null_Get_html(_this.children(".SUIR_Gender"));//性别
						Per_Map.SUIR_Email  = not_null_Get_html(_this.children(".SUIR_Email"));//E-mail
						Per_Map.SUIR_Phone  = not_null_Get_html(_this.children(".SUIR_Phone"));//手机
						Per_Map.SUIR_Position  = not_null_Get_html(_this.children(".SUIR_Position"));//职务或职称
						
						
						SUIR_arr.push(Per_Map);
					});
	
	
					map.SUP_map = SUP_map;
					map.SUDS_arr = SUDS_arr;
					map.SUIR_arr = SUIR_arr;
					return map;
				}
	
				//保存参数
				$("#sub").click(function() {
					console.log(getParameter())
					if(Verificationval($("#SUP_School"),"您还未填写单位哦！【项目信息】")==true &&
					   Verificationval($("#SUP_Contact"),"您还未填写 联系人哦！【项目信息】")==true &&
					   Verificationval($("#SUP_Contact_Phone"),"您还未填写联系电话哦！【项目信息】")==true	&&
					   Verificationval($("#SUP_Contact_Email"),"您还未填写联系邮箱哦！【项目信息】")==true	&&
					   Verificationval($("#SUP_Address"),"您还未填写邮寄地址哦！【项目信息】")==true &&
					   VerificationHtml($(".SUIR_Name"),"您还未填写指导老师姓名哦！【指导老师】")==true &&
					   VerificationHtml($(".SUIR_Phone"),"您还未填写指导老师手机号哦！【指导老师】")==true &&
					   VerificationHtml($(".SUIR_Gender"),"您还未填写指导老师性别哦！【指导老师】")==true &&
					   VerificationHtml($(".SUDS_Name"),"您还未填写队员姓名哦！【队员信息】")==true &&
					   VerificationHtml($(".SUDS_School"),"您还未填写队员学校哦！【队员信息】")==true &&
					   VerificationHtml($(".SUDS_Grade"),"您还未填写队员年级哦！【队员信息】")==true){ 
						Loding();
						add_SUP(getParameter());
					   }
				});
				
				
				//新增
				function add_SUP($data){
					console.log($data)
					$.post("<%=request.getContextPath()%>/Ba/Sign/add_SUP.do",{map:JSON.stringify($data)},success,'json');
					function success(result){
						var Message=result.Message==true?"报名成功     正在为你跳转页面":"网络异常，请稍后重试！";
						FriendlyPrompt(Message);
						if(result.Message==true){
							setTimeout(function(){
								window.location.href = 'Registration_Information.jsp';//报名成功后跳转至白报名信息查看页面
							 },2000);
						}
					}
				}
				
	
			});
		})
	</script>

</html>
