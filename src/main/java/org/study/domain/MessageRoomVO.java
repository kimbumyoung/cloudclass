package org.study.domain;

public class MessageRoomVO {
	

	public String sender;
	public String receiver;
	public Integer count;
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	@Override
	public String toString() {
		return "MessageRoomVO [sender=" + sender + ", receiver=" + receiver + ", count=" + count + "]";
	}


}
