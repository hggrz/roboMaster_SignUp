<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>注册</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/registered.css"
	media="all">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/jquery-1.4.2.min.js"></script>
<script src="<%=request.getContextPath()%>/static/layui/layui.js"></script>
<script src="<%=request.getContextPath()%>/static/js/Currency.js"></script>
<style>
.hyz, .RUR_Emailhyz {
	margin-bottom: 0px;
	float: left;
	margin-top: 17px;
	margin-left: 0px;
	color: #2196F3;
}

.hyz:hover {
	cursor: pointer;
}

.RUR_Emailhyz:hover {
	cursor: pointer;
}

.layui-form-label {
	width: 122px;
}

.layui-input-inline {
	width: 300px;
}

.layui-input-block input {
	width: 79%;
}

.layui-bg-blue {
	background-color: #5FB878 !important;
}

.Color_red{
	color: red!important;
}

</style>
</head>

<body class="">

	<fieldset class="layui-elem-field layui-container"
		style="margin-top: 50px;">
		<legend>注册信息表单</legend>
		<div class="layui-field-box">
			<blockquote class="layui-elem-quote layui-quote-nm " style="border-color: #5FB878;">请如实填写您的信息，以方便我们更好的服务。<font class="Color_red">*</font> 号为必填项目</blockquote>
			<table class="layui-table">
				<div class="layui-form-item">
					<label class="layui-form-label"><font class="Color_red">*</font> 真实姓名：</label>
					<div class="layui-input-block">
						<input type="text" name="RUR_Name" lay-verify="title" maxlength="10"
							autocomplete="off" id="RUR_Name" placeholder="填写真实姓名有助于更高效的服务"
							class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">
					<font class="Color_red">*</font> 常用邮箱：</label>
					<div class="layui-input-block">
						<input type="text" name="RUR_Email" lay-verify="RUR_Email" maxlength="30"
							autocomplete="off" id="RUR_Email" placeholder="常用邮箱,注册后会成为您的您的登陆账号"
							class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label"><font class="Color_red">*</font> 密码：</label>
					<div class="layui-input-block">
						<input type="password" name="RUR_Pwd" maxlength="18"
							lay-verify="RUR_Pwd" autocomplete="off" id="RUR_Pwd"
							placeholder="密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><font class="Color_red">*</font> 确认密码：</label>
					<div class="layui-input-block">
						<input type="password" name="confirmRUR_Pwd" maxlength="18"
							lay-verify="confirmRUR_Pwd" autocomplete="off"
							id="confirmRUR_Pwd" placeholder="再次确认密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><font class="Color_red">*</font> 单位 ：</label>
					<div class="layui-input-block">
						<input type="text" name="RUR_School" lay-verify="title" maxlength="50"
							autocomplete="off" id="RUR_School" placeholder="如：上海市*******学校"
							class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label"><font class="Color_red">*</font> 邮箱验证码获取：</label>
					<div class="layui-input-inline" style="width: 120px;">
						<input type="text" name="title" id='RUR_EmailYZM' readonly="readonly"
							lay-verify="title" autocomplete="off" placeholder=""
							class="layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="title" id="RUR_EmailYZMresult"
							lay-verify="title" autocomplete="off" placeholder="请填写左边结果"
							class="layui-input">
					</div>
					<!-- <div class="layui-input-inline">
						<button class="layui-btn layui-bg-blue" id="RUR_EmailYZMBtn"
							name="btn" />
						获取邮箱注册验证码
						</button>
					</div> -->
					<div class="layui-input-inline">
						<span class="RUR_Emailhyz">看不清楚换一张</span>
					</div>
				</div>
				<!-- <div class="layui-form-item">
					<label class="layui-form-label"><font class="Color_red">*</font> 邮箱验证码： </label>
					<div class="layui-input-inline">
						<input type="text" maxlength="6" id="random" name="code"
							lay-verify="title" autocomplete="off" placeholder="请输入您的邮箱注册验证码"
							class="layui-input" required>
					</div>
				</div> -->
				<div class="layui-form-item " >
					<button class="layui-btn layui-bg-blue btn_div" id="submit" style="margin-left: 36%; width: 135px; border-radius: 12px;">提交表单</button>
					<button class="layui-btn btn_div" id="FH" style=" width: 135px; border-radius: 12px;background-color: #2196F3 !important;">返回</button>
				</div>
			</table>
		</div>
	</fieldset>

</body>
<script type="text/javascript">
	

	$(function(){
		
			 zsy();
	        //浏览器大小发生变化时
	        $(window).resize(function() {
	            zsy();
	        })
	        function zsy(){
	            if($(window).width() >1000 ){
	            	$('#FH').css({'margin-left':'0%'})
	            	$('.btn_div').css({'margin-top':'0px'})
	            }
	            if($(window).width()<1000 ){
	            	$('#FH').css({'margin-left':'36%'})
	            	$('.btn_div').css({'margin-top':'10px'})
	            }
	        }
		
		$.ajaxSetup({async:false});//同步
		var $RUR_EmailYZM=productionVerificationCode($("#RUR_EmailYZM"));
		//邮箱验证码看不清楚换一张
		$(".RUR_Emailhyz").click(function(){
			$RUR_EmailYZM=productionVerificationCode($("#RUR_EmailYZM"));
		})
		
		//返回
		$('#FH').click(function(){
			 window.location.href="<%=request.getContextPath()%>";
		})
		
		
		function Disable_Btn(Eml){
			var InterValObj; //timer变量，控制时间
		    var count = 60; //间隔函数，1秒执行
		    var curCount;//当前剩余秒数
		    sendMessage();//开始禁用
		    function sendMessage(){curCount = count;
			    Eml.attr("disabled", "true");
			    Eml.val(curCount + "秒后可重新发送");
		        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
		    }
		    //timer处理函数
		    function SetRemainTime() {
		        if (curCount == 0) {
		            window.clearInterval(InterValObj);//停止计时器
		            Eml.removeAttr("disabled");//启用按钮
		            Eml.val("重新发送验证码");
		            Eml.html("重新发送验证码");
		        }
		        else {
		            curCount--;
		            Eml.val(curCount + "秒后可重新发送");
		            Eml.html(curCount + "秒后可重新发送");
		        }
		    } 
		}
		
		
		
		//获取保存参数
		function getParameter(){
			var map={};
				map.RUR_Name = not_null_Get_val($('#RUR_Name'));//真实姓名
				map.RUR_Email = not_null_Get_val($('#RUR_Email')); //邮箱
				map.RUR_Pwd = not_null_Get_val($('#RUR_Pwd')); //密码
				map.RUR_Tel = null; //联系方式
				map.RUR_School  = not_null_Get_val($('#RUR_School'));//单位名称
				
				//map.random =  not_null_Get_val($('#random'));//判断邮箱验证码
				//console.log(map);
			return map;
		}	
		
		
		
		$("#submit").click(function(){
		    if(Verificationval($("#RUR_Name"),"真实姓名不能为空哦！")==true && 
		       VerificationPwd($("#RUR_Pwd"),$("#confirmRUR_Pwd"))==true &&
		       VerificationEmail($("#RUR_Email"))==true &&
		       Is_Email({'RUR_Email':$('#RUR_Email').val()})==false){//验证表单
		    	
		    	if($("#RUR_EmailYZMresult").val().trim()!=$RUR_EmailYZM){
	        		FriendlyPrompt("请输入正确的结果");
	        		$RUR_EmailYZM=productionVerificationCode($("#RUR_EmailYZM"));
	        	}else{
	        		Loding();//防止重复提交
		        	registered(getParameter());
		    	}
		    		
		    }
		   
		})
		
		//查询邮箱是否已注册
		function Is_Email(data){
			var bool=false;
			//console.log(data)
			$.post("<%=request.getContextPath()%>/sa/user/Is_Email.fx",{map:JSON.stringify(data)},success,'json');
			 function success(result){
				// console.log(result)
				 bool=result.message;
				 if(bool==true){
					 FriendlyPrompt("邮箱已注册！请直接登陆");
				 }
			 } 
			 return bool;
		}
		
		
		
		function registered($data){//注册
			$.post("<%=request.getContextPath()%>/sa/user/registered.fx",{map:JSON.stringify($data)},success,'json');
			 function success(result){
				 layer.closeAll();
					 if(result.message==true){
						 FriendlyPrompt("您已注册成功！两秒后跳转至登陆界面");
						  setTimeout(function(){//两秒后跳转
							 window.location.href="<%=request.getContextPath()%>/login.jsp"
						  },2000);
				} else {
					FriendlyPrompt(result.message);
				}
			}
		}
		
		
		function productionVerificationCode(element) {
			var code = 9999;
			/* var ranColor = '#' + ('00000' + (Math.random() * 0x1000 << 0).toString(16)).slice(-6); //随机生成颜色
			// alert(ranColor)
			var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000 << 0).toString(16)).slice(-6); */
			var num1 = Math.floor(Math.random() * 10);
			var num2 = Math.floor(Math.random() * 10);
			//随机算法
			var tmparith = Math.floor(Math.random() * 2);
			var $html = "";
			switch(tmparith) {
				case 1:
					code = num1 + num2;
					$html = num1 + ' + ' + num2 + ' = ?';
					break;
				case 2:
					if(parseInt(num1) < parseInt(num2)) {
						var tmpnum = num1;
						num1 = num2;
						num2 = tmpnum;
					}
					code = num1 - num2;
					$html = num1 + ' - ' + num2 + ' = ?';
					break;
				default:
					code = num1 * num2;
					$html = num1 + ' × ' + num2 + ' = ?';
					break;
			}
			element.val($html); //写入验证码
			if(element.hasClass("nocode")) {
				element.removeClass("nocode");
				element.addClass("code");
			}
			/* element.css('background', ranColor);
			element.css('color', ranColor2); */
			return code;
		}
		
	});
</script>
<script>
	layui.use([ 'layer', 'element' ], function() {
		var layer = layui.layer;
	})
</script>

</html>