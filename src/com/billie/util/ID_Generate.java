package com.billie.util;

import java.util.ArrayList;
import java.util.List;


/**
 * 
* @ClassName: ID_Generate   
* @Description: ID生成器(这里用一句话描述这个类的作用)   
* @author zhangfeng   
* @date 2018年12月14日 上午9:59:42   
*
 */
public class ID_Generate {
	
	/**
	 *  生成单个id编号
	 * @param Area 区县
	 * @param Project 项目
	 * @param TIO_Group 组别
	 * @param ct 当天数据数量
	 * @param leng 生成编号位数
	 * @return
	 */
	public static String G_id(String Area,String Project,Integer ct,int leng,String TIO_Group) {
		
		String t_name ="AI_";
		
		t_name =  TIO_Group.equals("小学组")?t_name+"A":t_name;//小学组
		t_name =  TIO_Group.equals("初中组")?t_name+"B":t_name;//初中组
		t_name =  TIO_Group.equals("高中组")?t_name+"C":t_name;//高中组
		
		ct=ct+1;
		String ID="";
		for (int i = 0; i < (leng-(ct.toString()).length()); i++) {
			ID+="0";
		}
		ID=ID+ct;//编号
		return t_name+ID;		
	}
	
	/**
	 *  生成单个id编号
	 * @param TIO_Group 组别
	 * @param ct 当天数据数量
	 * @param leng 生成编号位数
	 * @param ID_COUNT 生成多少个编号
	 * @return
	 */
	public static List G_id(Integer ct,int leng,int ID_COUNT,String TIO_Group) {
		List<String> olist=new ArrayList<String>();
		String t_name ="AI_";
		t_name =  TIO_Group.equals("小学组")?t_name+"A":t_name;//小学组
		t_name =  TIO_Group.equals("初中组")?t_name+"B":t_name;//初中组
		t_name =  TIO_Group.equals("高中组")?t_name+"C":t_name;//高中组
		
		for (int j = 0; j < ID_COUNT; j++) {
			ct=ct+1;
			String ID="";
			for (int i = 0; i < (leng-(ct.toString()).length()); i++) {
				ID+="0";
			}
			ID=ID+ct;//编号
			olist.add(t_name+ID);
		}
		
		return olist;		
	}
	
	public static void main(String[] args) {
		List<String> olist=ID_Generate.G_id( 0, 3, 101,"小学组");
		for (int i = 0; i < olist.size(); i++) {
			System.out.println(olist.get(i));
		}
	}
}
