package com.billie.util;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
/**
 * 
* @ClassName: ControllerConfig   
* @Description: 路由控制配置共有属性   
* @author zhangfeng   
* @date 2018年6月28日 上午11:42:54   
*
 */
public class ControllerConfig {
	public Logger logger = Logger.getLogger(this.getClass());//log4j配置 
	public Gson gson=new Gson();
	public JSONObject json=new JSONObject();
}