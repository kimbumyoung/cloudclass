package org.study.persistence;

import java.util.List;

import org.study.domain.BoardVO;
import org.study.domain.MeetingVO;
import org.study.domain.SboardVO;

public interface MyPageDAO {

	public void uimageRegister(String uid, String uimage) throws Exception;

	public String uimageGet(String uid) throws Exception;

	public List<BoardVO> myBoardList(String uid) throws Exception;

	public List<SboardVO> myRequestBoardList(String uid) throws Exception;

	public List<BoardVO> applyList(String uid) throws Exception;

	public void applyCancel(MeetingVO vo);

	public List<MeetingVO> applyuserList(Integer bno) throws Exception;
}
