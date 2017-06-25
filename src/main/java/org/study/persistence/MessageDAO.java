package org.study.persistence;

import java.util.List;

import org.study.domain.MessageRoomVO;
import org.study.domain.MessageVO;

public interface MessageDAO {
	
	public void messageRegister(MessageVO vo)throws Exception; //메세지 등록 
	public List<MessageVO> messageListAll(String uid, String other) throws Exception; //메세지 출력
	public void messageRoomRegister(String uid, String other) throws Exception; //메세지방 등록
	public Integer messageRoomCheck(String uid, String other) throws Exception; //메세지방 존재 유무 체크 
	public List<MessageRoomVO> myMessageList(String uid) throws Exception; //나의 메세지방 리스트 출력
	public List<MessageRoomVO> noReadcount(String uid) throws Exception; 
	public void messageRead(String uid, String sender) throws Exception; //메세지를 보면 check 1로 수정 
	
}
