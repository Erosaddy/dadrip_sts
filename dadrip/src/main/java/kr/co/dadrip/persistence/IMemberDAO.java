package kr.co.dadrip.persistence;

import java.util.List;

import kr.co.dadrip.domain.MemberDTO;

public interface IMemberDAO {

	public void insertMember(MemberDTO mDto);	// 회원가입
	public MemberDTO loginMember(String member_id, String member_pw) throws Exception;	// 로그인
	
	public List<MemberDTO> listAllMembers();	// 전체회원 조회
	public List<MemberDTO> searchMembers(String member_id) throws Exception;		// 회원 검색
}
