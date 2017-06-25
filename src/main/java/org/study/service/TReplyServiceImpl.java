package org.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.study.domain.TReplyVO;
import org.study.persistence.TReplyDAO;

@Service
public class TReplyServiceImpl implements TReplyService {

	@Inject
	TReplyDAO dao;
	
	@Override
	public List<TReplyVO> TReplyList(Integer bno) throws Exception {

		return dao.TReplyList(bno);
	}

	@Override
	public void TReplyCreate(TReplyVO vo) throws Exception {

		dao.TReplyCreate(vo);
	}

	@Override
	public void TReplyModify(TReplyVO vo) throws Exception {
		dao.TReplyModify(vo);
		
	}

	@Override
	public void TReplyDelete(int rno) throws Exception {

		dao.TReplyDelete(rno);
	}

}
