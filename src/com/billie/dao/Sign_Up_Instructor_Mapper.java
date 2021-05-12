package com.billie.dao;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: Sign_Up_Instructor_Mapper   
* @Description: 数据库持久层(指导老师信息表)   
* @author yi   
* @date 2021年1月4日 下午6:57:18   
*
 */


public interface Sign_Up_Instructor_Mapper {

	/**
	 * 添加 指导老师信息
	 * @param map
	 * @return
	 */
	public int add_SUIR(Map<String,Object> map);

	
	/**
	 * 查询 指导老师信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> find_data (Map<String, Object> map);

	
	
	/**
	 * 删除 指导老师信息
	 * @param map
	 * @return
	 */
	public int del_data (Map<String, Object> map);
	
}
