package com.project.bangpool.attachment.model.service;

import java.util.ArrayList;

import com.project.bangpool.attachment.model.vo.Attachment;

public interface AttachmentService {

	ArrayList<Attachment> selectTopList();
	ArrayList<Attachment> selectTopList2();

}
