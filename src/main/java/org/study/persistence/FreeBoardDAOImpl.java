package org.study.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.Criteria;
import org.study.domain.FreeBoardVO;
import org.study.domain.SearchCriteria;


@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="org.zerock.mapper.FreeBoardMapper";
	
	@Override
	public void create(FreeBoardVO vo) throws Exception {
		session.insert(namespace+".create",vo);
	}

	@Override
	public FreeBoardVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void update(FreeBoardVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete",bno);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging",cri);
	}
	
	@Override
	public List<FreeBoardVO> listSearch(SearchCriteria cri) throws Exception{
		return session.selectList(namespace+".listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace+".listSearchCount",cri);
	}
	
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace+".updateReplyCnt",paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer bno) throws Exception{
		session.update(namespace+".updateViewCnt",bno);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		session.insert(namespace+".addAttach",fullName);
	}
	
	@Override
	public void deleteAttach(Integer bno) throws Exception{
		session.delete(namespace+".deleteAttach",bno);
	}
	
	@Override
	public void replaceAttach(String fullName,Integer bno) throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach",paramMap);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception{

		return session.selectList(namespace+".getAttach",bno);
	}

	@Override
	public void deleteReply(Integer bno) {
		session.delete(namespace+".deleteReply",bno);
	}
}
