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
		//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
		
		 MessageVO messageVO = MessageVO.convertMessage((String) message.getPayload());
		 service.messageRegister(messageVO);
		 System.out.println(messageVO.getSender());
		 System.out.println(messageVO.getReceiver());
		 
        for(WebSocketSession sess : sessionList){
        	if(map1.get(sess.getId()).toString().equals(messageVO.getSender()) || map1.get(sess.getId()).toString().equals(messageVO.getReceiver())) 
        		//sender와 receiver만 채팅
            sess.sendMessage(new TextMessage(messageVO.getSender()+":"+messageVO.getMessagecontent()));
        }
        
    }
    // 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	super.afterConnectionEstablished(session);
        System.out.println("클라이언트 접속됨");
        Map<String, Object> map = session.getAttributes();
        String uid = (String) map.get("userId");      
        String other = (String) map.get("other");
        System.out.println("uid===="+uid+"other==="+other);
        sessionList.add(session);
        map1.put(session.getId(),uid);

        if(service.messageRoomCheck(uid,other)>0){ //방이 존재 하면 
        	System.out.println("sssssadsfsd");
        	  List<MessageVO> list = service.messageListAll(uid,other);
        	  for(MessageVO vo: list){//이전 기록 호출 
              	session.sendMessage(new TextMessage(vo.getSender()+":"+vo.getMessagecontent()));
              }
        }else{ //방이 없으면 
        	System.out.println("rrrrrrrr"+uid+"eee"+other);
        	 service.messageRoomRegister(uid, other);
        }
    }
 
    
    // 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        sessionList.remove(session);
        map1.remove(session);
        System.out.println("클라이언트 접속해제");
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        sessionList.remove(session);
        map1.remove(session);
        System.out.println("전송오류 발생");
    }
    
}
