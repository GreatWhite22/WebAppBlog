package webappblog;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class Email extends HttpServlet{
	public static ArrayList<Subscribe> listofsubscribers = new ArrayList<Subscribe>();
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  ListIterator<Subscribe> subscribers = listofsubscribers.listIterator();
	  while(subscribers.hasNext()){
		  Subscribe subscriber = subscribers.next();
	      // Recipient's email ID needs to be mentioned.
	      String to = subscriber.getEmailAddress();
	 
	      // Sender's email ID needs to be mentioned
	      String from = "connorlewis22@gmail.com";
	 
	      // Assuming you are sending email from localhost
	      String host = "http://1-dot-webblog-143719.appspot.com";
	 
	      // Get system properties
	      Properties properties = System.getProperties();
	 
	      // Setup mail server
	      properties.setProperty("mail.smtp.host", host);
	 
	      // Get the default Session object.
	      Session session = Session.getDefaultInstance(properties);
	      
		  // Set response content type
	      response.setContentType("text/html");
	      PrintWriter out = response.getWriter();
	
	      try{
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);
	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));
	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));
	         // Set Subject: header field
	         message.setSubject("Daily Update of Connor and Steven's Blog");
	         // Now set the actual message
	         message.setText("Hello " + subscriber.getFirstName() + " " + subscriber.getLastName() + ", please be sure to check out our blog today at http://1-dot-webblog-143719.appspot.com/");
	         // Send message
	         Transport.send(message);
	         String title = "Send Email";
	         String res = "Sent message successfully....";
	         String docType =
	         "<!doctype html public \"-//w3c//dtd html 4.0 " +
	         "transitional//en\">\n";
	         out.println(docType +
	         "<html>\n" +
	         "<head><title>" + title + "</title></head>\n" +
	         "<body bgcolor=\"#f0f0f0\">\n" +
	         "<h1 align=\"center\">" + title + "</h1>\n" +
	         "<p align=\"center\">" + res + "</p>\n" +
	         "</body></html>");
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	  }
}
} 