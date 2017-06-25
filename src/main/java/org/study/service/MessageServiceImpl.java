package org.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.study.domain.MessageRoomVO;
import org.study.domain.MessageVO;
import org.study.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	MessageDAO dao;

	@Override
	public void messageRegister(MessageVO vo) throws Exception {

		dao.messageRegister(vo);
	}

	@Override
	public List<MessageVO> messageListAll(String uid, String other) throws Exception {

		return dao.messageListAll(uid, other);
	}

	@Override
	public void messageRoomRegister(String uid, String other) throws Exception {
		dao.messageRoomRegister(uid, other);
	}

	@Override
	public Integer messageRoomCheck(String uid, String other) throws Exception {
		// TODO Auto-generated method stub
		return dao.messageRoomCheck(uid, other);
	}

	@Override
	public List<MessageRoomVO> myMessageList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.myMessageList(uid);
	}

	@Override
	public List<MessageRoomVO> noReadcount(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.noReadcount(uid);
	}

	@Override
	public void messageRead(String uid, String sender) throws Exception {
		dao.messageRead(uid, sender);
	}

}
