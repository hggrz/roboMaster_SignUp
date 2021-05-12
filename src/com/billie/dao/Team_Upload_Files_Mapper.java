package com.billie.dao;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: Team_Upload_Files_Mapper   
* @Description: 数据持久层(队伍上传文件管理表)   
* @author zhangfeng   
* @date 2019年4月14日 下午6:29:24   
*
 */
public interface Team_Upload_Files_Mapper {

	/**
	 * 新增上传文件
	 * @param map
	 * @return
	 */
	public int add(Map<String,Object> map);
	
	
	
	/**
	 * 下载文件是否是本人上传
	 * @param map
	 * @return
	 */
	public int Is_Ex(Map<String,Object> map);
	
	
	/**
	 * 查询最新已上传文件路径 
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> find_data(Map<String,Object> map);
	
	
	/**
	 *  上传文件时删除本人已有类型文件
	 * @param map
	 * @return
	 */
	public int DEL_ISEX(Map<String,Object> map);
	
}
