package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import Model.CommentDTO;
import Model.CorporDTO;
import Model.MemberDTO;
import Model.TourDAO;
import Model.TourDTO;

public class TourService {
	
	@Autowired
	private TourDAO tourDAO;
	@Autowired
	private CommentDTO CommentDTO;
	@Autowired
	private MemberDTO memberDto;
	@Autowired
	private CorporDTO corpDTO;
	private ServletContext application;
	
	public void insertComment(HashMap<String, Object> param, HttpSession session, Model model) {
		memberDto = (MemberDTO) session.getAttribute("login");
		CommentDTO.setLocalCode(Integer.parseInt(String.valueOf(param.get("localCode"))));
		CommentDTO.setContent(String.valueOf(param.get("commentAdd")));
		CommentDTO.setMemberId(memberDto.getMemberId());
		
		tourDAO.insertComment(CommentDTO);
	} 
	
	public HashMap<String, CommentDTO> selectAllComment(String local){
		List<CommentDTO> list =  tourDAO.selectComment(local);
		
		HashMap<String, CommentDTO> commentMap = new HashMap<String, CommentDTO>();
		int num = 1;
		for(CommentDTO s : list) {
			//System.out.println(s.getCommentNum());
			commentMap.put("comment"+num++, s);
		}
		return commentMap;
	}
	
	public int setTour(TourDTO dto, HttpSession session, HttpServletRequest request) throws IOException {
	
		printInfo(dto.getLocalImage(), request);                            
		corpDTO = (CorporDTO) session.getAttribute("corlogin");

		String corpId = corpDTO.getCorporId();
		dto.setCorpId(corpId);
		
		return tourDAO.addTour(dto);
	}
	
	private void printInfo(MultipartFile localImage, HttpServletRequest request) throws IllegalStateException, IOException{
		String filePath = request.getParameter("realPath") + "WEB-INF\\view\\img\\tour\\";
		System.out.println(filePath);
		
		File file = new File(filePath);
		String originalFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		originalFile = localImage.getOriginalFilename();
		originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		
		System.out.println("업로드 한 파일 명 = " + originalFile);
		System.out.println("바뀐 파일 명 = " + storedFileName);
	}

}
