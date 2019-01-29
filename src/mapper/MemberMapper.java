package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {

	@Insert("insert into member (id,pass,name,gender,email,tel,picture,birth,address,remember)"
				+" values(#{id},#{pass},#{name},#{gender},#{email},#{tel},#{picture},#{birth},#{address},#{remember})")
	int insert(Member mem);

	@Update("update member "
			+ " set address=#{address}, remember=#{remember}, email=#{email}, tel=#{tel}, picture=#{picture} where id=#{id}")
	int update(Member mem);
	
	@Delete("delete from boardall where id=#{id}")
	boolean delete2(String id);

	@Delete("delete from member where id=#{id}")
	int delete(String id);
	
	@Delete("delete from accompany where id=#{id}")
	boolean delete3(String id);
	
	@Delete("delete from comment where id=#{id}")
	boolean delete4(String id);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatepass(Map<String, String> map);

}
