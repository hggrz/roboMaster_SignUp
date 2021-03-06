package com.billie.util.Email;

import java.util.Date;


/**
 * 
 * @ClassName: MimeMessageDTO   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author zhangfeng
 * @date 2018年8月28日
 */
public class MimeMessageDTO {
	/**   
	 * 变量名 subject: TODO 邮件标题
	 */   
	private String subject;
	
	/**   
	 * 变量名 sentDate: TODO 邮件日期
	 */   
	private Date sentDate;
	
	/**   
	 * 变量名 text: TODO 邮件内容
	 */   
	private String text;

	/** 
	 * 方法名: initMimeMessage 
	 * 功能描述: TODO 初始化
	 * @param: @param subject
	 * @param: @param date
	 * @param: @param text
	 * @param: @return  
	 * @return: MimeMessageDTO 
	 */
	public MimeMessageDTO initMimeMessage(String subject, Date date, String text) {
		return new MimeMessageDTO(subject, date, text);
	}
	
	public MimeMessageDTO() {
		super();
	}

	public MimeMessageDTO(String subject, Date sentDate, String text) {
		super();
		this.subject = subject;
		this.sentDate = sentDate;
		this.text = text;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getSentDate() {
		return sentDate;
	}

	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
