package com.billie.dao;

import java.util.List;
import java.util.Map;

/**
 * 
 * @ClassName: Sys_Mapper   
 * @Description: 系统查询(处理系统加载等)   
 * @author zhangfeng
 * @date 2018年8月13日
 */
public interface Sys_Mapper {

	/**
	 * 获取菜单
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> load_Nav(String[] NAVID);
	/**
	 * 获取管理员权限可见菜单
	 * @param map
	 * @return
	 */
	public String get_Admin_muen(Map<String, Object> map);
	
	/**
	 * 获取通知
	 * @return
	 */
	public List<Map<String,Object>>getNotice();
	
	
	
	
}
