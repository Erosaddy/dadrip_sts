package kr.co.dadrip.service;

import java.util.List;

import kr.co.dadrip.domain.JokeDTO;

public interface IJokeService {
	public void register(JokeDTO jDto) throws Exception;
	public JokeDTO read(Integer joke_id) throws Exception;
	public boolean update(JokeDTO jDto) throws Exception;
	public boolean delete(Integer joke_id) throws Exception;
	public List<JokeDTO> listAllJokes() throws Exception;
}
