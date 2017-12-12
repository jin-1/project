package service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.MemberDAO;
import Model.MemberDTO;

public class MemberService {
	
	@Autowired
	MemberDAO memberDao;
	MemberDTO memberDto;
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
	
	
	
}
