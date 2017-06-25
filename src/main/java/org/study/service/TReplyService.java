package org.study.service;

import java.util.List;

import org.study.domain.TReplyVO;

public interface TReplyService {
	
	public List<TReplyVO> TReplyList(Integer bno) throws Exception;
	public void TReplyCreate(TReplyVO vo) throws Exception;
	public void TReplyModify(TReplyVO vo) throws Exception;
	public void TReplyDelete(int rno) throws Exception;

}
