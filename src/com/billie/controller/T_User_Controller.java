/**
 * 
 */
package com.billie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.billie.biz.T_User_Biz;
import com.billie.util.ControllerConfig;
import com.billie.util.GetMessageCode;
import com.billie.util.Email.EmailSend;

/**
 * 
* @ClassName: T_User_Controller   
* @Description: TODO(这里用一句话描述这个类的作用)   
* @author zhangfeng   
* @date 2019年4月13日 下午7:46:03   
*
 */

@Controller
@RequestMapping("/sa/user")
public class T_User_Controller extends ControllerConfig{
	@Resource(name="t_user_bizimpl")
	T_User_Biz tb;
	
	/**
	 * 用户登陆
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	@ResponseBody
	public String Login(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> rmap=new HashMap<String, Object>();
		try{
			Map<String, Object> params=new HashMap<String, Object>();//定义Map接受页面参数
			params.putAll(json.parseObject((String) map));//将页面参数传递至params Map中
				if(tb.Is_Email(params)==true) {//查询用户是否存在
					List<Map<String,Object>> Users=tb.Login(params);
					if(Users.size()!=0) {//如果找到匹配账户[登录成功]
						Map<String, Object> User=Users.get(0);
						HttpSession session= request.getSession();
						session.setAttribute("admin", User);//登录成功给session对象
						rmap.put("messages", true);//消息给true
					}else{
						rmap.put("messages", "密码错误！");
					}
				}else {rmap.put("messages", "未找到您的账号");}
		}catch(Exception e){
			logger.error(" 用户登陆异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(rmap);
	}
	
	
	/**
	 * 用户注册
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/registered.fx",method=RequestMethod.POST)
	@ResponseBody
	public String Registered(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> regmap=new HashMap<String, Object>();
		try {
			Map<String,Object> params = new HashMap<String,Object>();
			params.putAll(json.parseObject((String) map));//将页面参数传递至params Map中
			HttpSession session= request.getSession();
			
				boolean bool=tb.add(params);
				Object message=bool==true?bool:"注册失败";
				regmap.put("message", message);//打包注册结果
		} catch (Exception e) {
			logger.error("注册异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(regmap);
	} 
		
	
	
	
	/**
	 * 是否存在邮箱
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/Is_Email.fx",method=RequestMethod.POST)
	@ResponseBody
	public String Is_Email(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> amap=new HashMap<String, Object>();
		try {
			Map<String, Object> params=new HashMap<String, Object>();//定义Map接受页面参数
			params.putAll(gson.fromJson((String) map, Map.class));//将页面参数传递至params Map中
			amap.put("message", tb.Is_Email(params));
		} catch (Exception e) {
			logger.error("获取注册验证码异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(amap);
	}
	
	
	
	/**
	 * 注销用户信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Esc.do")
	public void Esc(HttpServletRequest request,HttpServletResponse response)throws Exception {
		HttpSession session= request.getSession();
		session.invalidate();//清除汇话对象
		//System.out.println("注销");
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
	
	/**
	 * 获取邮箱验证码
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/EmailV.fx", method = RequestMethod.POST)
	@ResponseBody
	public String EmailVerification(HttpServletRequest request, @RequestParam(value = "map") Object map) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.putAll(gson.fromJson((String) map, Map.class));
			Map<String, Object> Message=EmailSend.EmailVerification(params.get("RUR_Name").toString(), params.get("RUR_Email").toString());
			if((boolean) Message.get("bool")) {
				HttpSession session= request.getSession();
				session.setAttribute("EMailYz",params.get("RUR_Email").toString());//注册邮箱绑定
				session.setAttribute("EmailVCode",Message.get("random"));//注册成功返回给session对象
				res.put("Message", true);
			}else {
				res.put("Message", "您的邮箱无效请重新输入");
			}
		} catch (Exception e) {
			logger.error("获取邮箱验证码异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(res);
	}
	
	
	
	
	
}
