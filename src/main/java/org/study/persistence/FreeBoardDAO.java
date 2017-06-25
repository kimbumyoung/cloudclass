package org.study.persistence;

import java.util.List;

import org.study.domain.Criteria;
import org.study.domain.FreeBoardVO;
import org.study.domain.SearchCriteria;


public interface FreeBoardDAO {
	
	public void create(FreeBoardVO vo)throws Exception;
	
	public FreeBoardVO read(Integer bno)throws Exception;
	
	public void update(FreeBoardVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<FreeBoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer bno, int amount) throws Exception;

	public void updateViewCnt(Integer bno) throws Exception;
	
	public void addAttach(String fullName)throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	public void deleteAttach(Integer bno) throws Exception;
	
	public void replaceAttach(String fullName, Integer bno) throws Exception;

	public void deleteReply(Integer bno);
}
