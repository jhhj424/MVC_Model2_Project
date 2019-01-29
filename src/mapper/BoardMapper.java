package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Comment;

public interface BoardMapper {

	@Select("select ifnull(max(num),0) from boardall ")
	int maxNum();
	
	@Select("select ifnull(max(cnum),0) from comment ")
	int cmaxNum();
	
	@Select("select * from comment where num = #{num} order by regdate desc limit #{startrow},${limit}")
	List<Comment> commentselectlist(int num);
	
	@Select("select * from comment where cnum = #{cnum}")
	Comment commentselectone(int cnum);

	@Insert(" insert into boardall "
			+ " (num,id,pass,subject,content,country,loc,file1,sdate,edate,regdate,maxpno,readcnt,recmd,type) "
			+ " values(#{num},#{id},#{pass},#{subject},#{content},#{country},#{loc},#{file1},#{sdate},#{edate},now(),#{maxpno},0,#{recmd},#{type})")
	int insert(Board board);

	@Insert(" insert into comment "
			+ " (cnum,num,id,comment,regdate,recmd) "
			+ " values(#{cnum},#{num},#{id},#{comment},now(),0)")
	int commentinsert(Comment comment);

	@Update("update boardall set id = #{id} , content = #{content} , country = #{country} , loc = #{loc} , sdate = #{sdate} , edate = #{edate} , maxpno = #{maxpno} , subject = #{subject} , file1 = #{file1}  where num = #{num}")
	int update(Board board);

	@Update("update boardall set recmd = recmd+1 where num=#{num}")
	int recmd(Board board);

	@Delete("delete from boardall where num=#{num}")
	int delete(int num);
	
	@Delete("delete from comment where num=#{num}")
	int deletecom(int num);
	
	@Delete("delete from comment where cnum=#{cnum}")
	int commentdelete(int cnum);

	@Update("update boardall set readcnt=readcnt+1 where num=#{num}")
	int readcntadd(int num);

	@Delete("delete from accompany where num=#{num}")
	void deleteacom(int num);
}
