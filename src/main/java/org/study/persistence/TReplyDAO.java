package org.study.persistence;

import java.util.List;

import org.study.domain.TReplyVO;

public interface TReplyDAO {
	
	public List<TReplyVO> TReplyList(Integer bno) throws Exception;
	public void TReplyCreate(TReplyVO vo) throws Exception;
	public void TReplyModify(TReplyVO vo) throws Exception;
	public void TReplyDelete(int rno) throws Exception;	

}
