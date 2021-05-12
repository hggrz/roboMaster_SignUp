<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/analysiscss/animsition.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/analysiscss/drop-down.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/analysiscss/common.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/analysiscss/xsfx.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/analysiscss/jquery-labelauty.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/layui/css/layui.css" media="all" />
		 <script src="<%=request.getContextPath()%>/plugins/layui/layui.js"></script>
		 
		 <style type="text/css">
		 	.div{
		 		width: 200px;
		 		height: 220px;
		 		float: left;
		 		text-align: center;
		 		margin-left: 10%;
		 		margin-top: 60px;
		 		cursor:pointer;
		 		font-size: 1.2em;
		 	}
		 	.div:hover {
		 		color: #ff480e;
		 	}
		 	body{
		 		background-color: #f8f9fb;
		 	}
		 	.red{
		 		color: red;
		 	}
		 </style>
	</head>
	<body>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
			<legend style="text-align: center;color: red;">申报必读</legend>
		</fieldset>

		<blockquote class="layui-elem-quote layui-text" style="margin-top: -15px;">
			<lable style="color: red;">提示:同一台电脑同时只能登陆一个账号进行申报，如果登陆别人账号进行查看，
				一定要注销后登陆自己账号进行申报，否则可能会引起申报数据问题。</label>
		</blockquote>

		<fieldset class="layui-elem-field">
			<legend style="color: #00B7EE;">申报时间</legend>
			<div class="layui-field-box">
				1.申报截止时间为【2021年01月15号】，距离申报截止还剩【<font style="color: red;" id="Remaining"></font>】天，请在规定时间前提交。<br /><br />
				2.申报保存成功后，数据将进行保留，在申报截止时间前可进行修改，超过提交截止时间后不予进行更改信息。<br /><br />
				3.单次报名申请只针对单只队伍，多只队伍报名，请重新申请报名。<br /><br />
				4.请勿重复填写报名信息，报名申请以最后一次提交为准。<br /><br />
			</div>
		</fieldset>

		<fieldset class="layui-elem-field">
			<legend style="color: #00B7EE;">申报流程</legend>
			<div class="layui-field-box">

				<ul class="layui-timeline">
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis"></i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">项目信息</h3>
				      <p>
				       	参赛项目、参赛组别、参赛单位、所在省市、联系人、联系电话、邮箱、 邮寄地址。
				      </p>
				    </div>
				  </li>
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis"></i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">队员信息</h3>
				      <ul>
					      <li>
					      		<font class="red">参赛队员信息请如实填写，参赛信息会直接保存到比赛当中。</font>
					      </li>
					      <li>
					      		<font class="red">报名确认后不能修改参赛队员姓名，如有错误将直接影响到获奖证书。</font>
					      </li>
				      </ul>
				    </div>
				  </li>
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis"></i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">指导老师</h3>
				      <p>
				     	姓名、性别、职务或职称(非必填项)、E-mail、手机。
				      </p>
				    </div>
				  </li>
				  
				 <!--  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis"></i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">保存上传</h3>
				       <p>
							 填写完保存成功之后，可在左边导航中<font class="red">【报名信息查看】</font>中查询当前账号填写报名的队伍信息；
							 </br>
							 并<font class="red">点击进入【编辑<img src="img/Edit.png">】报名信息：</font>
				       </p>
				       <ul>
					      <li>
					      		<font class="red">在【项目附件】上传参赛队员照片信息压缩包</font>
					      </li>
					      <li>
					      		<font class="red">在【打印申报书】中先 
					      		</br> > 点击[打印申报书] 并打印，经报名单位盖章后用工具扫描成PDF文档
					      		</br> > 点击上传申报书 上传PDF文档</font>
					      </li>
				      </ul>
				    </div>
				  </li> -->
				</ul>  
			</div> 
		</fieldset>

		<fieldset class="layui-elem-field">
			<legend style="color: #00B7EE;">申报系统说明</legend>
			<div class="layui-field-box">
				<font >
					<p class="red" >在报名过程中如遇到问题请加群咨询</p></br>
					<img src="img/群.jpg" width="200px" />
					<!-- 2.<a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=DEyDj_iNB0dXXHGKrIAy06nt8XlaQc5n&jump_from=webapi"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="2020人工智能比赛报名" title="2020人工智能比赛报名">咨询入群[893507381]</a> -->
				</font>
			</div>
		</fieldset>

	</body>
	
	<script src="<%=request.getContextPath()%>/static/js/jquery-1.4.2.min.js"></script>
 	<script src="<%=request.getContextPath() %>/SignUp_Static/js/Currency.js"></script>
	<script>
		//赋值剩余天数
		$('#Remaining').html(GetDateDiff(gitData(), '2021-01-15', 'day'));
	</script>
	
</html>
