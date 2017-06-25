package org.study.persistence;


import java.util.List;
import org.springframework.stereotype.Repository;
import org.study.domain.BoardVO;
import org.study.domain.Criteria;
import org.study.domain.SearchCriteria;

@Repository
public interface BoardDao {
	
	public List<BoardVO> boardListAll() throws Exception;
	public List<BoardVO> boardListPage(SearchCriteria cri) throws Exception;
	public BoardVO boardRead(int bno) throws Exception;
	public void boardModify(BoardVO vo) throws Exception;
	public void boardRegister(BoardVO vo) throws Exception;
	public int boardTotalCount(Criteria cri)throws Exception;
	public void addAttach(String fullName) throws Exception;
	public List<String> getAttach(Integer bno) throws Exception;
	public void deleteAttach(Integer bno) throws Exception;
	public void boardDelete(Integer bno) throws Exception;
	public void replaceAttach(String fullName, Integer bno) throws Exception;
	public void deleteReply(Integer bno) throws Exception;
	public void deleteApply(Integer bno) throws Exception;
	public List<BoardVO> mainBoardList();

}
