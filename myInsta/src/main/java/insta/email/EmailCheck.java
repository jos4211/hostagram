package insta.email;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class qweqe
 */
@WebServlet("/send")
public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("입장");
		String host = "smtp.naver.com";  // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String user = "jos881@naver.com"; 
		// 패스워드 
		final String password = "whdhrtkd0404!";      
		// SMTP 서버 정보를 설정한다. 
		Properties props = new Properties(); 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true"); 
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password); 
				} 
			}); 
		try { 
			String email = request.getParameter("email"); 
			MimeMessage message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(user)); 
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 
			// 메일 제목
			message.setSubject("호스타그램 인증 번호"); 
			// 메일 내용 
			String code = request.getParameter("code");
			message.setText(String.valueOf("코드 번호 ["+code+"]"));
			// send the message 
			Transport.send(message); 
			System.out.println("Success Message Send"); 
			} catch (MessagingException e) { 
				e.printStackTrace(); 
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
