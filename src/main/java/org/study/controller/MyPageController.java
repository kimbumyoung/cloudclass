package org.study.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;
import org.study.domain.MessageRoomVO;
import org.study.domain.SboardVO;
import org.study.service.MessageService;
import org.study.service.MyPageService;
import org.study.util.UploadFileUtils;


@Controller
@RequestMapping("/my/*")
public class MyPageController {

	@Inject
	private MyPageService myPageService;
	
	@Inject
	private MessageService messageSerivce;
	
	@Resource(name="userImagePath")
	private String userImagePath;
	
	
	
	@RequestMapping(value="/myPage",method=RequestMethod.GET)
	public void mypage(){

		
	}
	
	@RequestMapping(value="/uimageUpload",produces = "text/plain;charset=UTF-8",method=RequestMethod.POST)
	public ResponseEntity<String> uimageUpload(MultipartFile file) throws Exception{
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(userImagePath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		
	}
	
	
	@RequestMapping(value="/uimageRegister/{uid}")
	public ResponseEntity<String> uimageRegister(@PathVariable("uid") String uid, String uimage) throws Exception{
		
		ResponseEntity<String> entity = null;
			
		try {
			myPageService.uimageRegister(uid, uimage);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value= "/uimageGet/{uid}",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String uimageGet(@PathVariable("uid") String uid) throws Exception {
		
		return myPageService.uimageGet(uid);

	}
	
	@RequestMapping(value="/myMessageList/{uid}",method= RequestMethod.GET)
	public ResponseEntity<List<MessageRoomVO>> myMessageList(@PathVariable("uid") String uid){ //채팅방 목록 출력
		
		ResponseEntity<List<MessageRoomVO>> entity = null;
	
		try {
			System.out.println(messageSerivce.myMessageList(uid));
			entity = new ResponseEntity<List<MessageRoomVO>>(messageSerivce.myMessageList(uid),HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MessageRoomVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
		@RequestMapping(value="/noReadcount/{uid}",method= RequestMethod.GET)
		public ResponseEntity<List<MessageRoomVO>> noReadcount(@PathVariable("uid") String uid){ 
			
		ResponseEntity<List<MessageRoomVO>> entity = null;
		
		try {
			
			entity = new ResponseEntity<List<MessageRoomVO>>(messageSerivce.noReadcount(uid),HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MessageRoomVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
		@RequestMapping(value="/messageRead", method = RequestMethod.POST)
		public ResponseEntity<String> messageRead(@RequestParam("uid") String uid, @RequestParam("sender") String sender) {
			ResponseEntity<String> entity = null;

			try {
				messageSerivce.messageRead(uid, sender);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		@RequestMapping(value="/registerShow", method= RequestMethod.GET)
		public String registerShow() throws Exception{
	
			return "/my/registerBoard";
		}
			
		@RequestMapping(value="/messageShow", method= RequestMethod.GET)
		public String messageShow(){
			
			return "/my/message";
			
		}
		
		@RequestMapping(value="/profileShow",method= RequestMethod.GET)
		public String profileShow(){
			
			return "/my/profile";
		}
		
		@RequestMapping(value="/myBoardList", method= RequestMethod.GET)
		public ResponseEntity<List<BoardVO>> myBoardList(@RequestParam("uid") String uid) throws Exception{
			return new ResponseEntity<List<BoardVO>>(myPageService.myBoardList(uid),HttpStatus.OK);
		}
		
		@RequestMapping(value="/applyShow", method= RequestMethod.GET)
		public String applyShow() throws Exception{
			return "/my/apply";
		}
	
		@RequestMapping(value="/applyList", method = RequestMethod.GET)
		public ResponseEntity<List<BoardVO>>applyList(@RequestParam("uid") String uid) throws Exception{

			return new ResponseEntity<List<BoardVO>>(myPageService.applyList(uid),HttpStatus.OK);
		}
		
		
		@RequestMapping(value="/applyCancel", method = RequestMethod.POST)
		public ResponseEntity<String> applyCancel(@RequestBody MeetingVO vo){
			ResponseEntity<String> entity = null;

			try {
				myPageService.applyCancel(vo);
				
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
			} catch (Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}

			return entity;
			
		}		

		@RequestMapping(value="/requestShow", method= RequestMethod.GET)
		public String requestShow(){
			return "/my/requestBoard";
		}
		
		@RequestMapping(value="/myRequestBoardList", method= RequestMethod.GET)
		public ResponseEntity<List<SboardVO>> myRequestBoardList(@RequestParam("uid") String uid) throws Exception{
			System.out.println(uid);
			return new ResponseEntity<List<SboardVO>>(myPageService.myRequestBoardList(uid),HttpStatus.OK);
		}
		
		@RequestMapping(value="/applyuserList",method = RequestMethod.GET)
		public ResponseEntity<List<MeetingVO>> applyuserList(@RequestParam("bno") Integer bno) throws Exception{
			System.out.println(bno);
			return new ResponseEntity<List<MeetingVO>>(myPageService.applyuserList(bno),HttpStatus.OK);
		}

		
	
}
