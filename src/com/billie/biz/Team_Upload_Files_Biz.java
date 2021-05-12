package com.billie.biz;

import java.util.List;
import java.util.Map;

/**
 * 
* @ClassName: Team_Upload_Files_Biz   
* @Description: 业务层(队伍上传文件管理表)   
* @author zhangfeng   
* @date 2019年4月14日 下午6:32:51   
*
 */
public interface Team_Upload_Files_Biz {

	/**
	 * 新增上传文件
	 * @param map
	 * @return
	 */
	public boolean add(Map<String,Object> map);
	
	
	/**
	 * 下载文件是否是本人上传
	 * @param map
	 * @return
	 */
	public boolean Is_Ex(Map<String,Object> map);
	
	
	/**
	 * 查询已上传文件信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> find_data(Map<String,Object> map);
	
}
