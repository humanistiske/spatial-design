package com.utilities;

import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class EmailUtility 
{
	public boolean sendMail(String from, String password, List<String> to,String subject,String text ) 
	{
		try {
			Properties props = System.getProperties();
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtpout.secureserver.net");


			props.put("mail.smtp.auth", "true");
			props.setProperty("mail.user", from);
			props.setProperty("mail.password", password);

			Session mailSession = Session.getDefaultInstance(props, null);
			// mailSession.setDebug(true);
			Transport transport = mailSession.getTransport("smtp");
			MimeMessage message = new MimeMessage(mailSession);
			message.setSentDate(new java.util.Date());
			message.setSubject(subject);
			message.setFrom(new InternetAddress(from));
			for (int i=0;i < to.size();i++)
			{

				message.addRecipient(Message.RecipientType.TO, new  
						InternetAddress(to.get(i)));
			}

			message.setText(text);

			transport.connect("smtpout.secureserver.net",from,password);
			transport.sendMessage(message,
					message.getRecipients(Message.RecipientType.TO));
			transport.close();

			System.out.println("Email via go daddy sent");
			return true;
		} catch (Exception e) {
			System.out.println("Failed to send Email : " + e.getMessage());
			return false;
		}
	}

}