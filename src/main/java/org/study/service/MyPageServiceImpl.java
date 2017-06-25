package org.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;
import org.study.domain.SboardVO;
import org.study.persistence.MeetingDAO;
import org.study.persistence.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Inject
	MyPageDAO dao;
	
	@Inject 
	MeetingDAO meetingDAO;
	
	@Override
	public void uimageRegister(String uid,String uimage) throws Exception {
		System.out.println("service 들어옴 ");
		dao.uimageRegister(uid, uimage);
	}

	@Override
	public String uimageGet(String uid) throws Exception {
		
		System.out.println("서비스");
		// TODO Auto-generated method stub
		return dao.uimageGet(uid);
	}

	@Override
	public List<BoardVO> myBoardList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.myBoardList(uid);
	}

	@Override
	public List<SboardVO> myRequestBoardList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.myRequestBoardList(uid);
	}

	@Override
	public List<BoardVO> applyList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.applyList(uid);
	}

	@Override
	@Transactional
	public void applyCancel(MeetingVO vo) throws Exception {
	
		dao.applyCancel(vo);
		meetingDAO.meetingCountDown(vo.getBno());
	}

	@Override
	public List<MeetingVO> applyuserList(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.applyuserList(bno);
	}

}
