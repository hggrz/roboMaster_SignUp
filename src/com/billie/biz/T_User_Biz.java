/**
 * 
 */
package com.billie.biz;

import java.util.List;
import java.util.Map;

/**
 * com.billie.biz
 * sandsaero
 * @author 10492
 * T_User_Biz.java
 * 2018年8月2日下午1:25:52
 */
public interface T_User_Biz {

	/***
	 * 用户登陆
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> Login(Map<String, Object> map);
	/**
	 * 用户注册
	 * @param map
	 * @return
	 */
	public boolean add(Map<String,Object> map);
	
	/**
	 * 是否存在邮箱
	 * @param map
	 * @return
	 */
	public boolean Is_Email(Map<String, Object> map);
	
}
