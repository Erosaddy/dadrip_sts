package kr.co.dadrip.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dadrip.domain.MemberDTO;
import kr.co.dadrip.persistence.IJokeDAO;
import kr.co.dadrip.persistence.IMemberDAO;
import kr.co.dadrip.service.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService {
	@Autowired
	private IMemberDAO mDao;

	@Override
	public void register(MemberDTO mDto) throws Exception {
		mDao.insertMember(mDto);
	}

	@Override
	public MemberDTO login(String member_id, String member_pw) throws Exception  {
		MemberDTO mDto = mDao.loginMember(member_id, member_pw);
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
