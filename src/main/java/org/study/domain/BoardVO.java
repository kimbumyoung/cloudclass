package org.study.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {

	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int replycnt;
	private String uid;	
	private String career;
	private String lesson_location;
	private String lessonTimeStart;
	private String lessonTimeEnd;
	private Integer number;
	private String dateEnd;
	private String dateStart;
	private String category;
	private String[] files;
	private String uimage;
	private String coverImagePath;
	private Integer applynum;

	public Integer getApplynum() {
		return applynum;
	}

	public void setApplynum(Integer applynum) {
		this.applynum = applynum;
	}
	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}


	public String getLesson_location() {
		return lesson_location;
	}

	public void setLesson_location(String lesson_location) {
		this.lesson_location = lesson_location;
	}



	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getUimage() {
		return uimage;
	}

	public void setUimage(String uimage) {
		this.uimage = uimage;
	}



	public String getCoverImagePath() {
		return coverImagePath;
	}

	public void setCoverImagePath(String coverImagePath) {
		this.coverImagePath = coverImagePath;
	}
	public String getLessonTimeStart() {
		return lessonTimeStart;
	}

	public void setLessonTimeStart(String lessonTimeStart) {
		this.lessonTimeStart = lessonTimeStart;
	}

	public String getLessonTimeEnd() {
		return lessonTimeEnd;
	}

	public void setLessonTimeEnd(String lessonTimeEnd) {
		this.lessonTimeEnd = lessonTimeEnd;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	

	public String getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}

	public String getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", replycnt=" + replycnt + ", uid=" + uid + ", career=" + career + ", lesson_location="
				+ lesson_location + ", lessonTimeStart=" + lessonTimeStart + ", lessonTimeEnd=" + lessonTimeEnd
				+ ", number=" + number + ", dateEnd=" + dateEnd + ", dateStart=" + dateStart + ", category=" + category
				+ ", files=" + Arrays.toString(files) + ", uimage=" + uimage + ", coverImagePath=" + coverImagePath
				+ ", applynum=" + applynum + "]";
	}

}
