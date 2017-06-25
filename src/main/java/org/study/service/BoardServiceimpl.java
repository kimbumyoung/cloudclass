package org.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.study.domain.BoardVO;
import org.study.domain.Criteria;
import org.study.domain.MeetingVO;
import org.study.domain.SearchCriteria;
import org.study.persistence.BoardDao;

@Service
public class BoardServiceimpl implements BoardService {

	@Inject
	BoardDao dao;
	
	@Override
	public List<BoardVO> boardListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.boardListAll();
	}
	
	@Override
	public List<BoardVO> boardListPage(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.boardListPage(cri);
	}

	@Override
	public BoardVO boardRead(int bno) throws Exception {

		return dao.boardRead(bno);
	}
	
	
	@Transactional
	@Override
	public void boardModify(BoardVO vo) throws Exception {
		
		dao.boardModify(vo);
		Integer bno = vo.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = vo.getFiles();
		
		if(files==null) {return;}
		for(String fileName: files){
			dao.replaceAttach(fileName, bno);
		}
		
	}


	@Transactional
	@Override
	public void boardRegister(BoardVO vo) throws Exception {

		dao.boardRegister(vo);
		
		String[] files = vo.getFiles();
		
		if(files==null){return;}
		
		for(String fileName : files){
			System.out.println(fileName);
			dao.addAttach(fileName);
		}
		
	}

	@Override
	public int boardTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.boardTotalCount(cri);
		
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {

		return dao.getAttach(bno);
	}

	@Transactional
	@Override
	public void boardDelete(Integer bno) throws Exception {
		
		dao.deleteAttach(bno);
		dao.deleteReply(bno);
		dao.deleteApply(bno);
		dao.boardDelete(bno);
	
	}

	@Override
	public List<BoardVO> mainBoardList() throws Exception {
		// TODO Auto-generated method stub
		return dao.mainBoardList();
	}
	


	
	
	
	
	

}
