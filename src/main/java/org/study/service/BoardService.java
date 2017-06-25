package org.study.service;

import java.util.List;

import org.study.domain.BoardVO;
import org.study.domain.Criteria;
import org.study.domain.SearchCriteria;

public interface BoardService {
	
	public List<BoardVO> boardListAll() throws Exception;
	
	public List<BoardVO> boardListPage(SearchCriteria cri) throws Exception;
	
	public BoardVO boardRead(int bno) throws Exception;
	
	public void boardModify(BoardVO vo) throws Exception;
	
	public void boardRegister(BoardVO vo) throws Exception;

	public int boardTotalCount(Criteria cri) throws Exception;
	
	public void boardDelete(Integer bno) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	public List<BoardVO> mainBoardList() throws Exception;
	

}
