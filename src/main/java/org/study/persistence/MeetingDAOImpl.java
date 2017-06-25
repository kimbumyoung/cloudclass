package org.study.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;


@Repository
public class MeetingDAOImpl implements MeetingDAO{

	@Inject 
	SqlSession session;
	
	
	private static String namespace ="org.study.mapper.meetingMapper";
	
	@Override
	public void meetingComplete(MeetingVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("wewwwwwwwwwwwwwwwwwwwww"+vo);
		session.insert(namespace+".meetingComplete",vo);
	}

	@Override
	public MeetingVO meetingRequestCheck(MeetingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".meetingRequestCheck",vo);
	}

	@Override
	public void meetingCountUp(Integer bno) throws Exception {

		session.update(namespace+".meetingCountUp",bno);
	}
	
	public void meetingCountDown(Integer bno) throws Exception{
		session.update(namespace+".meetingCountDown",bno);
	}

	@Override
	public BoardVO meetingBoardInfo(Integer bno) throws Exception {

		return session.selectOne(namespace+".meetingBoardInfo",bno);
	}
	
	
	

}
