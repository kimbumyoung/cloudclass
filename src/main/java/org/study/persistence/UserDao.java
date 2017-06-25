package org.study.persistence;

import org.study.domain.UserVO;

public interface UserDao {
	
	public UserVO loginCheck(UserVO vo) throws Exception;
	public String signUpIdCheck(String uid) throws Exception;
	public void signUp(UserVO vo) throws Exception;

}
