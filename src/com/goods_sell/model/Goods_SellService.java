package com.goods_sell.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.manufacturers.model.ManufacturersVO;

public class Goods_SellService {
	private Goods_SellDAO dao = null;

	public Goods_SellService() {
		dao = new Goods_SellDAO();
	}

	public Goods_SellVO addGoods_Sell(String MF_NO, String GS_NAME, java.sql.Timestamp GS_DATE, Integer GS_PRICE,
			String GS_INFO, byte[] GS_IMG, String GS_STA) {
		Goods_SellVO GSVO = new Goods_SellVO();
		GSVO.setMf_no(MF_NO);
		GSVO.setGs_name(GS_NAME);
		GSVO.setGs_date(GS_DATE);
		GSVO.setGs_price(GS_PRICE);
		GSVO.setGs_info(GS_INFO);
		GSVO.setGs_img(GS_IMG);
		GSVO.setGs_sta(GS_STA);

		dao.insert(GSVO);

		return GSVO;
	}

	public Goods_SellVO updateGoods_Sell(String GS_NO, String MF_NO, String GS_NAME, java.sql.Timestamp GS_DATE,
			Integer GS_PRICE, String GS_INFO, byte[] GS_IMG, String GS_STA) {

		Goods_SellVO GSVO = new Goods_SellVO();
		GSVO.setGs_no(GS_NO);
		GSVO.setMf_no(MF_NO);
		GSVO.setGs_name(GS_NAME);
		GSVO.setGs_date(GS_DATE);
		GSVO.setGs_price(GS_PRICE);
		GSVO.setGs_info(GS_INFO);
		GSVO.setGs_img(GS_IMG);
		GSVO.setGs_sta(GS_STA);

		dao.update(GSVO);
		return GSVO;
	}

	public void deleteGoods_Sell() {
	}

	public List<Goods_SellVO> getAll() {

		return dao.getAll();
	}

	public Goods_SellVO getOne(String gs_no) {

		return dao.findByPrimaryKey(gs_no);
	}

	public List<Goods_SellVO> findByType(String type) {
		
		return dao.findByType(type);
	}

	public List<String> getcountbymf(List<ManufacturersVO> list2) {

		return dao.getcountbymf(list2);
	}

	public List<Goods_SellVO> findByMfType(String type, String Mf_no) {
		
		return dao.finBymf(type, Mf_no);
	}

	public Set<String> findByTypeandList(String type, List<ManufacturersVO> list) {
		Set<String> set = new HashSet<String>();
		for (ManufacturersVO ManufacturersVO : list) {
			String typecount = dao.findByType(type, ManufacturersVO.getMF_NO());
			Integer count = Integer.valueOf(typecount);
			if (count > 0) {
				String typemf = String.format("%s(%s)", ManufacturersVO.getMF_NAME(), typecount);
				set.add(typemf);
			}
		}
		System.out.println(set);
		return set;
	}

}
