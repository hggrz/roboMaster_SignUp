package com.billie.bizimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.billie.biz.Sys_Biz;	
import com.billie.dao.Sys_Mapper;

/**
 * 
 * @ClassName: Sys_bizImpl   
 * @Description: 系统加载业务层()   
 * @author zhangfeng
 * @date 2018年8月13日
 */
@Service("sys_load")
public class Sys_bizImpl implements Sys_Biz{

	@Resource(name="sys_Mapper")
	private Sys_Mapper Sm;
	@Override
	public List<Map<String, Object>> loadMuen(Map<String, Object> map) {
		return Sm.load_Nav(Sm.get_Admin_muen(map).split(","));
	}
	@Override
	public List<Map<String, Object>> getNotice() {
		return Sm.getNotice();
	}
	
	
	
}
