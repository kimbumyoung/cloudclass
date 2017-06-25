package org.study.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.domain.PageMaker;
import org.study.domain.SboardVO;
import org.study.domain.SearchCriteria;
import org.study.service.SboardService;

@Controller
@RequestMapping("/sboard/*")
public class SboardController {
	@Inject
	private SboardService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model)throws Exception{
		cri.setPerPageNum(20);
		model.addAttribute("list",service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno")int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value="/removePage",method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		service.remove(bno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri,Model model)throws Exception{
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value="/modifyPage",method = RequestMethod.POST)
	public String modifyPagingPOST(SboardVO board,SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		service.modify(board);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public void registGET() throws Exception{
		
	}
	@RequestMapping(value="/register" , method = RequestMethod.POST)
	public String registPOST(SboardVO board, RedirectAttributes rttr)throws Exception{
		System.out.println(board);

		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/sboard/list";
	}
}
