<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
+<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.goods_sell.model.*"%>
<jsp:useBean id="goods_sellSvc" scope="page"
	class="com.goods_sell.model.Goods_SellService" />
<%
	List<Goods_SellVO> list = (List<Goods_SellVO>) request.getAttribute("typelist");
	pageContext.setAttribute("list", list);
%>

<div class="col-sm-9">
	<c:if test="${empty list }">
		<%@ include file="/buycart/page.file"%>
		<c:forEach var="goods_sellVO" items="${goods_sellSvc.getAll()}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<div class="col-sm-6">
				<div class="thumbnail" style="display: inline-block;";>
					<img
						src="<%=request.getContextPath() %>/Image/?table=GOODS_SELL&picturename=${goods_sellVO.getGs_no()}"
						style="display: inline-block; height: 200px; width: 200px;">
					<div style="display: inline-block;">
						<h3>${goods_sellVO.getGs_name()}</h3>
						<p>
						<table style="display: inline-block;">
							<tr>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/goods_sell/goods_sell.do">
										<button type="submit" class="btn btn-info btn-lg"
											style="width: 80px; height: 40px; font-size: 20px;">${goods_sellVO.getGs_price()}</button>
										<input type="hidden" name="gsno"
											value="${goods_sellVO.getGs_no()}"> <input
											type="hidden" name="action" value="getOne">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/orderde_detail/orderde_detail.do">
										<button type="submit" class="btn btn-default btn-xs"
											value="Submit"
											style="width: 80px; height: 40px; font-size: 20px;">
											<span class="glyphicon glyphicon-shopping-cart"
												aria-hidden="true"></span>
										</button>
										<input type="hidden" name="gs_no"
											value="${goods_sellVO.getGs_no()}"> <input
											type="hidden" name="action" value="insertintocartA">
										<input type="hidden" name="amount" value="1">
									</FORM>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</c:forEach>
		<%@ include file="/buycart/page2.file"%>
	</c:if>
</div>
<div class="col-md-9">
	<c:if test="${not empty list }">
		<%@ include file="/buycart/page.file"%>
		<c:forEach var="goods_sellVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<div class="col-md-5">
				<div class="thumbnail" style="display: inline-block;";>
					<h4>${goods_sellVO.getGs_name()}</h4>
					<img
						src="<%=request.getContextPath() %>/Image/?table=GOODS_SELL&picturename=${goods_sellVO.getGs_no()}"
						style="display: inline-block; height: 200px; width: 200px;">
					<div style="display: inline-block;">

						<p>
						<table style="display: inline-block;">
							<tr>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/goods_sell/goods_sell.do">
										<button type="submit" class="btn btn-info btn-lg"
											style="width: 80px; height: 40px; font-size: 20px;">${goods_sellVO.getGs_price()}</button>
										<input type="hidden" name="gsno"
											value="${goods_sellVO.getGs_no()}"> <input
											type="hidden" name="action" value="getOne">
									</FORM>
								</td>
							</tr>
							<tr>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/orderde_detail/orderde_detail.do">
										<button type="submit" class="btn btn-default btn-xs"
											value="Submit"
											style="width: 80px; height: 40px; font-size: 20px;">
											<span class="glyphicon glyphicon-shopping-cart"
												aria-hidden="true"></span>
										</button>
										<input type="hidden" name="gs_no"
											value="${goods_sellVO.getGs_no()}"> <input
											type="hidden" name="action" value="insertintocartA">
										<input type="hidden" name="amount" value="1">
									</FORM>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
		<%@ include file="/buycart/page2.file"%>
	</c:if>
</div>