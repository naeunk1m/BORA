package com.bora.persistence;

import java.util.List;

import com.bora.domain.board.PageVO;
import com.bora.domain.report.BookDetailVO;
import com.bora.domain.report.BookVO;

public interface BookDAO {
	
	public Integer writeBook(BookVO book, Integer bk_detail_num) throws Exception;

	public List<BookVO> getBookListAll(String loginID) throws Exception;
	
	public List<BookVO> getBookListPage(PageVO vo) throws Exception;

	public Integer getBookCnt() throws Exception;
	

}
