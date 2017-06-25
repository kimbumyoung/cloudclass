package org.study.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	private Criteria cri;
	private int totalCount;
	private int pageNum = 10;

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		pageCal();
	}

	public void pageCal() {
		endPage = (int) Math.ceil(cri.getPage() / (double) pageNum) * pageNum;
		startPage = (endPage - pageNum) + 1;
		int tempPage = (int) Math.ceil(totalCount / (double) cri.getPerPageNum());

		if (endPage > tempPage) {
			this.endPage = tempPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	public String makeQuery(int page){
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	public String makeSearch(int page){
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword",((SearchCriteria)cri).getKeyword())
				.build();
		return uriComponents.toUriString();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

}
