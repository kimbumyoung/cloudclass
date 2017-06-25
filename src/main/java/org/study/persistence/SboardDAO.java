package org.study.persistence;

import java.util.List;

import org.study.domain.Criteria;
import org.study.domain.SboardVO;
import org.study.domain.SearchCriteria;

public interface SboardDAO {
	public void create(SboardVO vo)throws Exception;
	public SboardVO read(Integer bno)throws Exception;
	public void update(SboardVO vo)throws Exception;
	public void delete(Integer bno)throws Exception;
	public List<SboardVO> listAll()throws Exception;
	public List<SboardVO> listPage(int page)throws Exception;
	public List<SboardVO> listCriteria(Criteria cri)throws Exception;
	public int countPaging(Criteria cri)throws Exception;
	public List<SboardVO> listSearch(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
	public void updateReplyCnt(Integer bno, int amount)throws Exception;
	public void updateViewCnt(Integer bno)throws Exception;
	public void deleteReply(Integer bno)throws Exception;
}
