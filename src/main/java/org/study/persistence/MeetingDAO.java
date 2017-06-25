package org.study.persistence;

import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;

public interface MeetingDAO {

	public void meetingComplete(MeetingVO vo) throws Exception;

	public MeetingVO meetingRequestCheck(MeetingVO vo) throws Exception;

	public void meetingCountUp(Integer bno) throws Exception;
	
	public void meetingCountDown(Integer bno) throws Exception;

	public BoardVO meetingBoardInfo(Integer bno) throws Exception;
}
