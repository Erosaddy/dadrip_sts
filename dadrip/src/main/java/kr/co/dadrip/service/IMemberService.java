package kr.co.dadrip.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.dadrip.domain.Criteria;
import kr.co.dadrip.domain.MemberDTO;

public interface IMemberService {
	public boolean register(MemberDTO mDto) throws Exception;
	public MemberDTO login(MemberDTO mDto, HttpSession session) throws Exception;
	public MemberDTO memberInfo(String member_id)  throws Exception;
	public boolean modify(MemberDTO mDto) throws Exception;
	public boolean delete(String member_id) throws Exception;
	public List<MemberDTO> memberList() throws Exception;
	public int idCheck(String member_id) throws Exception;
	public int emailCheck(String email) throws Exception;
}
