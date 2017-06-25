package org.study.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.BoardVO;
import org.study.domain.Criteria;
import org.study.domain.SearchCriteria;

@Repository
public class BoardDaoimpl implements BoardDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.study.mapper.boardMapper";
	
	@Override
	public List<BoardVO> boardListAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".boardListAll");
	}
	
	@Override
	public List<BoardVO> boardListPage(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+".boardListPage",cri);
		
	}

	@Override
	public BoardVO boardRead(int bno) throws Exception {
		
		return session.selectOne(namespace+".boardRead",bno);
		
	}

	@Override
	public void boardModify(BoardVO vo) throws Exception {

		session.update(namespace+".boardModify",vo);
	}

	@Override
	public void boardRegister(BoardVO vo) throws Exception {

		session.insert(namespace+".boardRegister",vo);
	}

	@Override
	public int boardTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".boardTotalCount",cri);
	}

	@Override
	public void addAttach(String fullName) throws Exception {

		System.out.println("addAttach들어왔어");
		System.out.println(fullName);
		session.insert(namespace+".addAttach",fullName);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		
		return session.selectList(namespace+".getAttach",bno);
		
	}

	
	@Override
	public void deleteAttach(Integer bno) throws Exception {
		session.delete(namespace+".deleteAttach",bno);
	}

	
	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {

		Map<String, Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach",paramMap);
	}

	@Override
	public void boardDelete(Integer bno) throws Exception {

		session.delete(namespace+".boardDelete",bno);
	}

	@Override
	public void deleteReply(Integer bno) throws Exception {
		session.delete(namespace+".deleteReply",bno);
		
	}

	@Override
	public void deleteApply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteApply",bno);
	}

	@Override
	public List<BoardVO> mainBoardList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mainBoardList");
	}


}
