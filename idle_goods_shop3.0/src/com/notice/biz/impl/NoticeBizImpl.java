package com.notice.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notice.biz.NoticeBiz;
import com.notice.entity.Notice;
import com.notice.mapper.NoticeMapper;

@Service("noticeBiz")
public class NoticeBizImpl implements NoticeBiz{
	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public void addNotice(Notice notice) {
		noticeMapper.addNotice(notice);
	}

	@Override
	public List<Notice> findNoPage(int index, int size) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("index",index);
		map.put("size",size);
		List<Notice> list = noticeMapper.findNoPage(map);
		return list;
	}

	@Override
	public int countPage() {
		int count = noticeMapper.countPage();
		return count;
	}

	@Override
	public void delNotice(int id) {
		noticeMapper.delNotice(id);
	}

	@Override
	public List<Notice> findBycontent(int index, int size, String n_content) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("index",index);
		map.put("size",size);
		map.put("n_content",n_content);
		List<Notice> list = noticeMapper.findBycontent(map);
		return list;
	}

	@Override
	public int count(String n_content) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("n_content",n_content);
		int count = noticeMapper.count(map);
		return count;
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeMapper.updateNotice(notice);
	}

	@Override
	public Notice findByNoId(int n_id) {
		Notice notice = noticeMapper.findByNoId(n_id);
		return notice;
	}



}
