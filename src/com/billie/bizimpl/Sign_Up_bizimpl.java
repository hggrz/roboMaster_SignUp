package com.billie.bizimpl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.billie.biz.Sign_Up_Biz;
import com.billie.dao.Sign_Up_Details_Mapper;
import com.billie.dao.Sign_Up_Instructor_Mapper;
import com.billie.dao.Sign_Up_Mapper;
import com.billie.util.PageUtil;

/**
 * 
* @ClassName: Sign_Up_bizimpl   
* @Description: 业务实现层(报名信息表)   
* @author yirenipeng 
* @date 2019年4月14日 下午3:54:20   
*
 */

@Service("sign")
public class Sign_Up_bizimpl implements Sign_Up_Biz{

	@Resource(name="sign_Up_Mapper")
	private Sign_Up_Mapper Sum;
	
	@Resource(name="sign_Up_Details_Mapper")
	private Sign_Up_Details_Mapper Suds;
	
	@Resource(name="sign_Up_Instructor_Mapper")
	private Sign_Up_Instructor_Mapper Suis;
	
	@Override
	public boolean add_SUP(Map<String, Object> map) {
		boolean bool = false,add_bool =false,add_arr = false,add_ISarr = false;
		Map<String, Object> SUP_map = (Map<String, Object>) map.get("SUP_map");
		//查询组别现有数量
		Integer COUNT = Sum.sel_count(SUP_map);
		COUNT = COUNT!=null?COUNT:0;
		COUNT = COUNT+1;
		String Ct = COUNT.toString();
		String zero = "";
		for (int i = Ct.length(); i < 3; i++) {
			zero += "0";
		}
		 Ct =zero+Ct;
		// System.out.println("Ct  -   "+Ct);
		String SUP_Registration_Number = SUP_map.get("SUP_Registration_Number").toString();//获取队伍编号前缀
		SUP_Registration_Number = SUP_Registration_Number+Ct;//拼接队伍编号
		SUP_map.put("SUP_Registration_Number", SUP_Registration_Number);//赋值 队伍编号
		
		//新增 报名信息
		add_bool = (((Integer)Sum.add_SUP(SUP_map))>0);
		
		map.put("SUP_ID", SUP_map.get("SUP_ID"));//赋值报名信息ID
		
		add_arr = (((Integer)Suds.add_SUDS(map))>0);//新增 队员信息
		
		add_ISarr = (((Integer)Suis.add_SUIR(map))>0);//新增 指导老师信息
		if(add_bool==true && add_arr==true && add_ISarr==true) {
			bool=true;
		}
		return bool;
	}

	@Override
	public Map<String, Object> sel_Map(Map<String, Object> map) {
		Map<String, Object> omp=new HashMap<String, Object>();
		Integer Curr=map.get("Curr")!=null?Integer.parseInt(map.get("Curr").toString()):0;
		Integer PageSize=map.get("PageSize")!=null?Integer.parseInt(map.get("PageSize").toString()):10;
		Integer COUNT= Sum.sel_Map_COUNT(map);
 		COUNT=COUNT!=null?COUNT:0;
		PageUtil pu=new PageUtil(COUNT,Curr , PageSize);//初始化分页工具类
		//数据打包
		map.put("StarRow", pu.getStarRow());
		map.put("PageSize", pu.getPageSize());
		omp.put("Pu", pu);
		omp.put("Data", Sum.sel_Map(map));
		return omp;
	}

	@Override
	public Map<String, Object> find_data(Map<String, Object> map) {
		Map<String, Object> mmp = new HashMap<String, Object>();
		mmp.put("SUP_map", Sum.find_data(map)); // 报名信息
		mmp.put("SUDS_arr", Suds.find_data(map)); // 参赛队员信息
		mmp.put("SUIR_arr", Suis.find_data(map)); // 指导老师信息
		return mmp;
	}



	@Override
	public boolean upd_data(Map<String, Object> map) {
		boolean bool = false,upd_bool =false,upd_arr = false,upd_ISarr = false;
		Map<String, Object> SUP_map = (Map<String, Object>) map.get("SUP_map");
		
		//修改报名信息
		upd_bool = (((Integer)Sum.upd_data(SUP_map))>0);
		
		Suds.del_data(map); //添加时先 删除报名详情信息
		Suis.del_data(map); //添加时先 删除指导老师信息
		
		upd_arr = (((Integer)Suds.add_SUDS(map))>0); //添加参赛队伍信息
		
		upd_ISarr = (((Integer)Suis.add_SUIR(map))>0); //添加 指导老师信息
		if(upd_bool==true && upd_arr==true && upd_ISarr==true) {
			bool=true;
		}
		return bool;
	}



	@Override
	public boolean del_data(Map<String, Object> map) {
		boolean bool = false,del_bool =false,del_arr = false,del_ISarr = false;
		del_bool = (((Integer)Sum.del_data(map))>0);
		del_arr = (((Integer)Suds.del_data(map))>0);//删除参赛队伍信息
		del_ISarr = (((Integer)Suis.del_data(map))>0);//删除 指导老师信息
		if(del_bool==true && del_arr==true && del_ISarr==true) {
			bool=true;
		}
		return bool;
	}

	@Override
	public boolean upd_IsEnter(Map<String, Object> map) {
		return (((Integer)Sum.upd_IsEnter(map))>0);
	}


}
