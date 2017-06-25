package org.study.domain;

import java.util.Arrays;
import java.util.Date;

public class FreeBoardVO {

	
		private Integer bno;
		private String title;
		private String content;
		private String writer;
		private Date regdate;
		private int viewcnt;
		private int replycnt;
		private String[] files;
		private String uname;
		
		
		public String getUname() {
			return uname;
		}
		public void setUname(String uname) {
			this.uname = uname;
		}
		public int getReplycnt() {
			return replycnt;
		}
		public void setReplycnt(int replycnt) {
			this.replycnt = replycnt;
		}
		public String[] getFiles() {
			return files;
		}
		public void setFiles(String[] files) {
			this.files = files;
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
		public int getViewcnt() {
			return viewcnt;
		}
		public void setViewcnt(int viewcnt) {
			this.viewcnt = viewcnt;
		}
	
		
		@Override
		public String toString() {
			return "FreeBoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
					+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + ", files="
					+ Arrays.toString(files) + ", uname=" + uname + "]";
		}
		
}
