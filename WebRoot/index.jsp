<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <c:if test="${admin.ACTUAL_NAME!=null}"> --%>
<!DOCTYPE html>
<html ondblclick="Full_screen()">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首届 RoboMaster 机甲大师青少年挑战赛华东赛报名平台</title>
   <!--  <link rel="icon" href="build/images/zhanying.png" type="image/x-icon"/> -->
    <link rel="stylesheet" href="./plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="./plugins/font-awesome/css/font-awesome.min.css" media="all" />
    <link rel="stylesheet" href="./build/css/app.css" media="all" />
    <link rel="stylesheet" href="./build/css/themes/default.css" media="all" id="skin" kit-skin />
	<script src="./js/jquery-1.4.2.min.js"></script>    
	<script src="./js/Currency.js"></script>
    <script>
    	$(function(){
             $.ajaxSetup({async:false});
            loadmuen();
		
            function loadmuen(){
               
            	var arr =[];
            	
            	var map ={};
            	map.NAVID = '1';
            	map.ICON = '&#xe66f;';
            	map.NAVName = '报名管理';
            	map.BELONGTOID = '0';
            	arr.push(map);
            	
            	var map_1 ={};
            	map_1.NAVID = '2';
            	map_1.ICON = '&#xe63c;';
            	map_1.NAVName = '报名申请';
            	map_1.URL = 'Application_Registration.jsp';
            	map_1.BELONGTOID = '1';
            	arr.push(map_1);
            	
            	var map_2 ={};
            	map_2.NAVID = '3';
            	map_2.ICON = '&#xe613;';
            	map_2.NAVName = '报名信息查看';
            	map_2.URL = 'Registration_Information.jsp';
            	map_2.BELONGTOID = '1';
            	arr.push(map_2);
            	
            	var map_3 ={};
            	map_3.NAVID = '4';
            	map_3.ICON = '&#xe613;';
            	map_3.NAVName = '比赛通知';
            	map_3.URL = 'Match_Notice.jsp';
            	map_3.BELONGTOID = '1';
            	arr.push(map_3);
            	
            	
            	
            	var $htmltext = '';
	    		//页面加载
                    $.each(arr,function(i,o){
                        $htmltext+='<li class="layui-nav-item layui-nav-itemed">';
                            if(o.BELONGTOID==0){//筛选出主标题
                                $htmltext+="<a href=\"javascript:;\"><i class=\"fa fa-plug\" aria-hidden=\"true\"></i><span>"+o.NAVName+"</span></a>\
                                <dl class='layui-nav-child'>"; 
                                $.each(arr,function(index,obj){//筛选出该导航下的子导航
                                    if(obj.BELONGTOID!=0&&obj.BELONGTOID==o.NAVID){
                                        $htmltext+="<dd><a href=\"javascript:;\" kit-target data-options=\"{url:'"+obj.URL+"',icon:'"+obj.ICON+"',title:'"+obj.NAVName+"',id:'"+obj.NAVID+"'}\"><i class='layui-icon'>"+obj.ICON+"</i><span>"+obj.NAVName+"</span></a></dd>";
                                    }
                                })
                            }
                        $htmltext+="</dl></li>";
                     });
                    $("#nav_link").html($htmltext);
            }


			



    		
    	})
   
    </script>
    <script type="text/javascript">
    	window.history.go(1);
    </script>
    
</head>
<body class="kit-theme">
    <div class="layui-layout layui-layout-admin kit-layout-admin">
        <div class="layui-header">
            <div class="layui-logo" style="width:425px;">首届 RoboMaster 机甲大师青少年挑战赛华东赛报名平台</div>
            <div class="layui-logo kit-logo-mobile">报名</div>
            <ul class="layui-nav layui-layout-right kit-nav">
            		
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon ">&#xe61b;</i>皮肤</a>
                    </a>
                    <dl class="layui-nav-child skin">
                        <dd><a href="javascript:;" data-skin="default" style="color:#393D49;"><i class="layui-icon">&#xe658;</i> 默认</a></dd>
                        <dd><a href="javascript:;" data-skin="orange" style="color:#ff6700;"><i class="layui-icon">&#xe658;</i> 橘子橙</a></dd>
                        <dd><a href="javascript:;" data-skin="green" style="color:#00a65a;"><i class="layui-icon">&#xe658;</i> 原谅绿</a></dd>
                        <dd><a href="javascript:;" data-skin="pink" style="color:#FA6086;"><i class="layui-icon">&#xe658;</i> 少女粉</a></dd>
                        <dd><a href="javascript:;" data-skin="blue.1" style="color:#00c0ef;"><i class="layui-icon">&#xe658;</i> 天空蓝</a></dd>
                        <dd><a href="javascript:;" data-skin="red" style="color:#dd4b39;"><i class="layui-icon">&#xe658;</i> 枫叶红</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="img/true.jpg" class="layui-nav-img">${admin.RUR_Name}
                    </a>
                </li>
                <li class="layui-nav-item"><a href="javascript:void(onclick);" onclick="location.href='<%=request.getContextPath()%>/sa/user/Esc.do';"><i class="fa fa-sign-out" aria-hidden="true"></i>注销</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul id="nav_link" class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
               		
                </ul>
            </div>
        </div>
        <div class="layui-body" id="container">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63e;</i> 正在加载中...</div>
        </div>

      <!--   <div class="layui-footer">
            底部固定区域
            	上海彼林电子科技技术有限公司  &copy;
        </div> -->
    </div>
   
    <script src="./plugins/layui/layui.js"></script>
    <script>
    	
        var message;
        layui.config({
            base: 'build/js/',
            version: '1.0.1'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
            $('dl.skin > dd').on('click', function() {
                var $that = $(this);
                var skin = $that.children('a').data('skin');
                switchSkin(skin);
            });
            var setSkin = function(value) {
                    layui.data('kit_skin', {
                        key: 'skin',
                        value: value
                    });
                },
                getSkinName = function() {
                    return layui.data('kit_skin').skin;
                },
                switchSkin = function(value) {
                    var _target = $('link[kit-skin]')[0];
                    _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
                    setSkin(value);
                },
                initSkin = function() {
                    var skin = getSkinName();
                    switchSkin(skin === undefined ? 'blue.1' : skin);
                }();
        });
    </script>
        <script>
    	layui.use(['laydate', 'layer', 'element', 'form'], function() {
			var laydate = layui.laydate;
			var form = layui.form,
				layer = layui.layer
				$.ajaxSetup({async:false});
			
		})		
    	
    </script>
</body>

</html>
<%-- </c:if>
<c:if test="${admin.ACTUAL_NAME==null || admin==null}">
	<script>location.href="<%=request.getContextPath()%>/login.jsp";</script>
</c:if>  --%>