package service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;


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
		
		dto.setAuthority(0);
		
		return memberDao.Register(dto);
		
	}
	
	public int setCorRegister(CorporDTO dto) {
		return memberDao.CorRegister(dto);
		
	}
	
	//일반회원 아이디 메일보내기
    public int SendEmail(EmailDTO email) throws Exception {
        MimeMessage msg = mailSender.createMimeMessage();
       	int result = 0;
        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            System.out.println("메일이 성공적으로 보내졌습니다.");
            result=2;
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
            result=0;
        }
        try {
            mailSender.send(msg);
            result=2;
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
            result=0;
        }
		return result;
    }
    
    public void updateTPoint(HttpSession session,TrainRegistrationDTO trainRegistrationDTO) {
    	Map<String,Object> pointMap = new HashMap<String,Object>(); 
    	MemberDTO memberdto = (MemberDTO)session.getAttribute("login");
    	System.out.println(trainRegistrationDTO.getPrice());
    	int price =(int)(Integer.parseInt(trainRegistrationDTO.getPrice())*0.0005);
    	int point = price;
    	
    	pointMap.put("memberId", memberdto.getMemberId());
    	pointMap.put("point", point);
    	memberDao.updatePoint(pointMap);
    }

}
