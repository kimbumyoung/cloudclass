package org.study.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.TReplyVO;

@Repository
public class TReplyDaoImpl implements TReplyDAO{

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.study.mapper.TReplyMapper";
	
	@Override
	public List<TReplyVO> TReplyList(Integer bno) throws Exception {

		return session.selectList(namespace+".TReplyList",bno);
	}

	@Override
	public void TReplyCreate(TReplyVO vo) throws Exception {
		session.insert(namespace+".TReplyCreate",vo);
	}

	@Override
	public void TReplyModify(TReplyVO vo) {
		
		System.out.println(vo);
		session.update(namespace+".TReplyModify",vo);
	}

	@Override
	public void TReplyDelete(int rno) throws Exception {

		session.delete(namespace+".TReplyDelete",rno);
	}

	
}
