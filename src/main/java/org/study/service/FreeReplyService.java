package org.study.service;

import java.util.List;

import org.study.domain.FreeReplyVO;

public interface FreeReplyService {
	
	public void addReply(FreeReplyVO vo) throws Exception;
	
	public List<FreeReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(FreeReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;

	public int count(Integer bno) throws Exception;
}
