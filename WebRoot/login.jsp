<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/layui/css/layui.css" media="all" />
<title>首届 RoboMaster 机甲大师青少年挑战赛华东赛报名平台</title>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/static/js/Currency.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jquery-1.4.2.min.js"></script>

<style type="text/css">

	.login_logo{
		overflow: hidden;
	    border-radius: 100%;
	}
	
	.login_box{
		min-width:100%;
	}
	.copyright{
	    margin-top: 162px;
	}
	
	.layui-btn {
	    display: inline-block;
	    height: 38px;
	    line-height: 38px;
	    padding: 0 18px;
	    background-color: #eb681a;
	    color: #fff;
	    white-space: nowrap;
	    text-align: center;
	    font-size: 14px;
	    border: none;
	    border-radius: 2px;
	    cursor: pointer;
    }
	
</style>

</head>

<body style="background-color: #231916;">

	<div class="login_box" style="margin-top: 170px;">
		<div class="login_l_img">
			<img src="<%=request.getContextPath()%>/images/background-img2.png" />
		</div>
		
		<div class="login_span" >
			<div class="login">
				<div class="login_logo">
					<a href="#"><img src="<%=request.getContextPath()%>/images/logo.png"
						style="width: 153px;height: 149px;margin-left: -23px;margin-top: -22px;" /></a>
				</div>
				
				<div class="login_name">
					<p>首届 RoboMaster 机甲大师青少年挑战赛华东赛</br>报名平台</p>
				</div>
				<form class="layui-form">
					<div class="layui-form-item">
						<input type="text" id="RUR_Email" maxlength="30"
							lay-verify="title" autocomplete="off" placeholder="邮箱"
							class="layui-input" style="height: 45px;">
					</div>
					<div class="layui-form-item">
						<input type="password" id="RUR_Pwd" lay-verify="pass" placeholder="密码"
							autocomplete="off" class="layui-input" style="height: 45px;">
					</div>
					<p class="privacy text-center" style="font-size: 1.0em; text-align: right;  margin-bottom: 7px;">还没有账号 ？
						<a href="<%=request.getContextPath()%>/Reception/registered.jsp">立即注册</a>
					</p>
					<div class="layui-form-item">
						<input class="layui-btn" id="sub"
							style="width: 100%; height: 45px;" value="登录" readonly="readonly"></input>
							
						<!-- <p class="privacy text-center" style="font-size: 1.5em;text-align: center; margin-bottom: 7px; color: #ffb800c2;">内测版</p> -->
					</div>
					
					
				</form>
			</div>
		</div>
		<script src="<%=request.getContextPath()%>/plugins/layui/layui.js""utf-8"></script>
		<script>
		$(function(){
			  $("#sub").click(function(){
				  login_ing();//登陆加载中
			  })
			  
			  //回车事件绑定
			    $('#RUR_Email,#RUR_Pwd').bind('keyup', function(event) {
			        if (event.keyCode == "13") {
			            //回车执行查询
			           login_ing();//登陆加载中
			        }
			    });
			  
			  //登陆加载中
			  function login_ing(){
				  var $RUR_Email=$("#RUR_Email").val();
				    var $RUR_Pwd=$("#RUR_Pwd").val();
				    if(VerificationEmail($("#RUR_Email"))==true && $RUR_Pwd.length>=6){
				      var map={
			    		  RUR_Email:$RUR_Email,
			    		  RUR_Pwd:$RUR_Pwd
				      }
				      login(map);
				    }else{
				      if($RUR_Pwd.length<6){
				        FriendlyPrompt("密码需要大于六位数");
				      }
				    }
			  }
			  
			  
				
			  function login($data){
				    $.post("<%=request.getContextPath()%>/sa/user/login.do",{map:JSON.stringify($data)},success,'json');
				    function success(result){
				      if(result.messages==true){
				          location.href="<%=request.getContextPath()%>/index.jsp"
				      }else{
				        FriendlyPrompt(result.messages);
				      }
				    }

				  }
			  
			<%--   var map={
				   CONTACT_NUMBER:"17375829235",
					PASSWORD:'123456',
			       }
			  updateRUR_Pwd(map);
			  function updateRUR_Pwd($data){
			    $.post("<%=request.getContextPath()%>/Ba/admin/updAdmins.do",{map:JSON.stringify($data)},success,'json');
			    function success(result){
			      console.log(result);
			    }
			  } --%>
		    
		})
		
		</script>
		
		<script>
		$(function(){
			 	 zsy();
		        //浏览器大小发生变化时
		        $(window).resize(function() {
		            zsy();
		        })
		        function zsy(){
		            if($(window).width() > 1200){
		            	$('.login_l_img').show();
		            	$('.login').css({'margin-right':'165px','margin-top':'50px'})
		            }
		            if($(window).width() <= 1200){
		            	$('.login_l_img').show();
// 		            	.css({"width":"blue","font-size":"14px"});
		            	$('.login_logo').css({'right':'140px'})
		            	$('.login').css({'margin-right':'3%','margin-top':'0px','width':'400px','padding':'50px'})
		            	$('.login_l_img').css({'margin-left':'0%','margin-top':'-74px'});
		            	$('.login_box .login_l_img img').css({'height':'682px','width':'1021px','margin':'-53px 0px 0px -129px'});
		            	
		            }
		            if($(window).width()<1023){
		            	$('.login_l_img').hide();
		            	$('.login_l_img').css({'margin-left':'-8%','margin-top':'-19px'});
		            	$('.login_logo').css({'right':'140px'})
		            	$('.login').css({'margin-right':'0%','margin-top':'0px','width':'400px','padding':'50px'})
		            }
		            if($(window).width()<321 ){
		            	$('.login').css({'width':'320px','padding':'34px','margin-right':'0%',})
		            	$('.login_logo').css({'right':'95px'})
		            }
		        }
			
	
			layui.use(['form', 'layedit', 'laydate'], function(){
			  var form = layui.form
			  ,layer = layui.layer
			  ,layedit = layui.layedit
			  ,laydate = layui.laydate;
			  
			 	
			  
			});
		
		})
	</script>
	<!-- 
	</div>
		<div class="copyright" style="font-size: 5px;">上海市彼林电子科技有限公司 (技术支持)©2019年&nbsp;&nbsp;&nbsp;&nbsp;技术支持邮箱：021-64062155</div>
	</div> -->
	
</body>

</html>
