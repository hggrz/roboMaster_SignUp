<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>报名信息查看</title>
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
		  <legend class="indexTitle">报名信息查看</legend>
		</fieldset>
		
		<div class="layui-form" action="" style="margin-top: -10px;">
			<div class="layui-form-item">
				<div class="layui-inline">
						<label class="layui-form-label boldFont">查找条件</label>
						<div class="layui-input-inline">
							<select name="modules" id="type" lay-verify="required" lay-search="">
								<option value="1">指导老师</option>
								<option value="2">单位</option>
							</select>
						</div>
					</div>
	
					<div class="layui-inline">
						<div class="layui-input-inline">
							<input type="text" name="value" id="value" lay-verify="value" autocomplete="off" placeholder="" class="layui-input">
						</div>
					</div>
					
					<div class="layui-inline">
						<div id="sel" class="layui-btn layui-btn-normal layui-btn-radius"><i class="layui-icon">&#xe615;</i>查询</div>
					</div>
					
					<div class="layui-inline">
						<div class="search_btn" id="Advanced_Search">
							<div class="layui-btn  layui-btn-radius layui-bg-orange" title="高级搜索">高级搜索</div>
						</div>
					</div>
				</div>
				
				
				<div id="Advanced_Search_Panel">
					<div class="layui-form-item">
						
						<div class="layui-inline">
							<label class="layui-form-label boldFont ">组别</label>
							<div class="layui-input-inline">
								<select id="SUP_Group" name="SUP_Group" lay-filter="SUP_Group" lay-search="">
									<option value="">全部组别</option>
									<option value="小学组">小学组</option>
									<option value="初中组">初中组</option>
									<option value="高中组">高中组</option>
								</select>
							</div>
						</div>
					
						<div class="layui-inline">
							<label class="layui-form-label boldFont">项目</label>
							<div class="layui-input-inline" style="width: 250px;">
								<select name="SUP_Project" id="SUP_Project" lay-filter="SUP_Project" lay-verify="required" lay-search="">
								
								</select>
							</div>
						</div>
						
					</div>
						
				</div>
				
			<table class="layui-table" style="text-align: center;margin-top: -10px;">
					<thead>
						<td>所在区</td>
						<td>单位</td>
						<td>参赛项目</td>
						<td>参赛组别</td>
						<td>参赛队员</td>
						<td>指导老师</td>
						<td>报名状态</td>
						<td width="15%">操作</td>
					</thead>
					<tbody id="data_tb">
						
					</tbody>
			</table>
			
			<!-- 分页 -->
			<div class="page">
				<div id="PageUtil" style="text-align: center;margin-top: -10px;"></div>
			</div>
			
		</div>

	</body>
	
	<script>
		function getParameter() { //获取查询参数
			var map = new Map();
			if($("#value").val()!=""){map.value=$("#value").val();map.type=$("#type").val();}
			map.SUP_Group = not_null_Get_val($('#SUP_Group'));//组别
			map.SUP_Project = not_null_Get_val($('#SUP_Project'));//项目
			return map;
		}

		
		function Color(Key){
			var col_Style = "";
			switch (Key) {
			case "审核中":
				col_Style = "layui-bg-red";
				break;
			case "报名已成功":
				col_Style = "layui-bg-blue";
				break;
			case "报名未成功":
				col_Style = "layui-bg-orange";
				break;
			default:
				col_Style = "layui-bg-gray";
				break;
			}
			return col_Style;
		}
		
		//查询快递查询数据 
		function sel_Map($data){
			//console.log($data);	
		 	$.post("<%=request.getContextPath()%>/Ba/Sign/sel_Map.do",{map:JSON.stringify($data)},success,'json');
				function success(result){
					//console.log(result);
					if(result.data.Data[0]!=null){
						var html='';
						$.each(result.data.Data,function(i,o){
							
							var btn="";
							btn+='<div class="cha layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon" title="查看">&#xe63c;</i></div>';
							if(o.SUP_IsEnter=="审核中" || o.SUP_IsEnter=="报名未成功"){
								btn+='<div class="edit layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon" title="修改">&#xe642;</i></div>';
								btn+='<div class="del layui-btn layui-btn-danger layui-btn-sm"><i class="layui-icon" title="删除">&#xe640;</i></div>';
							}
							 
							 html+='<tr>\
										<td>'+o.SUP_Area+'</td>\
										<td>'+o.SUP_School+'</td>\
										<td>'+o.SUP_Project+'</td>\
										<td>'+o.SUP_Group+'</td>\
										<td>'+Get_value(o.SUDS_Name)+'</td>\
										<td>'+Get_value(o.SUIR_Name)+'</td>\
										<td class="'+Color(o.SUP_IsEnter)+'">'+o.SUP_IsEnter+'</td>\
										<td>\
											<input type="hidden" class="SUP_ID" value="'+o.SUP_ID+'" />\
											<input type="hidden" class="SUDS_SUPID" value="'+o.SUDS_SUPID+'" />\
											<input type="hidden" class="SUIR_SUPID" value="'+o.SUIR_SUPID+'" />\
											'+btn+'\
										</td>\
									</tr>';
						})
						$("#data_tb").html(html);
						var Count=result.data.Pu.rowCount;
		 				var Curr=result.data.Pu.currenPage;
		 				var PageSize=result.data.Pu.pageSize;
		 				initPageUtil(Count,Curr,PageSize,[10, 20, 30, 40, 50, 100, 200],"PageUtil",getParameter,sel_Map);//初始化分页及，分页分页查询
		 				layui.form.render('checkbox');
					}else{
						FriendlyPrompt("未找到数据！");
						$('#data_tb').html("");
					}
				}
		}
		
		
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
					Group_change();	//组别切换 项目加载
					load();//加载
					
					function load(){
						sel_Map(getParameter())
					}
					
					
				/* 	//组别切换
					form.on('select(SUP_Group)', function (data) {
						
						sel_Map(getParameter());
					}); */
					
					
					
					
					//组别切换 项目加载
					function Group_change(SUP_Group){
						SUP_Group = Is_null(SUP_Group)==true?SUP_Group:$("#SUP_Group").val();
						var Map = {};
						Map['小学组'] =['机甲大师青少年挑战赛','智慧交通-青少年机甲大师单项任务挑战赛','无人机搬运挑战赛（app操控）','无人机穿越挑战赛（编程控制）'];
						Map['初中组'] =['机甲大师青少年挑战赛','智慧交通-青少年机甲大师单项任务挑战赛','无人机搬运挑战赛（app操控）','无人机穿越挑战赛（编程控制）'];
						Map['高中组'] =['机甲大师青少年挑战赛','智慧交通-青少年机甲大师单项任务挑战赛','无人机搬运挑战赛（app操控）','无人机穿越挑战赛（编程控制）'];
						//console.log(SUP_Group)
						var html = '';
						if(Is_null(SUP_Group)==true){
							$.each(Map[SUP_Group],function(i,o){
								html += '<option value="'+o+'">'+o+'</option>';
							})
						}
						$('#SUP_Project').html(html);
						layui.form.render('select');
					}
					
					
					
					
					
					//查询界面数据
					$("#sel").click(function() {
						sel_Map(getParameter());
					})
					
					//区域 监听切换
					form.on('select(SUP_Area)', function(data){
						sel_Map(getParameter());
					})
					
					
					//项目 监听切换
					form.on('select(SUP_Project)', function(data){
						sel_Map(getParameter());
					})
					
					//组别 监听切换
					form.on('select(SUP_Group)', function(data){
						Group_change();	//组别切换 项目加载
						sel_Map(getParameter());
					})
					
					
					
					//删除数据
					$(function(){
						layui.use(['layer'], function(){
							
							$(".del").live("click",function(){
								var SUP_ID=$(this).parent().children(".SUP_ID").val();	
								Mlayer_confirm({"SUP_ID":SUP_ID},del_data,"您确认要删除这条数据吗？",2000,["确认","取消"],['220px']);
							})
							
							//删除参赛队伍信息
							function del_data($data){
									//console.log($data)
								  $.post("<%=request.getContextPath()%>/Ba/Sign/del_data.do",{map:JSON.stringify($data)},success,'json');
									function success(result){
											var Message=result.Message==true?"删除成功":"网络异常，请稍后重试！";
											FriendlyPrompt(Message);
											if(result.Message==true){
												sel_Map(getParameter());
											}
									}
							}
							
						})
					})
					
					//查询详情
					$(function(){
						layui.use(['layer'], function(){
							$(".cha").live("click",function(){//查询详情
								var SUP_ID=$(this).parent().children(".SUP_ID").val();	
								OpenView({"SUP_ID":SUP_ID},'<%=request.getContextPath() %>/Registration_Information_View.jsp',"您正在查看报名详细信息");
							})
						})
					})
					
					//编辑数据
					$(function(){
						layui.use(['layer'], function(){
							$(".edit").live("click",function(){
								var SUP_ID=$(this).parent().children(".SUP_ID").val();	
								//console.log(SUP_ID)
								OpenView({"SUP_ID":SUP_ID},'<%=request.getContextPath() %>/Registration_Information_Edit.jsp',"您正在编辑报名信息",sel_Map,null,null,null,getParameter);
							})
						})
					})
					
			})
		})
	</script>
	

</html>