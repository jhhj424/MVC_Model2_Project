package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Accompany;
import model.Board;

public interface AccompanyMapper {

	@Insert(" insert into accompany "
			+ " (id,num,chk) "
			+ " values(#{id},#{num},1)")
	int insert(Board board);
	
	@Select("select num from accompany where id=#{id}")
	List<Integer> selectnum(String id);

	@Select("select * from accompany where id=#{id}")
	List<Accompany> accompanylist(String id);
	
	@Select("select * from accompany where num=#{num}")
	List<Accompany> accompanylist2(int num);
	
	@Select("select id from accompany where num=#{num}")
	List<String> selectid(int num);
	
	@Update("update accompany set chk = 2 where id=#{id} and num=#{num}")
	int chkupdate(Board board);
	
	@Update("update accompany set chk = 3 where id=#{id} and num=#{num}")
	int chkupdate2(Board board);
	
	@Select("select * from accompany where id=#{id}")
	Accompany select(String id);

	@Delete("delete from accompany where num=#{num} and id=#{id}")
	int delete(Board board);
}
