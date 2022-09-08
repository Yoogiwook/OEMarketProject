package com.oe.domain;

import java.util.Date;

import lombok.Data;

/*
RE_NUM        NOT NULL NUMBER         
BO_NUM        NOT NULL NUMBER         
RE_REPLY      NOT NULL VARCHAR2(1000) 
RE_NAME       NOT NULL VARCHAR2(50)   
RE_REGDATE             DATE           
RE_UPDATEDATE          DATE           
RE_PROFILE             VARCHAR2(4000) 
 * */
@Data
public class ReplyVO {

	private Long re_num, bo_num;
	private String re_reply, re_name, re_profile, re_id;
	private Date re_regdate, re_updateDate;
	
}
