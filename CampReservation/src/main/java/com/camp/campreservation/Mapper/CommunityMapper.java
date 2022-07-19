package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;




@Mapper
public interface CommunityMapper {
	
	
	
	@Select("select * from community order by com_num desc limit #{pagenum}, #{contentnum}")
	public List<CommunityDto>testlist(int pagenum, int contentnum);
	
	@Select("select *  from community order by com_num desc " )
	public List<CommunityDto> communitylist();
	
	@Select("select count(*) from community")
	public int selectBoardCount();
	
	@Insert("insert into community values(null, #{com_title}, now(), #{com_content},#{com_image}, default, #{member_id})")
	public int communitywrite(CommunityDto dto);
	
	@Select("select * from community where com_num = #{com_num}")
	public CommunityDto communitydetail(CommunityDto dto);
	
	@Select("select * from comment where com_num = #{com_num}")
	public List<CommentDto> commentList(CommunityDto dto);
	
	@Update("update community set com_hit=com_hit+1 where com_num = #{com_num}")
	public void communityhit(CommunityDto dto);
	
	@Select("select * from community where ${searchOption} like concat('%',#{keyword},'%') limit #{pagenum}, #{contentnum}")
	public List<CommunityDto> listAll(String searchOption, String keyword, int pagenum, int contentnum);
	
	@Select("select count(*) from community where ${searchOption} like concat('%',#{keyword},'%') ")
	public int countArticle(String searchOption, String keyword);
}
