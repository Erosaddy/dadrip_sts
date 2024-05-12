package kr.co.dadrip.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dadrip.domain.FavoriteDTO;
import kr.co.dadrip.domain.VoteDTO;
import kr.co.dadrip.mapper.FavoriteMapper;
import kr.co.dadrip.mapper.ReplyMapper;
import kr.co.dadrip.mapper.VoteMapper;
import kr.co.dadrip.persistence.IJokeDAO;
import kr.co.dadrip.service.IFavoriteService;
import kr.co.dadrip.service.IVoteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class FavoriteServiceImpl implements IFavoriteService {
	
	private final FavoriteMapper mapper;

	private final IJokeDAO jDao;

	@Override
	public int insertFavorite(FavoriteDTO fDto) {
		return mapper.insert(fDto);
	}
	
	@Override
	public FavoriteDTO checkFavorite(int joke_id, String member_id) {
		FavoriteDTO fDto = new FavoriteDTO();
		fDto.setJoke_id(joke_id);
		fDto.setMember_id(member_id);
		
		return mapper.checkFavorite(fDto);
	}
	
	@Override
	public int deleteFavorite(int joke_id, String member_id) {
		FavoriteDTO fDto = new FavoriteDTO();
		fDto.setJoke_id(joke_id);
		fDto.setMember_id(member_id);
		
		return mapper.delete(fDto);
	}

}
