package org.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.study.domain.Criteria;
import org.study.domain.SboardVO;
import org.study.domain.SearchCriteria;
import org.study.persistence.SboardDAO;
@Service
public class SboardServiceImpl implements SboardService {
	@Inject
	private SboardDAO dao;
	@Override
	public void regist(SboardVO board) throws Exception {
		dao.create(board);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public SboardVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno); // 조회수 증가
		return dao.read(bno);
	}

	@Override
	public void modify(SboardVO board) throws Exception {
		dao.update(board);
	}
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteReply(bno);
		dao.delete(bno);
	}
	@Override
	public List<SboardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<SboardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<SboardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
