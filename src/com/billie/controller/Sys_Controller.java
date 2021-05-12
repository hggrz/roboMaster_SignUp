package com.billie.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.billie.biz.Sys_Biz;
import com.billie.biz.Team_Upload_Files_Biz;
import com.billie.util.ControllerConfig;
import com.billie.util.SpringMvcUploadUtil;

/**
 * 
 * @ClassName: Sys_Controller   
 * @Description: 系统加载控制类()   
 * @author zhangfeng
 * @date 2018年8月13日
 */
@Controller
@RequestMapping("/Ba/Sys")
public class Sys_Controller extends ControllerConfig{
	
	@Resource(name="sys_load")
	Sys_Biz Sb;
	
	@Autowired
	SpringMvcUploadUtil Up;
	
	@Resource(name="tUFS_impl")
	Team_Upload_Files_Biz tUFS_impl;
	
	/**
	 * 加载菜单
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/loadMuen.ba",method=RequestMethod.POST)
	@ResponseBody
	public String loadMuen(HttpServletRequest request,@RequestParam(value="map")Object map){
		Map<String, Object> res=new HashMap<String, Object>();
		try{
			res.put("loadmuen", Sb.loadMuen(json.parseObject((String) map)));
		}catch(Exception e){
			logger.error("加载用户菜单异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(res);
	}
	
	
	
	/**
	 * 上传文件[压缩文件]
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/Upload_file.do",method=RequestMethod.POST)
	public ModelAndView Upload_file(HttpServletRequest request,@RequestParam(value ="obj")MultipartFile[] attachs,@RequestParam(value ="TUFS_Name")String TUFS_Name,
			@RequestParam(value ="TUFS_SUPID")String TUFS_SUPID,@RequestParam(value ="TUFS_Category")String TUFS_Category,
			@RequestParam(value ="SUP_School")String SUP_School) {
		ModelAndView mv=new ModelAndView();
		
		Map<String,Object> rmp = new  HashMap<String,Object>();
		String File_Folder= TUFS_Category.equals("参赛队员照片")?"Student_Photo":"Project_Attachment";
		try {
			String TailName=TUFS_Name;			//文件名
			String PreservationUrl="Sign_up_File/upload/"+File_Folder;//文件上传地址
			String []FilFormats={"rar","zip"};   		  		//允s许上传的文件格式
			Map<String, Object> res=Up.WriteImgs(attachs, TailName, PreservationUrl, FilFormats);
			Object Message="";
			if((Boolean) res.get("success")) {
				String fileUrl=((ArrayList<String>)res.get("Urls")).get(0);//获取文件路径
				fileUrl=fileUrl.replaceAll("\\\\", "/");
				//获取用户信息
				Map<String,Object> admin =  (Map<String, Object>) request.getSession().getAttribute("admin");
		      
				rmp.put("TUFS_Name", SUP_School+"_"+TUFS_Name+"_压缩包"); // 文件名称
				rmp.put("TUFS_Url", fileUrl); // 文件地址
				rmp.put("TUFS_SUPID", TUFS_SUPID); // 所属队伍编号
				rmp.put("TUFS_Category", TUFS_Category); // 文件类别
				rmp.put("TUFS_UpUserID", admin.get("RUR_ID")); // 文件上传用户ID
				
				//System.out.println("rmp = "+rmp);
				Message = tUFS_impl.add(rmp)==true?"上传文件成功！":"网络异常，请稍后重试。";
			}else {
				Message = res.get("Message").toString();
			}
			//System.out.println(Message);
			mv.addObject("Message",Message);
			mv.setViewName("upload_File");
		} catch (Exception e) {
			logger.error("上传文件[压缩文件]异常", e);
		}
		return mv;
	}
	
	
	/**
	 * 上传文件[PDF]
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/Upload_file_PDF.do",method=RequestMethod.POST)
	public ModelAndView Upload_file_PDF(HttpServletRequest request,@RequestParam(value ="obj")MultipartFile[] attachs,@RequestParam(value ="TUFS_Name")String TUFS_Name,
			@RequestParam(value ="TUFS_SUPID")String TUFS_SUPID,@RequestParam(value ="TUFS_Category")String TUFS_Category,
			@RequestParam(value ="SUP_School")String SUP_School) {
		ModelAndView mv=new ModelAndView();
		
		Map<String,Object> rmp = new  HashMap<String,Object>();
		String File_Folder= TUFS_Category.equals("参赛队员照片")?"Student_Photo":"Project_Attachment";
		try {
			String TailName=TUFS_Name;			//文件名
			String PreservationUrl="Sign_up_File/upload/"+File_Folder;//文件上传地址
			String []FilFormats={"pdf"};   		  		//允s许上传的文件格式
			Map<String, Object> res=Up.WriteImgs(attachs, TailName, PreservationUrl, FilFormats);
			Object Message="";
			if((Boolean) res.get("success")) {
				String fileUrl=((ArrayList<String>)res.get("Urls")).get(0);//获取文件路径
				fileUrl=fileUrl.replaceAll("\\\\", "/");
				//获取用户信息
				Map<String,Object> admin =  (Map<String, Object>) request.getSession().getAttribute("admin");
				
				rmp.put("TUFS_Name", SUP_School+"_"+TUFS_Name+"_申报书"); // 文件名称
				rmp.put("TUFS_Url", fileUrl); // 文件地址
				rmp.put("TUFS_SUPID", TUFS_SUPID); // 所属队伍编号
				rmp.put("TUFS_Category", TUFS_Category); // 文件类别
				rmp.put("TUFS_UpUserID", admin.get("RUR_ID")); // 文件上传用户ID
				rmp.put("SUP_IsEnter", "等待区审核"); // 更新报名状态
				rmp.put("SUP_ID", TUFS_SUPID); // 更新报名状态 ID
				
				//System.out.println("rmp = "+rmp);
				Message = tUFS_impl.add(rmp)==true?"上传文件成功！":"网络异常，请稍后重试。";
			}else {
				Message = res.get("Message").toString();
			}
			//System.out.println(Message);
			mv.addObject("Message",Message);
			mv.setViewName("upload_File");
		} catch (Exception e) {
			logger.error("[PDF]异常", e);
		}
		return mv;
	}
	
	
	
	
	/**
	 * 查询已上传文件信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/find_data.do",method=RequestMethod.POST)
	@ResponseBody
	public String find_data(HttpServletRequest request,@RequestParam(value="map")Object map) {
		Map<String, Object> amap=new HashMap<String, Object>();
		try {
			Map<String, Object> params=new HashMap<String, Object>();//定义Map接受页面参数
			params.putAll(json.parseObject((String) map));//将页面参数传递至params Map中
			//获取用户ID
			HttpSession session= request.getSession();
			params.put("TUFS_UpUserID", ((Map<String, Object>)session.getAttribute("admin")).get("RUR_ID"));
			amap.put("data", tUFS_impl.find_data(params));
		} catch (Exception e) {
			logger.error("查询已上传文件信息异常", e);
			return "网络繁忙,请稍后重试";
		}
		return gson.toJson(amap);
	}
	
	
	/**
	 * 下载文件
	 * @param type
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/download.do")
	public void readImage(HttpServletRequest request, HttpServletResponse response){
        String fileName = request.getParameter("Url");
        if(fileName == null || fileName.equals("")){
            return;
        }
        //下载文件时需确定文件上传人与下载用户session一致
        HttpSession session= request.getSession();
       // System.out.println(session.getAttribute("admin"));
        
        
      /*  System.out.println("fileName  -  "+fileName);
       try {
    	   fileName = new String(fileName.getBytes("iso-8859-1"), "utf-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
       System.out.println("fileName  -  "+fileName);*/
        
		Map<String,Object> rmp = new  HashMap<String,Object>();
		rmp.put("TUFS_Url", fileName);
		rmp.put("TUFS_UpUserID", ((Map<String, Object>)session.getAttribute("admin")).get("RUR_ID"));
		//查询是否本人上传文件
        if(tUFS_impl.Is_Ex(rmp)==false) {
        	return;
        }
        
        
        String browser = "";
        int leg= fileName.lastIndexOf("/");
		//System.out.println(fileName.substring(leg+1,fileName.length()));
		String File_name =  fileName.substring(leg+1,fileName.length());
         try {
             browser = request.getHeader("User-Agent");
             if (-1 < browser.indexOf("MSIE 6.0") || -1 < browser.indexOf("MSIE 7.0")) {
                // IE6, IE7 浏览器
                response.addHeader("content-disposition", "attachment;filename="
                        + new String(File_name.getBytes(), "ISO8859-1"));
            } else if (-1 < browser.indexOf("MSIE 8.0")) {
                // IE8 
                response.addHeader("content-disposition", "attachment;filename="
                        + URLEncoder.encode(File_name, "UTF-8"));
            } else if (-1 < browser.indexOf("MSIE 9.0")) {
                // IE9
               response.addHeader("content-disposition", "attachment;filename="
                       + URLEncoder.encode(File_name, "UTF-8"));
            } else if (-1 < browser.indexOf("Chrome")) {
                // 谷歌
                response.addHeader("content-disposition",
                        "attachment;filename*=UTF-8''" + URLEncoder.encode(File_name, "UTF-8"));
            } else if (-1 < browser.indexOf("Safari")) {
                // 苹果
                response.addHeader("content-disposition", "attachment;filename="
                        + new String(File_name.getBytes(), "ISO8859-1"));
            } else {
                // 火狐或者其他的浏览器
                response.addHeader("content-disposition",
                        "attachment;filename*=UTF-8''" + URLEncoder.encode(File_name, "UTF-8"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        File cat=new File(System.getProperty("catalina.home"));
		String path = cat.getParent();
        String imagePath =  path + fileName;
        try{
            if(imagePath != null){
                File file = new File(imagePath);
                if (file.exists()) {
                    DataOutputStream temps = new DataOutputStream(response
                            .getOutputStream());
                    DataInputStream in = new DataInputStream(
                            new FileInputStream(imagePath));
                    byte[] b = new byte[2048];
                    while ((in.read(b)) != -1) {
                        temps.write(b);
                    }
                    temps.flush();
                    in.close();
                    temps.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	
}
