package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;




@Mapper
public interface CommunityMapper {
	
	
	
	@Select("SELECT * FROM COMMUNITY ORDER BY COM_NUM DESC LIMIT #{pagenum}, #{contentnum}")
	public List<CommunityDto>testlist(int pagenum, int contentnum);
	
	@Select("SELECT *  FROM COMMUNITY ORDER BY COM_NUM DESC " )
	public List<CommunityDto> communitylist();
	
	@Select("SELECT COUNT(*) FROM COMMUNITY")
	public int selectBoardCount();
	
	@Insert("INSERT INTO COMMUNITY VALUES(NULL, #{com_title}, NOW(), #{com_content}, DEFAULT,#{com_image}, #{member_id})")
	public int communitywrite(CommunityDto dto);
	
	@Select("SELECT * FROM COMMUNITY WHERE COM_NUM = #{com_num}")
	public CommunityDto communitydetail(CommunityDto dto);
	
	@Select("SELECT * FROM COMMENT WHERE COM_NUM = #{com_num}")
	public List<CommentDto> commentList(CommunityDto dto);
	
	@Update("UPDATE COMMUNITY SET COM_HIT=COM_HIT+1 WHERE COM_NUM = #{com_num}")
	public void communityhit(CommunityDto dto);
	
	@Select("SELECT * FROM COMMUNITY WHERE ${searchOption} LIKE CONCAT('%',#{keyword},'%') LIMIT #{pagenum}, #{contentnum}")
	public List<CommunityDto> listAll(String searchOption, String keyword, int pagenum, int contentnum);
	
	@Select("SELECT COUNT(*) FROM COMMUNITY WHERE ${searchOption} LIKE CONCAT('%',#{keyword},'%') ")
	public int countArticle(String searchOption, String keyword);
	
	@Delete("DELETE FROM COMMUNITY WHERE COM_NUM=#{com_num}")
	public int communitydelete(CommunityDto dto);
	
	@Update("UPDATE COMMUNITY SET COM_TITLE=#{com_title}, COM_CONTENT=#{com_content}, COM_IMAGE=#{com_image}, COM_DATE=NOW() WHERE COM_NUM=#{com_num} ")
	public int communityupdate(CommunityDto dto);
}
