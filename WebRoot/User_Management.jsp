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
		<title>用户管理</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/static/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/HistoricalOrder.css" media="all">
		<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/jquery-1.4.2.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/Currency.js"></script>
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
	</head>

	<body style="width: 90%;margin-left: 5%;">
		<div class="layui-form-item">
			<div class="layui-block " style="margin-left:10% ;margin-top: 5%;">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline" style="width: 130px;">
					<input type="text" name="" id="ID" autocomplete="off" class="layui-input" placeholder="用户账号查询">
				</div>
				<label class="layui-form-label">用户姓名</label>
				<div class="layui-input-inline" style="width: 130px;">
					<input type="text" name="" id="USER_NAME" autocomplete="off" class="layui-input" placeholder="用户名查询">
				</div>
				<label class="layui-form-label" style="width: 85px;">公司名称</label>
				<div class="layui-input-inline" style="width: 130px;">
					<input type="text" name="" id="COMPANY_NAME" autocomplete="off" class="layui-input" placeholder="公司名称">
				</div>
				<div class="layui-input-inline" style="width: 130px;">
					<button class="layui-btn  layui-bg-red" title="搜索" id="btn">
						<i class="layui-icon">&#xe615;</i>
					</button>
				</div>
				<div class="layui-inline " style="margin-left:0% ;">
					<div class="search_btn" id="Advanced_Search">
						<button class="layui-btn  layui-bg-orange" title="高级搜索">高级搜索</button>
					</div>
				</div>
			</div>

		</div>

		<div id="Advanced_Search_Panel">
			<div class="layui-form-item">
				<div class="layui-form-item" style="margin-left: 1%;">
					<div class="layui-inline ">
						<label class="layui-form-label">注册时间段</label>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" id="monthOption" placeholder=" - ">

						</div>
					</div>
					<label class="layui-form-label">职务</label>
					<div class="layui-input-inline" style="width: 130px;">
						<input type="text" name="" id="POSITION"  autocomplete="off" class="layui-input" placeholder="职务">
					</div>
					<label class="layui-form-label">部门</label>
					<div class="layui-input-inline" style="width: 130px;">
						<input type="text" name="" id="DEPARTMENT"autocomplete="off" class="layui-input" placeholder="部门">
					</div>
				</div>
				<div class="layui-form-item" style="margin-left: 1%;">
					<label class="layui-form-label" style="width: 80px;">联系地址</label>
					<div class="layui-input-inline" style="width: 380px;">
						<input type="text" name="" id="CONTACT_ADDRESS" style="width: 380px;" autocomplete="off" class="layui-input" placeholder="联系地址">
					</div>
					<label class="layui-form-label" style="width: 100px;">邮政编码</label>
					<div class="layui-input-inline" style="width: 130px;">
						<input type="text" name="" id="ZIP_CODE" maxlength="11" autocomplete="off" class="layui-input" placeholder="邮政编码">
					</div>
					<label class="layui-form-label" style="width: 100px;">公司网址</label>
					<div class="layui-input-inline" style="width: 130px;">
						<input type="text" name="" id="COMPANY_WEBSITE" autocomplete="off" class="layui-input" placeholder="公司网址">
					</div>
				</div>
			</div>
		</div>
		<table class="layui-table" id="table">
			
		</table>
		<div id="PageUtil"></div>
	</body>
	<script>
		layui.use(['laydate', 'layer', 'form', 'util', 'table', 'element', 'flow'], function() {
				var laydate = layui.laydate;
				var flow = layui.flow;
				var util = layui.util;
				var laypage = layui.laypage;
				var form = layui.form;
				//固定块
				util.fixbar({
					css: {
						right: 10,
						bottom: 50
					},
					bgcolor: '#393D49',
					click: function(type) {}
				});

				laydate.render({
					elem: '#monthOption',
					range: true,
					range: '至',
					/* min: gitData()  */
				});

			});
	</script>
			<script>
		$(function(){
			$.ajaxSetup({async:false});
			function getdata(){
				var map=new Map();
				if($("#ID").val().length!=0){map.ID=$("#ID").val().trim()}
				if($("#USER_NAME").val().length!=0){map.USER_NAME=$("#USER_NAME").val().trim()}
				if($("#COMPANY_NAME").val().length!=0){map.COMPANY_NAME=$("#COMPANY_NAME").val().trim()}
				if($("#POSITION").val().length!=0){map.POSITION=$("#POSITION").val().trim()}
				if($("#DEPARTMENT").val().length!=0){map.DEPARTMENT=$("#DEPARTMENT").val().trim()}
				if($("#CONTACT_ADDRESS").val().length!=0){map.CONTACT_ADDRESS=$("#CONTACT_ADDRESS").val().trim()}
				if($("#ZIP_CODE").val().length!=0){map.ZIP_CODE=$("#ZIP_CODE").val().trim()}
				if($("#COMPANY_WEBSITE").val().length!=0){map.COMPANY_WEBSITE=$("#COMPANY_WEBSITE").val().trim()}
				if($("#monthOption").val().trim().length!=0){map.STime=$("#monthOption").val().trim().split("至")[0];map.ETime=$("#monthOption").val().trim().split("至")[1]}
				if($("#POSITION").val().length!=0){map.POSITION=$("#POSITION").val().trim()}
				if($("#DEPARTMENT").val().length!=0){map.DEPARTMENT=$("#DEPARTMENT").val().trim()}
				return map;
			}
			layui.use(['laypage','layer','element'],function(){
				var laypage = layui.laypage
				  ,layer = layui.layer;
				$("#btn").click(function(){
					//console.log(getdata());
					getMes(getdata());
			    });
				$(".UserEdit").live("click",function(){
					var id=$(this).parent().parent().children().html();
					var name=$(this).parent().parent().children().next().children().html();
					var PHONE=$(this).parent().parent().children().next().next().html();
					var COMPANY_NAME=$(this).parent().prev().prev().prev().prev().prev().prev().html();
					var ZIP_CODE=$(this).parent().prev().prev().prev().prev().html();
					var CONTACT_ADDRESS=$(this).parent().prev().prev().prev().prev().prev().html();
					var COMPANY_WEBSITE=$(this).parent().prev().prev().prev().html();
					var POSITION=$(this).parent().prev().prev().html();
					var DEPARTMENT=$(this).parent().prev().html();
					var Map={
						"id":id,
						"name":name,
						"PHONE":PHONE,
						"COMPANY_NAME":COMPANY_NAME,
						"ZIP_CODE":ZIP_CODE,
						"CONTACT_ADDRESS":CONTACT_ADDRESS,
						"COMPANY_WEBSITE":COMPANY_WEBSITE,
						"POSITION":POSITION,
						"DEPARTMENT":DEPARTMENT
					}
					OrderEdit(Map);
				})
				
				function OrderEdit(Map){
					layer.open({
			         type: 2 //此处以iframe举例
			        ,title: '您当前正在编辑，编号为：'+Map.id+' , 姓名为：'+Map.name+' 的用户信息'
			        ,area: ['1261px','416px']
			        ,shade: 0
			        ,maxmin: true
			        ,offset: ['100px']
			        ,content: 'UserEdit.jsp'
			        ,btn: ['关闭'] //只是为了演示
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero, index){
			        	// 获取子页面的iframe
			            var iframe = window['layui-layer-iframe' + index];
	                    // 向子页面的全局函数child传参
	                    iframe.child(Map);
			        }
			      });
				}
				
			  getMes({});//默认加载 
			  function getMes($data){
				  $.post("<%=request.getContextPath()%>/sa/user/getuser.ba",{map:JSON.stringify($data)},success,"json");
		 			function success(result){
		 				//console.log(result);
		 				var $table='<tr><td>账号</td><td>用户姓名</td><td>手机号</td><td>登陆时间</td><td>上次登陆时间</td><td>登陆次数</td><td>注册时间</td><td>公司名称</td><td>联系地址</td><td>邮政编码</td><td>公司网址</td><td>职务</td>\
		 					<td>部门</td>\
		 					<td>操作</td></tr>';
		 					$.each(result.data.Data,function(i,o){
		 						var  LAST_LOGIN_TIME=o.LAST_LOGIN_TIME!=null?o.LAST_LOGIN_TIME:"-";
		 						var  LOGIN_COUNT=o.LOGIN_COUNT!=null?o.LOGIN_COUNT:"0";
		 						var  LOGIN_TIME=o.LOGIN_TIME!=null?o.LOGIN_TIME:"-";
		 						var  ZIP_CODE=o.ZIP_CODE!=null?o.ZIP_CODE:"-";
		 						var  COMPANY_WEBSITE=o.COMPANY_WEBSITE!=null?o.COMPANY_WEBSITE:"-";
		 						var  POSITION=o.POSITION!=null?o.POSITION:"-";
		 						var  DEPARTMENT=o.DEPARTMENT!=null?o.DEPARTMENT:'-';
		 						
		 						$table+='<tr><td>'+o.ID+'</td>\
								  <td><a href="#">'+o.USER_NAME+'</a></td>\
								  <td>'+o.PHONE+'</td>\
								  <td>'+LOGIN_TIME+'</td>\
								  <td>'+LAST_LOGIN_TIME+'</td>\
								 <td>'+LOGIN_COUNT+'</td>\
								<td>'+o.ENROLL_TIME+'</td>\
								<td>'+o.COMPANY_NAME+'</td>\
								<td>'+o.CONTACT_ADDRESS+'</td>\
								<td>'+ZIP_CODE+'</td>\
								<td>'+COMPANY_WEBSITE+'</td>\
								<td>'+POSITION+'</td>\
								<td>'+DEPARTMENT+'</td>\
								<td><button class="layui-btn layui-btn-sm layui-bg-blue UserEdit"><i class="layui-icon ">&#xe642;</i></button></td>\
								<tr>';
		 					})
		 				$("#table").html($table);
		 				var Count=result.data.Pu.rowCount;
		 				var Curr=result.data.Pu.currenPage;
		 				var PageSize=result.data.Pu.pageSize;
		 				initPageUtil(Count,Curr,PageSize);
		 			}
			  }
			  
			//调用的时候初始化分页控件
				function initPageUtil(Count,Curr,PageSize){
				 //完整分页功能
				  laypage.render({
				    elem: 'PageUtil'
				    ,count: Count //传入数据总数Count
				    ,limit:PageSize //显示条数
				    ,curr:Curr   //当前页
				    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
				    ,jump: function(obj,first){
				      var $curr=obj.curr;
				      var $limit=obj.limit;
				        //首次不执行
				    if(!first){
				      var map=getdata();
				    	  map.Curr=$curr;
				    	  map.PageSize=$limit;
				    //在这里执行的需要的获取数据function 函数最后再次调用 【initPageUtil】
				      getMes(map);
				    }
				    }
				  });
				 }
			});
		});
		</script>
</html>