package service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import Model.*;
@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	MemberDTO memberDto;
	CorporDTO corporDto;
	EmailDTO emailDto;
	
	@Autowired
	JavaMailSender mailSender;
    
	public int Login(MemberDTO memberDto, HttpSession session) {
		
		int result=0;
		this.memberDto = memberDao.Login(memberDto);
		if(this.memberDto !=null) {
		
			if(this.memberDto.getMemberPw().equals(memberDto.getMemberPw())) {
			session.setAttribute("login", this.memberDto);
			result = 2;
			} else {
				result= 1;
			}
		}else{
			result= 0;
		}
		
		return result;
	} 
	
	public int CorLogin(CorporDTO corporDto, HttpSession session) {
		
		int result=0;
		this.corporDto = memberDao.CorLogin(corporDto);
		if(this.corporDto !=null) {
		
			if(this.corporDto.getCorporPw().equals(corporDto.getCorporPw())) {
			session.setAttribute("corlogin", this.corporDto);
			result = 2;
			} else {
				result= 1;
			}
		}else{
			result= 0;
		}
		
		return result;
	} 
	

	
	public int setRegister(MemberDTO dto) {
		System.out.println(dto.getGender());
		dto.setAuthority(0);
		
		return memberDao.Register(dto);
		
	}
	
	public int setCorRegister(CorporDTO dto) {
		return memberDao.CorRegister(dto);
		
	}
	
	//메일보내기
    public void SendEmail(EmailDTO email) throws Exception {
       
    	
        MimeMessage msg = mailSender.createMimeMessage();
        System.out.println(email.getSubject());
        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            System.out.println("메일이 성공적으로 보내졌습니다.");
           
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        try {
            mailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }

}
