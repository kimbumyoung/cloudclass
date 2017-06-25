package org.study.service;

import org.study.domain.UserVO;

public interface UserService {

	public UserVO loginCheck(UserVO vo) throws Exception;
	public String signUpIdCheck(String uid) throws Exception;
	public void signUp(UserVO vo) throws Exception;
	
}
