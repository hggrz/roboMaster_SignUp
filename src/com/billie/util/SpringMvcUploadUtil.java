package com.billie.util;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


import sun.misc.BASE64Decoder;
/**
 * 
 * @ClassName: SpringMvcUploadImageUtil   
 * @Description: 上传图片的一个帮助类(这里用一句话描述这个类的作用)   
 * @author zhangfeng
 * @date 2018年8月15日
 */
@Component 
public class SpringMvcUploadUtil {
	
	/**
	 * 上传一组文件
	 * @param session
	 * @param request
	 * @param attachs
	 * @param TailName(尾部名)
	 * @param PreservationUrl(文件保存路径)
	 * @param FilFormats(允许传入文件格式)
	 * @return Map{success:上传是否成功,Urls:文件路径地址}
	 */
	public  Map<String,Object> WriteImgs( MultipartFile[] attachs,String TailName,String PreservationUrl,String... FilFormats){
		Map<String,Object> rmap=new HashMap<String,Object>();//返回信息
		boolean bool=true;
		ArrayList<String> Urls=new ArrayList<String>();
		String idPicPath = null;
		String fileName  = null;
		File cat=new File(System.getProperty("catalina.home"));//tomcat 路径
		String FileUrl=cat.getParent();//获取
		String path = FileUrl+"/"+PreservationUrl;//拼接上传路径
		//System.out.println("path - "+path);
		String Message = "";//信息
		for (int i = 0; i < attachs.length; i++) {
			
			//System.out.println("Size    -   "+attachs[i].getSize());
			
			//判断文件是否为空
			if(!attachs[i].isEmpty()){
				String oldFileName = attachs[i].getOriginalFilename();//原文件名
				String prefix=FilenameUtils.getExtension(oldFileName);//原文件后缀     
				int filesize = 3145728;
		        if(attachs[i].getSize() >  filesize){//上传大小不得超过 10M
		        	bool=false;
		        	Message = "上传文件大小不得超过 3M";
		        	//System.out.println( " * 上传大小不得超过 10M");
	            }else if(IsExistence(prefix, FilFormats)){//上传图片格式不正确
	            	fileName= TailName+"."+prefix;  
	                File targetFile = new File(path, fileName);  
	                if(!targetFile.exists()){  
	                    targetFile.mkdirs();  
	                }  
	                //保存  
	                try {  
	                	attachs[i].transferTo(targetFile);  
	                } catch (Exception e) {  
	                    e.printStackTrace();  
	                    bool=false;
	                    Message = "上传失败！";
	                    //System.out.println( " * 上传失败！");
	                }  
	                idPicPath = path+"/"+File.separator+fileName;
	            }else{
	            	bool=false;
	            	Message = "上传文件格式不正确！";
	            	//System.out.println( " * 上传图片格式不正确");
	            }
			}	
			Urls.add("/"+PreservationUrl+"/"+fileName);//保存文件路径
	}
		rmap.put("success", bool);
		rmap.put("Urls", Urls);
		rmap.put("Message", Message);
		return rmap;
	}
		
	public boolean IsExistence(String suffix,String... Filsuffix){
		boolean bool=false;
		for (int i = 0; i < Filsuffix.length; i++) {
			bool=Filsuffix[i].equalsIgnoreCase(suffix);
			if(bool){break;} 
		}
		return bool;
	}
	
	/**
     * base64字符串转换为图片，并保存
     * @Description
     * @Param
     * @Return
     */
    public static boolean base64CodeToimage(String basee64code,String url) {
    	boolean bool =true;
        BASE64Decoder bd = new BASE64Decoder();
        try {
            File file = new File(url);
            mkdirsmy(file);//创建文件夹
            FileOutputStream fo = new FileOutputStream(file);
            fo.write(bd.decodeBuffer(basee64code));
            fo.flush();
            fo.close();
        } catch (IOException e) {        
            bool =false;
        }
        return bool;
    }
	
    /**
     * 64位图片上传【单张图片】
     * @param params 传入map参数
     * @param key 需求取出的img src 的key
     * @param path 文件io地址
     * @param PreservationUrl 文件相对位置
     * @return
     */
	public static Map<String,Object> Upload_Img(Map params,String key,String path,String PreservationUrl) {
		if(params.get(key)!=null) {//如果用户上传了图片
			//拿到base64的字符串数组
            //解析并保存备注图片
            String uuid = UUID.randomUUID().toString();//生成ID
            String prefix=((params.get(key).toString().split(",")[0]).split("/")[1]).split(";")[0];//获取文件后缀名
            String FILe=params.get(key).toString().split(",")[1];//获取文件内容
            String url="";
            if(SpringMvcUploadUtil.base64CodeToimage(FILe, path+uuid+"."+prefix)) {//写入文件
            	url=PreservationUrl+uuid+"."+prefix;//添加图片相对路径
            }
            params.put(key,url);//最后将URlList赋值imageFil
		}
		return params;
	}
	
	
	
	
	/**
     * 64位图片上传【一组图片】
     * @param params 传入map参数
     * @param key 需求取出的img src 的key
     * @param path 文件io地址
     * @param PreservationUrl 文件相对位置
     * @return
     */
	public static Map<String,Object> Upload_Img_Arr(Map params,String key,String path,String PreservationUrl) {
		if(params.get("imageFil")!=null) {//如果用户上传了图片上传图片
            List<Map<String,Object>> array = (List<Map<String, Object>>) params.get(key);
            ArrayList<String> Urls=new ArrayList<String>();//图片路径数组
            //解析并保存备注图片
            for (int i = 0; i < array.size(); i++) {
            	Map<String,Object> img=array.get(i);
                String uuid = UUID.randomUUID().toString();//生成ID
                String prefix=((img.get("src").toString().split(",")[0]).split("/")[1]).split(";")[0];//获取文件后缀名
                String FILe=img.get("src").toString().split(",")[1];//获取文件内容
                if(SpringMvcUploadUtil.base64CodeToimage(FILe, path+uuid+"."+prefix)) {//写入文件
                	Urls.add(PreservationUrl+uuid+"."+prefix);//添加图片相对路径
                }
            }
            Urls=Urls.size()==0?null: Urls;//用户没有上传图片时赋值null
            params.put(key,Urls);//最后将URlList赋值imageFil
		}
		return params;
	}
	
	
	
	
	/**判断路径是否存在，否：创建此路径
	 * @param dir  文件路径
	 * @param realName  文件名
	 * @throws IOException 
	 */
	public static File mkdirsmy(File file) throws IOException{
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		return file;
	}
}
