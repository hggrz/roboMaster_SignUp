package com.billie.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 
 * @ClassName: Commonly   
 * @Description: 常用集合判断(Util)   
 * @author zhangfeng
 * @date 2018年7月14日
 */
public class Commonly {
	/**
	 * 查看value忽略大小写是否在StrArr(数组)中，存在反回true否则false
	 * @param StrArrZz(正则数组)
	 * @param value(比较的值)
	 * @return
	 */
	public static boolean IsExistStrArr(List<String> StrArr,String value) {
		boolean bool=false;
		for (int i = 0; i < StrArr.size(); i++) {
			if(StrArr.get(i).equalsIgnoreCase(value)) {
				bool=true;
				break;
			}
		}
		return bool;
	}
	
	
	
	
}
