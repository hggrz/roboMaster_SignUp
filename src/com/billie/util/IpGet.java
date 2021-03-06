package com.billie.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

/**
 * 
 * @ClassName: IpGet
 * @Description: 获取请求IP地址
 * @author zhangfeng
 * @date 2018年7月14日
 */
public class IpGet {
	/**
	 * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址,
	* 
	 * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？
	 * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。
	 * 
	 * 如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130, 192.168.1.100
	 * 
	 * 用户真实IP为： 192.168.1.110
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddress(HttpServletRequest request) {
		 String Xip = request.getHeader("X-Real-IP");
	        String XFor = request.getHeader("X-Forwarded-For");
	        if(StringUtils.isNotEmpty(XFor) && !"unKnown".equalsIgnoreCase(XFor)){
	            //多次反向代理后会有多个ip值，第一个ip才是真实ip
	            int index = XFor.indexOf(",");
	            if(index != -1){
	                return XFor.substring(0,index);
	            }else{
	                return XFor;
	            }
	        }
	        XFor = Xip;
	        if(StringUtils.isNotEmpty(XFor) && !"unKnown".equalsIgnoreCase(XFor)){
	            return XFor;
	        }
	        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
	            XFor = request.getHeader("Proxy-Client-IP");
	        }
	        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
	            XFor = request.getHeader("WL-Proxy-Client-IP");
	        }
	        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
	            XFor = request.getHeader("HTTP_CLIENT_IP");
	        }
	        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
	            XFor = request.getHeader("HTTP_X_FORWARDED_FOR");
	        }
	        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
	            XFor = request.getRemoteAddr();
	        }
	        return XFor;
	}
	 /**
	 *  获取请求的用户信息组
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	 public Map<String,Object> GetReqMessage(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");//设置UTF-8
	     String uri = request.getRequestURI();//返回请求行中的资源名称
	     String url = request.getRequestURL().toString();//获得客户端发送请求的完整url
	     String ip =   getIpAddress(request);//返回发出请求的IP地址
	     String params = request.getQueryString();//返回请求行中的参数部分
	     String host=request.getRemoteHost();//返回发出请求的客户机的主机名
	     int port =request.getRemotePort();//返回发出请求的客户机的端口号。
	     Map<String,Object> map=new HashMap<String, Object>();
	     map.put("uri", uri);
	     map.put("url", url);
	     map.put("ip", ip);
	     map.put("params", params);
	     map.put("host", host);
	     return map;
	 }
	
	
	
	
}
