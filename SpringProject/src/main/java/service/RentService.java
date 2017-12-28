package service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Model.CorporDTO;
import Model.ProductDAO;
import Model.ProductDTO;
import Model.TourDTO;

public class RentService {

	@Autowired
	private ProductDAO pDAO;
	
	
	public int insertProduct(ProductDTO pDTO, HttpSession session, HttpServletRequest request, String realPath)throws IOException {
		printInfo(pDTO.getPrdImgSave(), request, session, pDTO, realPath);
		System.out.print(pDTO.getPrdImg());
		return pDAO.insertProduct(pDTO);
	}
	
	private void printInfo(MultipartFile report, HttpServletRequest request, HttpSession session, ProductDTO pDTO, String realPath) throws IllegalStateException, IOException{
		String filePath = realPath+ "WEB-INF\\view\\img\\prd\\";
		System.out.println("service "+filePath);
		
		File file = new File(filePath);
		String originalFile = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		originalFile = report.getOriginalFilename();
		originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		
		System.out.println("원래 그대로의 파일 이름 = " + originalFile);
		System.out.println("내가 변경한 파일 이름 = " + storedFileName);
		
		file = new File(filePath + storedFileName);
		report.transferTo(file);
		
		pDTO.setPrdImg(storedFileName);
		System.out.print(pDTO.getPrdImg());
	}
}
