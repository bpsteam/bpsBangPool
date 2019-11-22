package com.project.bangpool.share.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.share.model.vo.Share;

@Repository("srDAO")
public class ShareDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String sLoc) {
		return sqlSession.selectOne("shareMapper.getListCount",sLoc);
	}

	public ArrayList<Share> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String sLoc) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shareMapper.selectList",sLoc,rowBounds);
	}

	public int shareInsert(SqlSessionTemplate sqlSession, Share s) {
		return sqlSession.insert("shareMapper.shareInsert",s);
	}

	public Share shareDetail(SqlSessionTemplate sqlSession, int srbId) {
		return sqlSession.selectOne("shareMapper.shareDetail", srbId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("shareMapper.insertReply",r);
	}

	public ArrayList<Reply> listReply(SqlSessionTemplate sqlSession, int refBid) {
		return (ArrayList)sqlSession.selectList("shareMapper.listReply",refBid);
	}

	public int insertReply_event(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("shareMapper.insertReply_event", map);
	}


	public ArrayList<Member> selectEventMember(SqlSessionTemplate sqlSession, int srbId) {
		return (ArrayList)sqlSession.selectList("shareMapper.selectEventMember",srbId);
	}

	public int insertWinner(SqlSessionTemplate sqlSession, Share s) {
		return sqlSession.update("shareMapper.insertWinner",s);
	}

	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("shareMapper.selectMember",map);
	}

	public ArrayList<Share> mapList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mapMapper.listMap");
	}
}
