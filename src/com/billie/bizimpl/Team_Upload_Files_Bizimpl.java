/**
 * 
 */
package com.billie.bizimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.billie.biz.T_User_Biz;
import com.billie.biz.Team_Upload_Files_Biz;
import com.billie.dao.Sign_Up_Mapper;
import com.billie.dao.T_User_Mapper;
import com.billie.dao.Team_Upload_Files_Mapper;
import com.billie.util.Md5Util;
import com.billie.util.My_RandomUtil;
import com.billie.util.PageUtil;

/**
 * 
* @ClassName: T_User_Bizimpl   
* @Description: 业务实现类(报名用户表)   
* @author zhangfeng   
* @date 2019年4月13日 下午8:03:10   
*
 */

@Service(value="tUFS_impl")
public class Team_Upload_Files_Bizimpl implements Team_Upload_Files_Biz{
	
	@Resource(name="team_Upload_Files_Mapper")
	private Team_Upload_Files_Mapper Tupload;
	
	@Resource(name="sign_Up_Mapper")
	private Sign_Up_Mapper SUP;
	
	

	@Override
	public boolean add(Map<String, Object> map) {
		Tupload.DEL_ISEX(map);//上传文件时删除本人已有类型文件
		SUP.upd_IsEnter(map);//修改  申报未完成
		return (((Integer)Tupload.add(map))>0);
	}

	@Override
	public boolean Is_Ex(Map<String, Object> map) {
		return (((Integer)Tupload.Is_Ex(map))>0);
	}

	@Override
	public List<Map<String,Object>> find_data(Map<String, Object> map) {
		return Tupload.find_data(map);
	}
	



}