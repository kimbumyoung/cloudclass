package org.study.persistence;

import java.util.List;

import org.study.domain.MessageRoomVO;
import org.study.domain.MessageVO;

public interface MessageDAO {
	
	public void messageRegister(MessageVO vo)throws Exception; //�޼��� ��� 
	public List<MessageVO> messageListAll(String uid, String other) throws Exception; //�޼��� ���
	public void messageRoomRegister(String uid, String other) throws Exception; //�޼����� ���
	public Integer messageRoomCheck(String uid, String other) throws Exception; //�޼����� ���� ���� üũ 
	public List<MessageRoomVO> myMessageList(String uid) throws Exception; //���� �޼����� ����Ʈ ���
	public List<MessageRoomVO> noReadcount(String uid) throws Exception; 
	public void messageRead(String uid, String sender) throws Exception; //�޼����� ���� check 1�� ���� 
	
}
