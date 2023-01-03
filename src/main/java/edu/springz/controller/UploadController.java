package edu.springz.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/upload/ajaxAction")
	public void uploadAjax() {
		log.info("upload ajaxAction");
	}

	@PostMapping("/upload/ajaxAction")
	public void uploadAjaxAction(MultipartFile[] uploadFile) {
		log.info("upload action");
		String upPath = "c:\\upload";
		for (MultipartFile multi : uploadFile) {
			log.info("----------------------------");
			log.info("file name : " + multi.getOriginalFilename());
			log.info("file size : " + multi.getSize());

			File saveFile = new File(upPath, multi.getOriginalFilename());

			try {
				multi.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}

	@GetMapping("/upload/formAction")
	public void uploadForm() {
		log.info("upload formAction");
	}

	@PostMapping("/upload/formAction")
	public void uploadAction(MultipartFile[] uploadFile) {
		log.info("upload action");
		String upPath = "c:\\upload";
		for (MultipartFile multi : uploadFile) {
			log.info("----------------------------");
			log.info("file name : " + multi.getOriginalFilename());
			log.info("file size : " + multi.getSize());

			File saveFile = new File(upPath, multi.getOriginalFilename());

			try {
				multi.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
