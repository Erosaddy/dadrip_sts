package kr.co.dadrip.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private int reply_id;
	private String member_id;
	private int joke_id;
	private int parent_reply_id;
	private Date created_on;
	private Date modified_on;
	private String content;
	private int like_count;
	private int dislike_count;
	
}
