package org.study.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.study.util.MediaUtils;
import org.study.util.UploadFileUtils;

@Controller
public class UploadController {
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	@Resource(name="userImagePath")
	private String userImagePath;

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);

	}


	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjaxget() {

	}

	
	@ResponseBody
	@RequestMapping("/displayFile/{path}")
	public ResponseEntity<byte[]> diplayFile(String fileName,String uid,@PathVariable("path") String path) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		System.out.println(fileName);
		String displayPath=" ";
		if(path.equals("my")){ //myPage 요청이면 
		 displayPath = userImagePath;
		}else{
		 displayPath = uploadPath;
		}
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(displayPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} 

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;

	}
	
	
	@RequestMapping(value="/deleteFile/{path}",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, @PathVariable("path") String path){
	
		String displayPath;
		if(path.equals("my")){ //myPage 요청이면 
			 displayPath = userImagePath;
			}else{
			 displayPath = uploadPath;
			
			}

		String formatName= fileName.substring(fileName.lastIndexOf(".")+1);
	
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType!=null){
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			System.out.println("front:"+front);
			System.out.println("end:"+end);
			new File(displayPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(displayPath+fileName.replace('/', File.separatorChar)).delete();
		
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
		
	}
	

}
