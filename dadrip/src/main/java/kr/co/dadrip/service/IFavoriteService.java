package kr.co.dadrip.service;

import kr.co.dadrip.domain.FavoriteDTO;
import kr.co.dadrip.domain.VoteDTO;

public interface IFavoriteService {

	public int insertFavorite(FavoriteDTO fDto);
	public FavoriteDTO checkFavorite(int joke_id, String member_id);
	public int deleteFavorite(int joke_id, String member_id);
	
}
