package com.project.bangpool.freshmanmateboard.model.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

@Service("mailService")
public class MailServiceImpl implements MailService{

	@Autowired 
	private JavaMailSender javaMailSender;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender=javaMailSender;
	}
	
	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		boolean check = false;
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			
			javaMailSender.send(message);
			
			check = true;
			
		}catch (javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("check : " + check);
		return check;
		
	}

}
