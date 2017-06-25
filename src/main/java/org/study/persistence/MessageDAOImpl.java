package org.study.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.study.domain.MessageRoomVO;
import org.study.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Inject
	SqlSession session;
	
	final static String namespace = "org.study.mapper.messageMapper";
	
	@Override
	public void messageRegister(MessageVO vo) throws Exception { //�޼��� ��� 
		session.insert(namespace+".messageRegister",vo);
	}

	@Override
	public List<MessageVO> messageListAll(String uid,String other) throws Exception { //�޼��� ��� 

		Map<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("other", other);
		return session.selectList(namespace+".messageListAll",map);
		
	}

	@Override
	public void messageRoomRegister(String uid, String other) throws Exception { //�޼����� ���
		Map<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("other", other);
		
		session.insert(namespace+".messageRoomRegister", map);
	}
	
	public Integer messageRoomCheck(String uid, String other) throws Exception{ //�޼����� ���� ���� üũ 
		Map<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("other", other);
		
		return session.selectOne(namespace+".messageRoomCheck",map);
		
	}
	
	public List<MessageRoomVO> myMessageList(String uid) throws Exception{ //���� �޼����� ��� 
		
		return session.selectList(namespace+".myMessageList",uid);
		
	}

	@Override
	public List<MessageRoomVO> noReadcount(String uid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".noReadcount",uid);
	}

	@Override
	public void messageRead(String uid, String sender) throws Exception { //�޼����� ���� check 1�� ����
		Map<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("sender", sender);
		session.update(namespace+".messageRead",map);
	}

}
