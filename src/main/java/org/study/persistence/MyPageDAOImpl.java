package org.study.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;
import org.study.domain.SboardVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace ="org.study.mapper.myPageMapper";
	
	@Override
	public void uimageRegister(String uid, String uimage) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("uimage", uimage);
		session.update(namespace+".uimageRegister",map);
	}

	@Override
	public String uimageGet(String uid) throws Exception {
		System.out.println("get");
		return session.selectOne(namespace+".uimageGet",uid);
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVO> myBoardList(String uid) throws Exception{
		// TODO Auto-generated method stub
		return session.selectList(namespace+".myBoardList",uid);
	}

	@Override
	public List<SboardVO> myRequestBoardList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".myRequestBoardList",uid);
	}

	@Override
	public List<BoardVO> applyList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".applyList",uid);
				
	}

	@Override
	public void applyCancel(MeetingVO vo) {

		session.delete(namespace+".applyCancel",vo);
	}

	@Override
	public List<MeetingVO> applyuserList(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".applyuserList",bno);
		
	}
	
	

}
