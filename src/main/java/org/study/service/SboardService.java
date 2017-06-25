package org.study.service;

import java.util.List;

import org.study.domain.Criteria;
import org.study.domain.SboardVO;
import org.study.domain.SearchCriteria;

public interface SboardService {
	public void regist(SboardVO board)throws Exception;
	public SboardVO read(Integer bno)throws Exception;
	public void modify(SboardVO board)throws Exception;
	public void remove(Integer bno)throws Exception;
	public List<SboardVO> listAll() throws Exception;
	public List<SboardVO> listCriteria(Criteria cri)throws Exception;
	public int listCountCriteria(Criteria cri)throws Exception;
	public List<SboardVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
