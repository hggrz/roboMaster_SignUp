package com.billie.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * 
 * @ClassName:  GetMessageCode
 * @Description:发送验证码
 * @author yirenipeng
 * @data 2018年8月3日 下午8:23:25
 *
 */
public class GetMessageCode {

	private static final String QUERY_PATH="https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	private static  String ACCOUNT_SID ="9f9540e717e34dfab1d4208d470e4cbd";
	private static  String AUTH_TOKEN ="f99a486fd5d046708cedf0c7f1e92d51";
	private static  String tamp ="";
	//读取短信接口的 API接口
	/*static{
		Properties prop=new Properties();
		//读取短信配置文件ShortMessage.properties
		InputStream is=GetMessageCode.class.getClassLoader().
		getResourceAsStream("ShortMessage.properties");
		try {
			prop.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//初始化BaseDao属性值
		ACCOUNT_SID=prop.getProperty("ACCOUNT_SID");  
		AUTH_TOKEN=prop.getProperty("AUTH_TOKEN");
		tamp=prop.getProperty("message");
		
	}*/
	
	
	
	
	//根据相应的手机号发送验证码
	public static String getCode(String phone) throws JSONException{
		/*System.out.println(ACCOUNT_SID);
		System.out.println(AUTH_TOKEN);
		System.out.println(tamp);*/
		
		String rod=smsCode();
		//System.out.println("验证码:"+rod);
		String timestamp=getTimestamp();  //获得时间
		String sig=getMD5(ACCOUNT_SID,AUTH_TOKEN,timestamp);
		//System.out.println("sig"+sig);
		tamp="【啸驭航空】您的验证码为"+rod+" ，请于2分钟内正确输入，如非本人操作，请忽略此短信。";
		OutputStreamWriter out=null;
		BufferedReader br=null;
		StringBuilder result=new StringBuilder();
		try {
			URL url=new URL(QUERY_PATH);
			HttpURLConnection connection=(HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoInput(true);//设置是否允许数据写入
			connection.setDoOutput(true);//设置是否允许参数数据输出
			connection.setConnectTimeout(5000);//设置链接响应时间
			connection.setReadTimeout(10000);//设置参数读取时间
			connection.setRequestProperty("Content-type","application/x-www-form-urlencoded");			
			//提交请求
			out=new OutputStreamWriter(connection.getOutputStream(),"UTF-8");
			String args=getQueryArgs(ACCOUNT_SID, tamp, phone, timestamp, sig, "JSON");
			out.write(args);
			out.flush();
			//读取返回参数
			br=new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
			String temp="";
			while((temp=br.readLine())!=null){
				result.append(temp);
			}
		} catch (Exception e) {
			System.out.println("短信一异常");
			e.printStackTrace();
		}
		JSONObject json=new JSONObject(result.toString());
		String respCode=json.getString("respCode");
		String defaultRespCode="00000";
		if(defaultRespCode.equals(respCode)){
			 return rod;
		}else{
			return defaultRespCode;			
		}
	}
	//定义一个请求参数拼接方法
	public static String getQueryArgs(String accountSid,String smsContent,String to,String timestamp,String sig,String respDataType){
		return "accountSid="+accountSid+"&smsContent="+smsContent+"&to="+to+"&timestamp="+timestamp+"&sig="+sig+"&respDataType="+respDataType;
	}
	//获取时间戳
	public static String getTimestamp(){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	//sing签名
	public static String getMD5(String sid,String token,String timestamp){
		
		StringBuilder result=new StringBuilder();
		String source=sid+token+timestamp;
		//获取某个类的实例
				try {					
				   MessageDigest digest=MessageDigest.getInstance("MD5");
				   //要进行加密的东西
				   byte[] bytes=digest.digest(source.getBytes());
				   for(byte b:bytes){
					   String hex=Integer.toHexString(b&0xff);
					   if(hex.length()==1){
						   result.append("0"+hex);
					   }else{
						   result.append(hex);
					   }
				   }
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				} 
		return result.toString();
	}
	//创建验证码
	public static String smsCode(){
		String random=(int)((Math.random()*9+1)*100000)+"";		
		return random;
	}
	public static void main(String[] args) throws JSONException {
		GetMessageCode.getCode("17375829235");
	}
}
