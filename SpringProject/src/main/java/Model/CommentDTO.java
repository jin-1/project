package Model;

import java.util.Date;

public class CommentDTO {
	private int commentNum;
	private String memberId;
	private String localCode;
	private String corpId;
	private String content;
	private Date commentDate;
	
	public CommentDTO() {
		
	}
	public CommentDTO(int commentNum, String memberId, String localCode, String corpId, String content, Date commentDate) {
		super();
		this.commentNum = commentNum;
		this.memberId = memberId;
		this.localCode = localCode;
		this.corpId = corpId;
		this.content = content;
		this.commentDate = commentDate;
	}
	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getLocalCode() {
		return localCode;
	}
	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}
	public String getCorpId() {
		return corpId;
	}
	public void setCorpId(String corpId) {
		this.corpId = corpId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
}
