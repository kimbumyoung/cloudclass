package org.study.service;

import java.util.List;

import org.study.domain.MessageRoomVO;
import org.study.domain.MessageVO;

public interface MessageService {

	public void messageRegister(MessageVO vo) throws Exception;

	public List<MessageVO> messageListAll(String uid, String other) throws Exception;

	public void messageRoomRegister(String uid, String other) throws Exception;

	public Integer messageRoomCheck(String uid, String other) throws Exception;

	public List<MessageRoomVO> myMessageList(String uid) throws Exception;

	public void messageRead(String uid,String sender) throws Exception;

	public List<MessageRoomVO> noReadcount(String uid) throws Exception;
}
