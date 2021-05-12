package com.billie.dao;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: Sign_Up_Details_Mapper   
* @Description: 数据库持久层(报名信息详情表)   
* @author yirenipeng 
* @date 2019年4月14日 下午4:47:10   
*
 */

public interface Sign_Up_Details_Mapper {
	
	/**
	 * 添加报名信息详情信息
	 * @param map
	 * @return
	 */
	public int add_SUDS(Map<String,Object> map);

	
	/**
	 * 查询报名信息详情信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> find_data (Map<String, Object> map);

	
	
	/**
	 * 删除 报名信息详情信息
	 * @param map
	 * @return
	 */
	public int del_data (Map<String, Object> map);
}
