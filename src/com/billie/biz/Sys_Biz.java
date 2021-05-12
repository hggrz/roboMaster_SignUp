package com.billie.biz;

import java.util.List;
import java.util.Map;

/**
 * 
 * @ClassName: Sys_Biz   
 * @Description: 系统加载业务层()   
 * @author zhangfeng
 * @date 2018年8月13日
 */
public interface Sys_Biz {

	/**
	 * 加载菜单
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> loadMuen(Map<String, Object> map); 
	
	
	/**
	 * 获取系统通知
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> getNotice(); 
	
	
	
	
}
