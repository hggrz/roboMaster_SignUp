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
import com.billie.dao.T_User_Mapper;
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


@Service(value="t_user_bizimpl")
public class T_User_Bizimpl implements T_User_Biz{
	@Resource(name="t_User_Mapper")
	private T_User_Mapper tu;
	

	@Override
	public List<Map<String,Object>> Login(Map<String, Object> map) {
		return tu.Login(map);
	}
	
	

	@Override
	@Transactional
	public boolean add(Map<String, Object> map) {
		boolean bool=false;
		try{
			bool=(tu.add(map)>0);
		}catch(Exception e){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();                                                                                   
        }
		return bool;
	}



	@Override
	public boolean Is_Email(Map<String, Object> map) {
		return (((Integer)tu.Is_Email(map))>0);
	}





}