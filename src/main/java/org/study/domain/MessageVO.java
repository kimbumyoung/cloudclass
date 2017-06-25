package org.study.domain;

import java.util.Date;

import com.google.gson.Gson;

public class MessageVO {

	private Integer mno;
	private String sender;
	private String receiver;
	private String messagecontent;
	private Integer readcheck;
	private Date sendDate;

	public static MessageVO convertMessage(String source) {

		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		// 사용자가 보낸 json 타입의 정보를 자바 객체에 넣어준다.
		message = gson.fromJson(source, MessageVO.class);
	
		return message;
	}

	public Integer getMno() {
		return mno;
	}

	public void setMno(Integer mno) {
		this.mno = mno;
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

	public String getMessagecontent() {
		return messagecontent;
	}

	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Integer getReadcheck() {
		return readcheck;
	}

	public void setReadcheck(Integer readcheck) {
		this.readcheck = readcheck;
	}

	@Override
	public String toString() {
		return "MessageVO [mno=" + mno + ", sender=" + sender + ", receiver=" + receiver + ", messagecontent="
				+ messagecontent + ", readcheck=" + readcheck + ", sendDate=" + sendDate + "]";
	}

}
