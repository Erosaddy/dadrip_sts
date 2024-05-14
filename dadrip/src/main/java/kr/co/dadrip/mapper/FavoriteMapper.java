package kr.co.dadrip.mapper;

import kr.co.dadrip.domain.FavoriteDTO;
import kr.co.dadrip.domain.VoteDTO;

public interface FavoriteMapper {
	
	public int insert(FavoriteDTO fDto);
	public FavoriteDTO checkFavorite(FavoriteDTO fDto);
	public int delete(FavoriteDTO fDto);
	
}
