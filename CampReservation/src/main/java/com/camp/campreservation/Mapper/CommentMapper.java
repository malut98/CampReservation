package com.camp.campreservation.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.camp.campreservation.Dto.CommentDto;

@Mapper
public interface CommentMapper {
//	`COT_NUM`	INT(255)	NOT null auto_increment primary key		COMMENT 'AUTO INCREMENT',
//	`COT_DATE`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성일 및 수정일이 오늘이 default 값이 되도록한다.',
//	`COT_CONTENT`	VARCHAR(400)	NOT NULL,
//	`COM_NUM`	INT(255)	NOT NULL,
//	`MEMBER_ID`	VARCHAR(255)	NOT NULL
	@Insert("insert into comment values(null, now(), #{cot_content}, #{com_num}, 'user1')")
	public int commentwrite(CommentDto comment);
}
