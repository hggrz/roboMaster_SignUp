<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/static/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>404</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	</head>
		 
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="error-container">
							<div class="well">
								<h1 class="grey lighter smaller">
									<span class="blue bigger-125"><i class="icon-sitemap"></i> 404</span> 没有找到此页面
								</h1>
								<hr />
								
								<div>
									
									<div class="space"></div>
									
									<h4 class="smaller">检查一下可能性:</h4>
									<ul>
										<li><i class="icon-hand-right blue"></i> 检查请求链接是不是有误</li>
										<li><i class="icon-hand-right blue"></i> 如有疑问请发送操作详细信息至：<a href="mailto:546558392@qq.com">开发问题处理邮箱 546558392@qq.com</a></li>
										<li><i class="icon-hand-right blue"></i><a href="<%=request.getContextPath()%>/index.jsp">返回首页</a></li>
									</ul>
								</div>
								
								<hr />
								<div class="space"></div>
								
								<div class="row-fluid">
									<div id="zhongxin">
									</div>
								</div>
							</div>
							</div>
		
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<iframe src='F:\Sign_up_File\upload\Project_Attachment\SJ_D_A_007_PDF.pdf' width='100%' height='100%' frameborder='1'>
        </iframe>

	</div>


</body>
</html>