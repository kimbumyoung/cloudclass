package org.study.service;

import java.util.List;

import org.study.domain.Criteria;
import org.study.domain.FreeBoardVO;
import org.study.domain.SearchCriteria;


public interface FreeBoardService {

	public void regist(FreeBoardVO board)throws Exception;
	
	public FreeBoardVO read(Integer bno)throws Exception;
	
	public void modify(FreeBoardVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<FreeBoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
}
