package org.study.domain;

import java.util.Date;

public class MeetingVO {
	

	Integer bno;
	String uid;
	String job;
	String phoneNumber;
	Date regdate;
	String uname;
	String uimage;
	String email;

	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUimage() {
		return uimage;
	}
	public void setUimage(String uimage) {
		this.uimage = uimage;
	}
	@Override
	public String toString() {
		return "MeetingVO [bno=" + bno + ", uid=" + uid + ", job=" + job + ", phoneNumber=" + phoneNumber + ", regdate="
				+ regdate + ", uname=" + uname + ", uimage=" + uimage + ", email=" + email + "]";
	}
	
	
}
