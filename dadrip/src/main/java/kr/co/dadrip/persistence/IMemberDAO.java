package kr.co.dadrip.persistence;

import java.util.List;
import java.util.Map;

import kr.co.dadrip.domain.MemberDTO;

public interface IMemberDAO {

	public void insertMember(MemberDTO mDto)  throws Exception;	// 회원가입
	public MemberDTO loginMember(MemberDTO mDto) throws Exception;	// 로그인
	public MemberDTO selectMember(String member_id) throws Exception;	// 내 회원정보 조회
	public int updateMember(MemberDTO mDto)  throws Exception;	// 회원정보 변경
	public int deleteMember(String member_id)  throws Exception;	// 회원 탈퇴
	public List<MemberDTO> listAllMembers()  throws Exception;	// 전체회원 조회
}
