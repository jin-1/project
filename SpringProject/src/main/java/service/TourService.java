package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.CommentDTO;
import Model.MemberDTO;
import Model.TourDAO;

public class TourService {
	
	@Autowired
	private TourDAO tourDAO;
	@Autowired
	private CommentDTO CommentDTO;
	@Autowired
	private MemberDTO memberDto;
	
	public void insertComment(HashMap<String, Object> param, HttpSession session) {
		memberDto = (MemberDTO) session.getAttribute("login");
		CommentDTO.setLocalCode(String.valueOf(param.get("localCode")));
		CommentDTO.setContent(String.valueOf(param.get("commentAdd")));
		CommentDTO.setMemberId(memberDto.getMemberId());
		
		tourDAO.insertComment(CommentDTO);
	} 
	
	public HashMap<String, CommentDTO> selectAllComment(String local){
		List<CommentDTO> list =  tourDAO.selectComment(local);
		
		HashMap<String, CommentDTO> commentMap = new HashMap<String, CommentDTO>();
		int num = 1;
		for(CommentDTO s : list) {
			System.out.println(s.getCommentNum());
			commentMap.put("comment"+num++, s);
		}
		return commentMap;
	}
}
