package com.oe.domain;

import java.util.Date;

import lombok.Data;

/*
CREATE TABLE CENTER (
	ce_num NUMBER PRIMARY KEY, --글번호
	ce_id VARCHAR2(30) NOT NULL,
	ce_nickname VARCHAR2(30),
	ce_email VARCHAR2(30),
	ce_title VARCHAR2(300) NOT NULL,
	ce_content VARCHAR2(3000) NOT NULL,
	ce_category VARCHAR2(30), --QNA : 1:1문의하기, SUGGESTION : 건의하기
	ce_status VARCHAR2(30), --답변 대기중 / 답변 완료
	ce_filenum NUMBER, --글번호와 동일
	ce_filename VARCHAR2(300),
	ce_filepath VARCHAR2(300),
	ce_filesize NUMBER,
	ce_date DATE DEFAULT SYSDATE, --작성일
	CONSTRAINT fk_center_id FOREIGN KEY (ce_id) REFERENCES MARKETUSER (us_id)
	ON DELETE CASCADE
);
*/

@Data
public class CenterVO {
	private Integer ce_num;
	private String ce_id;
	private String ce_nickname;
	private String ce_email;
	private String ce_title;
	private String ce_content;
	private String ce_category;
	private String ce_status;
	private Integer ce_filenum;
	private String ce_filename;
	private String ce_filepath;
	private Long ce_filesize;
	private Date ce_date;
}