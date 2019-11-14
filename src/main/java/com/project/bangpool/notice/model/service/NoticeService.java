package com.project.bangpool.notice.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.notice.model.vo.Notice;

public interface NoticeService {

	int insert_Notice(Notice n);

	ArrayList<Notice> selectList(PageInfo pi);

	Notice detail_Notice(int nId);

	int delete_Notice(int nId);

	int getListCount();

	ArrayList<Notice> selectSearchNotice(SearchCondition sc, PageInfo pi);

	int getSearchListCount(SearchCondition sc);

	int updateNotice(Notice n, Notice notice);

	int updateFileNotice(Notice n, Notice notice);


	

}
