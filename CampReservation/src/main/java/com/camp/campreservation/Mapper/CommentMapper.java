package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;

@Mapper
public interface CommentMapper {
//	`COT_NUM`	INT(255)	NOT null auto_increment primary key		COMMENT 'AUTO INCREMENT',
//	`COT_DATE`	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성일 및 수정일이 오늘이 default 값이 되도록한다.',
//	`COT_CONTENT`	VARCHAR(400)	NOT NULL,
//	`COM_NUM`	INT(255)	NOT NULL,
//	`MEMBER_ID`	VARCHAR(255)	NOT NULL
	@Insert("INSERT INTO COMMENT VALUES(null, NOW(), #{cot_content}, #{com_num}, #{member_id})")
	public int commentwrite(CommentDto comment);
	
	@Select("SELECT COUNT(*) FROM COMMENT WHERE COM_NUM=#{com_num}")
	public int selectcommentCount(CommunityDto dto);
	
	@Select("SELECT * FROM COMMENT WHERE COM_NUM= #{dto.com_num} LIMIT #{pagenum}, #{contentnum}")
	public List<CommentDto>commentList(CommunityDto dto, int pagenum, int contentnum);
	
	@Delete("DELETE FROM COMMENT WHERE COM_NUM= #{com_num}")
	public int commentdelete(CommunityDto dto);
	
	@Delete("DELETE FROM COMMENT WHERE COM_NUM=#{com_num} AND COT_NUM=#{cot_num}")
	public int onlycommentdelete(CommentDto dto);
	
	@Select("SELECT * FROM COMMENT WHERE MEMBER_ID =#{member_id}")
	public List<CommentDto>commentwriter(CommentDto dto);
}
