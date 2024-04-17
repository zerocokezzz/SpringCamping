package kr.co.dong.controller;

import java.io.File;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@GetMapping(value="/uploadForm")
	public void uploadForm() {
	}
	
	@PostMapping(value="/uploadForm")
	public String uploadForm(MultipartFile file, Model model) throws Exception{
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		//파일 저장 경로
		String uploadPath="C:\\yjy\\springcamping\\springcamping\\src\\main\\webapp\\resources\\img\\facilityimg";
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}

	@GetMapping(value="/uploadAjax")
	public void uploadAjax() {
		
	}
	
}
