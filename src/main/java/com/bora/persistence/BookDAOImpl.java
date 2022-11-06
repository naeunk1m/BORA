package com.bora.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bora.domain.board.PageMakerVO;
import com.bora.domain.board.PageVO;
import com.bora.domain.report.BookVO;

@Repository
public class BookDAOImpl implements BookDAO{
	
	@Inject
	SqlSession session;
	
	final static String NAMESPACE = "com.bora.mapper.BookMapper";
	
	private static final Logger log = LoggerFactory.getLogger(BookDAOImpl.class);

	@Override
	public Integer writeBook(BookVO book, Integer bk_detail_num) throws Exception {
		log.info("writeBook(vo) 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("book", book);
		map.put("bk_detail_num", bk_detail_num);
		return session.insert(NAMESPACE+".writeBook", map);
	}
	
	@Override
	public List<BookVO> getBookListAll(String loginID) throws Exception {
		log.info("getBookListAll(loginID) 호출");
		return session.selectList(NAMESPACE+".getBookListAll", loginID);
	}

	@Override
	public List<BookVO> getBookListPage(String id, PageMakerVO pm) throws Exception {
		log.info("getBookListPage(vo) 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pm", pm);
		log.info("id: "+id+" pm: "+pm);
		return session.selectList(NAMESPACE+".getBookListPage", map);
	}

	@Override
	public Integer getBookCnt(String loginID) throws Exception {
		log.info("getBookCnt() 호출");
		return session.selectOne(NAMESPACE+".getBookCnt", loginID);
	}

	@Override
	public BookVO getBook(int bk_num, String loginID) throws Exception {
		log.info("getBook(bk_num, loginID) 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bk_num", bk_num);
		map.put("id", loginID);
		return session.selectOne(NAMESPACE+".getBook", map);
	}

	@Override
	public Integer updateBook(BookVO book) throws Exception {
		log.info("updateBook(book) 호출");
		return session.update(NAMESPACE+".updateBook", book);
	}

	@Override
	public int deleteBook(Integer bk_num, String loginID) throws Exception {
		log.info("deleteBook() 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bk_num", bk_num);
		map.put("id", loginID);
		return session.delete(NAMESPACE+".deleteBook", map);
	}
	
}
