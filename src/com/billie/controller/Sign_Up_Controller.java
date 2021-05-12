package com.billie.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.billie.biz.Sign_Up_Biz;
import com.billie.util.ControllerConfig;

/**
 * 
* @ClassName: Sign_Up_Controller   
* @Description: 路由层(报名信息表)   
* @author yirenipeng 
* @date 2019年4月14日 下午3:59:05   
*
 */


@Controller
@RequestMapping("/Ba/Sign")
public class Sign_Up_Controller extends ControllerConfig{

	@Resource(name="sign")
	Sign_Up_Biz Sub;
	
	/**
	 * 新增 报名信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/add_SUP.do",method=RequestMethod.POST)
	@ResponseBody
	public String add_SUP(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> mmp = new HashMap<String, Object>();
		try {
			Map<String, Object> amap = new HashMap<String, Object>();
			amap.putAll(json.parseObject((String) map));
			boolean add=Sub.add_SUP(amap);
			mmp.put("Message", add);
		} catch (Exception e) {
			logger.error("新增 报名信息 异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(mmp);
	}
	
	/**
	 * 报名信息查询
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/sel_Map.do",method=RequestMethod.POST)
	@ResponseBody
	public String sel_Map(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> rmp = new HashMap<String, Object>();
		try {
			Map<String, Object> prm = new HashMap<String, Object>();
			//获取用户ID
			HttpSession session= request.getSession();
			prm.put("SUP_Fill_In_Person_ID", ((Map<String, Object>)session.getAttribute("admin")).get("RUR_ID"));
			prm.putAll(json.parseObject((String) map));
			rmp.put("data", Sub.sel_Map(prm));
		} catch (Exception e) {
			logger.error(" 报名信息查异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(rmp);
	}
	
	/**
	 *  报名单条信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/find_data.do",method=RequestMethod.POST)
	@ResponseBody
	public String find_data(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> rmp = new HashMap<String, Object>();
		try {
			Map<String, Object> prm = new HashMap<String, Object>();
			prm.putAll(json.parseObject((String) map)); //定义Map 接收页面参数
			rmp.put("data", Sub.find_data(prm));
		} catch (Exception e) {
			logger.error(" 报名信息详情查询异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(rmp);
	}
	
	/**
	 * 修改 报名信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/upd_data.do",method=RequestMethod.POST)
	@ResponseBody
	public String upd_data(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> mmp = new HashMap<String, Object>();
		try {
			Map<String, Object> amap = new HashMap<String, Object>();
			amap.putAll(json.parseObject((String) map));
			boolean upd=Sub.upd_data(amap);
			mmp.put("Message", upd);
		} catch (Exception e) {
			logger.error("修改 报名信息异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(mmp);
	}
	
	/**
	 * 删除 报名信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/del_data.do",method=RequestMethod.POST)
	@ResponseBody
	public String del_data(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> mmp = new HashMap<String, Object>();
		try {
			Map<String, Object> amap = new HashMap<String, Object>();
			amap.putAll(json.parseObject((String) map));
			boolean del=Sub.del_data(amap);
			mmp.put("Message", del);
		} catch (Exception e) {
			logger.error("删除 报名信息异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(mmp);
	}
	
	/**
	 * 修改 报名状态
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/upd_IsEnter.do",method=RequestMethod.POST)
	@ResponseBody
	public String upd_IsEnter(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> mmp = new HashMap<String, Object>();
		try {
			Map<String, Object> amap = new HashMap<String, Object>();
			amap.putAll(json.parseObject((String) map));
			boolean upd=Sub.upd_IsEnter(amap);
			mmp.put("Message", upd);
		} catch (Exception e) {
			logger.error("修改 报名状态异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(mmp);
	}
	
	
}
