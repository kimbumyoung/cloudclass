package org.study.chat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.study.domain.MessageVO;
import org.study.service.MessageService;

public class EchoHandler extends TextWebSocketHandler {

	 private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	 private Map<String,Object> map1 = new HashMap<>();	
	 
	 @Inject
	 MessageService service;
	 
	@Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		//����� ��� Ŭ���̾�Ʈ���� �޽��� ���� : ����Ʈ ���
		
		 MessageVO messageVO = MessageVO.convertMessage((String) message.getPayload());
		 service.messageRegister(messageVO);
		 System.out.println(messageVO.getSender());
		 System.out.println(messageVO.getReceiver());
		 
        for(WebSocketSession sess : sessionList){
        	if(map1.get(sess.getId()).toString().equals(messageVO.getSender()) || map1.get(sess.getId()).toString().equals(messageVO.getReceiver())) 
        		//sender�� receiver�� ä��
            sess.sendMessage(new TextMessage(messageVO.getSender()+":"+messageVO.getMessagecontent()));
        }
        
    }
    // ������ ������ Ŭ���̾�Ʈ�� �����ϸ� ȣ��Ǵ� �޼ҵ�
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	super.afterConnectionEstablished(session);
        System.out.println("Ŭ���̾�Ʈ ���ӵ�");
        Map<String, Object> map = session.getAttributes();
        String uid = (String) map.get("userId");      
        String other = (String) map.get("other");
        System.out.println("uid===="+uid+"other==="+other);
        sessionList.add(session);
        map1.put(session.getId(),uid);

        if(service.messageRoomCheck(uid,other)>0){ //���� ���� �ϸ� 
        	System.out.println("sssssadsfsd");
        	  List<MessageVO> list = service.messageListAll(uid,other);
        	  for(MessageVO vo: list){//���� ��� ȣ�� 
              	session.sendMessage(new TextMessage(vo.getSender()+":"+vo.getMessagecontent()));
              }
        }else{ //���� ������ 
        	System.out.println("rrrrrrrr"+uid+"eee"+other);
        	 service.messageRoomRegister(uid, other);
        }
    }
 
    
    // Ŭ���̾�Ʈ�� ������ �����ϸ� ȣ��Ǵ� �޼ҵ�
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        sessionList.remove(session);
        map1.remove(session);
        System.out.println("Ŭ���̾�Ʈ ��������");
    }
 
    // �޽��� ���۽ó� ���������� ������ �߻��� �� ȣ��Ǵ� �޼ҵ�
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        sessionList.remove(session);
        map1.remove(session);
        System.out.println("���ۿ��� �߻�");
    }
    
}
