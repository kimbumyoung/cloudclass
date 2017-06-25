package org.study.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;
import org.study.persistence.MeetingDAO;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Inject
	MeetingDAO dao;
	
	@Override
	@Transactional
	public void meetingComplete(MeetingVO vo) throws Exception {
		dao.meetingComplete(vo);
		
	}

	@Override
	public MeetingVO meetingRequestCheck(MeetingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.meetingRequestCheck(vo);
	}

	@Override
	public void meetingCountUp(Integer bno) throws Exception {

		dao.meetingCountUp(bno);
	}

	@Override	
	public BoardVO meetingBoardInfo(Integer bno) throws Exception {

		return dao.meetingBoardInfo(bno);
	}



}
