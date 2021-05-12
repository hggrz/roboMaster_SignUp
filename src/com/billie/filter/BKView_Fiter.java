package com.billie.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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

import com.billie.util.Commonly;
import com.billie.util.IpGet;



/**
 * 
 * @ClassName: View_Fiter   
 * @Description: 界面请求过滤器()   
 * @author zhangfeng
 * @date 2018年8月30日
 */
public class BKView_Fiter extends IpGet implements Filter{
	private   Logger logger = Logger.getLogger(this.getClass());//log4j配置 
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 ArrayList<String> ReqUrlarr=new ArrayList<String>();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String ServletPath=req.getServletPath();//获取请求的ServletPath
		if(ServletPath != null && ServletPath.endsWith(".jsp")) {//判断该请求是否是.jsp的访问界面请求
			if(ServletPath.length()>10 && "/Reception/".equals(ServletPath.substring(0,11))) {//如果是前台请求
				chain.doFilter(req, res);
			}else {
				//获取用户登录信息
				Map<String, Object> admin = (Map<String, Object>) req.getSession().getAttribute("admin");
				if ("/login.jsp".equals(ServletPath)|| "/404.jsp".equals(ServletPath)) {
					chain.doFilter(req, res);
				} else { 
					if (admin == null || "".equals(admin)) {
						// 跳转到登陆页面
						res.sendRedirect(req.getContextPath()+"/login.jsp");
					} else { 
						// 已经登陆,继续此次请求
						chain.doFilter(req, res);
						
					}
				}
			}
		}else {chain.doFilter(req, res);}//否则放行
		
		
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
