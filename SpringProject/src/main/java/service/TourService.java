package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
		System.out.println(request.getParameter("realPath"));
		printInfo(dto.getLocalImageSave(), request, session, dto);       
		
		corpDTO = (CorporDTO)session.getAttribute("corlogin");
		String id = corpDTO.getCorporId();

		dto.setCorpId(id);
		
		return tourDAO.addTour(dto);
	}
	
	public int resetTour(TourDTO dto, HttpSession session, HttpServletRequest request) throws IOException {
		printInfo(dto.getLocalImageSave(), request, session, dto); 

		dto.setLocalCode(Integer.parseInt(request.getParameter("localCode")));
		return tourDAO.modifyTour(dto);
	}
	
	public int viewOne(TourDTO dto, HttpServletRequest request) {
		int code = Integer.parseInt(request.getParameter("localCode"));
		dto.setLocalCode(code);
		
		return tourDAO.viewOne(dto);
	}
	
	private void printInfo(MultipartFile report, HttpServletRequest request, HttpSession session, TourDTO dto) throws IllegalStateException, IOException{
		String filePath = request.getParameter("realPath") + "WEB-INF\\view\\img\\tour\\";
		System.out.println(filePath);
		corpDTO = (CorporDTO) session.getAttribute("corlogin");
		String corpId = corpDTO.getCorporId();
		
		File file = new File(filePath);
		String originalFile = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		originalFile = report.getOriginalFilename();
		originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		storedFileName = corpId+"_"+UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		
		System.out.println("¿ø·¡ ±×´ë·ÎÀÇ ÆÄÀÏ ÀÌ¸§ = " + originalFile);
		System.out.println("³»°¡ º¯°æÇÑ ÆÄÀÏ ÀÌ¸§ = " + storedFileName);
		
		file = new File(filePath + storedFileName);
		report.transferTo(file);
		
		dto.setLocalImage(storedFileName);
	}

}
