package org.study.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;
import org.study.domain.PageMaker;
import org.study.domain.SearchCriteria;
import org.study.service.BoardService;
import org.study.service.MeetingService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService service;
	
	@Inject
	MeetingService meetingService;
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public void listPage(BoardVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.boardTotalCount(cri));
		model.addAttribute("list", service.boardListPage(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/boardRead", method = RequestMethod.GET)
	public void boardRead(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	System.out.println("read 들어옴 ");
		model.addAttribute("boardVO", service.boardRead(bno));
		
	}

	@RequestMapping(value = "/boardRegister", method = RequestMethod.GET)
	public void boardRegisterGet() throws Exception {

	}

	@RequestMapping(value = "/boardRegister", method = RequestMethod.POST)
	public String boardRegisterPost(BoardVO vo) throws Exception {
		System.out.println("들어왔어 ㅎㅎ");
		service.boardRegister(vo);
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value="/boardModify", method = RequestMethod.GET)
	public void boardModifyGet(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception
	{
		model.addAttribute("boardVO", service.boardRead(bno));
		System.out.println(service.boardRead(bno));
	}
	
	@RequestMapping(value="/boardModify", method = RequestMethod.POST)
	public String boardModifyPost(BoardVO vo,RedirectAttributes rttr,SearchCriteria cri)throws Exception
	{
		service.boardModify(vo);
		System.out.println("wwwwwwwwwwwwwwwwww"+cri);
		rttr.addAttribute("bno",vo.getBno());
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/boardRead";
	
	}
	@RequestMapping(value="/boardDelete", method=RequestMethod.POST)
	public String boardDelete(@RequestParam("bno") int bno) throws Exception
	{
		service.boardDelete(bno);
	
		return "redirect:/board/boardList";
	}
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {
		
		return service.getAttach(bno);
	}
	
	@RequestMapping(value="/meetingRequest",method=RequestMethod.GET)
	public void meetingRequest(@ModelAttribute("bno") int bno) throws Exception{ //신청 페이지 load
		System.out.println("cont 들어옴");
	}
	
	@RequestMapping(value="/meetingComplete", method= RequestMethod.POST)
	public void meetingComplete(MeetingVO vo,Model model) throws Exception{ //신청완료
		meetingService.meetingComplete(vo);
		meetingService.meetingCountUp(vo.getBno()); //신청완료 했을시 count증가;
		
		model.addAttribute("boardVO",meetingService.meetingBoardInfo(vo.getBno()));
		model.addAttribute("userVO",vo);
		
		
	}
	
	@RequestMapping(value="/meetingRequestCheck", method = RequestMethod.GET)
	public ResponseEntity<MeetingVO> meetingRequestCheck(@RequestParam("bno") int bno, @RequestParam("uid") String uid) throws Exception{
		System.out.println(bno);
		System.out.println(uid);
		MeetingVO vo = new MeetingVO();
		vo.setBno(bno);
		vo.setUid(uid);
		return new ResponseEntity<MeetingVO>(meetingService.meetingRequestCheck(vo),HttpStatus.OK);
	}
	
}
