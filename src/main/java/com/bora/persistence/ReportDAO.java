package com.bora.persistence;

import java.util.List;

import com.bora.domain.CardPayVO;
import com.bora.domain.ReportVO;
import com.bora.domain.openbank.TranVO;
import com.bora.domain.openbank.card.CardDetailBillsVO;

public interface ReportDAO {
//	public void insertReport(TranVO vo);
	

	// 가계부 수기작성
	public void insertReport2(ReportVO revo);

}