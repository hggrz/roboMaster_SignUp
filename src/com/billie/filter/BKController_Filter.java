package com.billie.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.billie.util.IpGet;


/**
 * 
 * @ClassName: Controller_Filter
 * @Description: 后台APi请求过滤器
 * @author zhangfeng
 * @date 2018年8月30日
 */
public class BKController_Filter extends IpGet implements Filter {
	private   Logger logger = Logger.getLogger(this.getClass());//log4j配置 
	public void destroy() {
		          
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		Map<String, Object> ReqMessage=GetReqMessage(req, res);//获取请求用户信息
		//获取管理员登录信息
		Map<String, Object> admin = (Map<String, Object>) req.getSession().getAttribute("admin");
		String ServletPath=req.getServletPath();//获取请求的ServletPath
		if(ServletPath != null && ServletPath.endsWith(".ba")) {//判断是否为.ba的后台请求
				if ("/Ba/admin/login.ba".equals(ServletPath)) {//如果是登陆请求放行
					chain.doFilter(req, res);
				} else {//否则进入登录判断
					// 从session里取的用户名信息
					// 判断如果没有取到管理员信息,就跳转到登陆页面
					if (admin == null || "".equals(admin)) {
						res.sendRedirect(req.getContextPath()+"/login.jsp");
					} else { 
						ReqMessage.put("Admin", admin);//记录请求管理员信息
						logger.info(ReqMessage);//记录请求信息数据
						// 已经登陆,继续此次请求
						chain.doFilter(req, res);
					}
				}
			}else if(ServletPath != null && ServletPath.endsWith(".do")) {//如果为.do的前台请求
				Map<String, Object> User = (Map<String, Object>) req.getSession().getAttribute("User");//获取用户信息
				if(ServletPath.equals("Ba/Sys/readImage.do")) {//如果是请求下载图片放行
					chain.doFilter(req, res);
				}else {
					if (User == null || "".equals(User)) {
						if(admin== null || "".equals(admin)) {//如果请是管理员登陆可继续访问前台界面API
							res.sendRedirect(req.getContextPath()+"/login.jsp");
						}else {
							chain.doFilter(req, res);
						}
					} else { 
						ReqMessage.put("User", User);//记录请求用户的信息
						logger.info(ReqMessage);//记录请求信息数据
						// 已经登陆,继续此次请求
						chain.doFilter(req, res);
					}
				}
			}else {//其余都跳前台首页
				res.sendRedirect(req.getContextPath()+"/login.jsp");
			}
		}
	

	public void init(FilterConfig arg0) throws ServletException {

	}

}
