/**
 * 
 */
package com.billie.dao;

import java.util.List;
import java.util.Map;

/**
 * com.billie.dao
 * sandsaero
 * @author 10492
 * T_User_Mapper.java
 * 2018年8月2日上午9:13:43
 */
public interface T_User_Mapper {

	/***
	 * 用户登陆
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> Login(Map<String,Object> map);
	
	/**
	 * 用户注册
	 * @param map
	 * @return
	 */
	public int add(Map<String,Object> map);
	
	/**
	 * 是否存在邮箱
	 * @param map
	 * @return
	 */
	public int Is_Email(Map<String,Object> map);
	
	
	
	
}
