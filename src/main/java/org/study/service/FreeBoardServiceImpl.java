package org.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.study.domain.Criteria;
import org.study.domain.FreeBoardVO;
import org.study.domain.SearchCriteria;
import org.study.persistence.FreeBoardDAO;


@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Inject
	private FreeBoardDAO dao;
	
	@Transactional
	@Override
	public void regist(FreeBoardVO board) throws Exception{
		dao.create(board);
		
		String[] files = board.getFiles();
		
		//System.out.println("--------------?åå?ùº?óÖÎ°úÎìú ?ì±Î°ùÍ≥º?†ï--------");
		
		if(files==null) { return;}
		
		for(String fileName:files){
			dao.addAttach(fileName);
		}
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public FreeBoardVO read(Integer bno) throws Exception{
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}
	
	@Transactional
	@Override
	public void modify(FreeBoardVO board) throws Exception{
		dao.update(board);
		Integer bno = board.getBno();
		dao.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files==null){return;}
		for(String fileName:files){
			dao.replaceAttach(fileName, bno);
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception{
		dao.deleteReply(bno);
		dao.deleteAttach(bno);
		dao.delete(bno);
	}
	
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}
	
	@Override
	public List<FreeBoardVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception{
		return dao.getAttach(bno);
	}
}
