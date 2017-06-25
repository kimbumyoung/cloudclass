package org.study.domain;

import java.util.Date;

public class SboardVO {

	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int replycnt;
	private int viewcnt;
	private String area;
	private String place;
	private String hopedate;
	private String lessontime;
	private String lessoncnt;
	private String lesson;
	private String level;
	private String sex;
	private String term;
	private String uid;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getHopedate() {
		return hopedate;
	}
	public void setHopedate(String hopedate) {
		this.hopedate = hopedate;
	}
	public String getLessontime() {
		return lessontime;
	}
	public void setLessontime(String lessontime) {
		this.lessontime = lessontime;
	}
	public String getLessoncnt() {
		return lessoncnt;
	}
	public void setLessoncnt(String lessoncnt) {
		this.lessoncnt = lessoncnt;
	}
	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "SboardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", replycnt=" + replycnt + ", viewcnt=" + viewcnt
				+ ", area=" + area + ", place=" + place + ", hopedate=" + hopedate + ", lessontime=" + lessontime
				+ ", lessoncnt=" + lessoncnt + ", lesson=" + lesson + ", level=" + level + ", sex=" + sex + ", term="
				+ term + ", uid=" + uid + "]";
	}
	
}
