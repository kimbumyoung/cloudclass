package org.study.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.study.domain.TReplyVO;
import org.study.service.TReplyService;

@RestController
@RequestMapping(value = " /treplies")
public class TReplyController {

	@Inject
	TReplyService service;

	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<TReplyVO>> TReplyList(@PathVariable int bno) {

		ResponseEntity<List<TReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<List<TReplyVO>>(service.TReplyList(bno), HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<List<TReplyVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ResponseEntity<String> TReplyCreate(@RequestBody TReplyVO vo) {


		ResponseEntity<String> entity = null;

		try {
			service.TReplyCreate(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> TReplyModify(@PathVariable int rno, @RequestBody TReplyVO vo) {

		ResponseEntity<String> entity = null;

		try {
		
			vo.setRno(rno);
			service.TReplyModify(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> TReplyDelete(@PathVariable int rno) {
		ResponseEntity<String> entity = null;

		try {
			service.TReplyDelete(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		
		}

		return entity;

	}

}
