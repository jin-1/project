package service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.CoperDTO;
import Model.MemberDAO;
import Model.MemberDTO;

public class MemberService {
	
	@Autowired
	MemberDAO memberDao;
	MemberDTO memberDto;
	CoperDTO corporDto;
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
	
	public int CorLogin(CoperDTO corporDto, HttpSession session) {
		
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
	
	public int setCorRegister(CoperDTO dto) {
		return memberDao.CorRegister(dto);
		
	}
	
	
	
}
