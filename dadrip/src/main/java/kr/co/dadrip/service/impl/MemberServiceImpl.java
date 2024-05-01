package kr.co.dadrip.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dadrip.domain.MemberDTO;
import kr.co.dadrip.persistence.IMemberDAO;
import kr.co.dadrip.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements IMemberService {
	@Autowired
	private IMemberDAO mDao;
	
	@Override
	public boolean register(MemberDTO mDto) throws Exception {
		return mDao.insertMember(mDto) == 1;
	}

	@Override
	public MemberDTO login(MemberDTO mDto, HttpSession session) throws Exception  {
		mDto = mDao.loginMember(mDto);
		
		if (mDto != null) {	// 세션 변수 저장
			session.setAttribute("memberInfo", mDto);
		}
		return mDto;
	}

	@Override
	public MemberDTO memberInfo(String member_id) throws Exception {
		MemberDTO mDto = mDao.selectMember(member_id);
		return mDto;
	}

	@Override
	public boolean modify(MemberDTO mDto) throws Exception {
		return mDao.updateMember(mDto) == 1;
	}

	@Override
	public boolean delete(String member_id) throws Exception {
		return mDao.deleteMember(member_id) == 1;
	}

	@Override
	public List<MemberDTO> memberList() throws Exception {
		return mDao.listAllMembers();
	}

	

}
