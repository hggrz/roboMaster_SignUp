package com.billie.biz;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: Sign_Up_Biz   
* @Description: 业务层(报名信息表)   
* @author yirenipeng 
* @date 2019年4月14日 下午3:53:05   
*
 */
public interface Sign_Up_Biz {

	/**
	 * 添加报名信息
	 * @param map
	 * @return
	 */
	public boolean add_SUP (Map<String,Object> map);
	
	/**
	 * 查询报名信息
	 * @param map
	 * @return
	 */
	public Map<String,Object> sel_Map (Map<String, Object> map);
	
	/**
	 * 查询单条报名信息
	 * @param map
	 * @return
	 */
	public Map<String,Object> find_data (Map<String, Object> map);
	
	
	
	/**
	 * 修改  报名信息
	 * @param map
	 * @return
	 */
	public boolean upd_data (Map<String, Object> map);
	
	/**
	 * 删除 报名信息
	 * @param map
	 * @return
	 */
	public boolean del_data (Map<String, Object> map);
	
	/**
	 * 修改  报名状态
	 * @param map
	 * @return
	 */
	public boolean upd_IsEnter (Map<String, Object> map);
}
