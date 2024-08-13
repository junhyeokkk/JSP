<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 기본정보
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String appPass = "racr ltkn edhm ibvf"; //Google 앱 비밀번호
	
	// gmail SMTP 설정 (서버 - 이메일 프로토콜)
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "465");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	// gmail session 생성
	Session gmailSession = Session.getInstance(props, new Authenticator(){
		
		@Override
		protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(sender, appPass);
		}
	});
	
	// 메일 발송
	Message message = new MimeMessage(gmailSession);
	try{
		message.setFrom(new InternetAddress(sender, "보내는사람", "UTF-8"));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		message.setSubject(title);
		message.setContent(content, "text/html;charset=utf-8");
	
		Transport.send(message);
	}catch(Exception e){
		e.printStackTrace();
	}
	// 이메일 입력 폼 이동
	response.sendRedirect("../3.emailTest.jsp");
	
%>