package kr.co.dadrip.service;

import java.util.List;

import kr.co.dadrip.domain.MemberDTO;

public interface IMemberService {
	public void register(MemberDTO mDto) throws Exception;
	public MemberDTO login(String member_id, String member_pw) throws Exception;
	public MemberDTO memberInfo(String member_id)  throws Exception;
	public boolean modify(MemberDTO mDto) throws Exception;
	public boolean delete(String member_id) throws Exception;
	public List<MemberDTO> memberList() throws Exception;
}
