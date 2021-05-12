package com.billie.dao;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: Sign_Up_Mapper   
* @Description: 数据库持久层(报名表)   
* @author yirenipeng 
* @date 2019年4月14日 下午3:22:30   
*
 */
public interface Sign_Up_Mapper {
	
	/**
	 * 添加报名信息表数据
	 * @param map
	 * @return
	 */
	public int add_SUP(Map<String,Object> map);

	/**
	 * 查询报名信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> sel_Map (Map<String, Object> map);

	
	
	/**
	 * 查询报名信息 总数
	 * @param map
	 * @return
	 */
	public Integer sel_Map_COUNT (Map<String, Object> map);
	
	
	/**
	 * 查询单条报名信息 
	 * @param map
	 * @return
	 */
	public Map<String, Object> find_data (Map<String, Object> map);

	
	/**
	 * 修改报名信息
	 * @param map
	 * @return
	 */
	public int upd_data (Map<String, Object> map);
	
	/**
	 * 删除 报名信息
	 * @param map
	 * @return
	 */
	public int del_data (Map<String, Object> map);
	
	/**
	 * 查询组别现有数量
	 * @param map
	 * @return
	 */
	public Integer sel_count (Map<String, Object> map);

	
	/**
	 * 修改  申报未完成
	 * @param map
	 * @return
	 */
	public int upd_IsEnter (Map<String, Object> map);
	
	
}
