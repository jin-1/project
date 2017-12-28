package Model;
/*회원 setter, getter 클래스 -윤성호*/
import java.util.Date;

public class MemberDTO {
	private String memberId; 
	private String memberPw;
	private String memberJob;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private String memberEmail;
	private String	gender;
	private String birthDate;
	private String inteRest;
	private int authority;
	private int point;


	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getInteRest() {
		return inteRest;
	}
	public void setInteRest(String inteRest) {
		this.inteRest = inteRest;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public String getMemberJob() {
		return memberJob;
	}
	public void setMemberJob(String memberJob) {
		this.memberJob = memberJob;
	}

}
