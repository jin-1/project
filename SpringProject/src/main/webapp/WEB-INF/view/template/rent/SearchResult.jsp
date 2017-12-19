<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
 			<table>
				<c:if test="${not empty result}">  
					<c:forEach var="prd" items="${result}" varStatus="status">
						<tr id="prodcutTable">
							<td id="photo"><a href="ProductIndex?prdName=${prd.prdName}" id="image"><img height="150" width="150" src="img/prd/${prd.prdImg }.jpg"></a></td>
							<td id="details">
								<label id="name" >${prd.prdName }</label><br>
								<label id="price">${prd.prdPrice } 원</label><br/>
								<label id="stack">무료배송</label>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty result}">  
					<tr><td>등록된 상품이 없습니다.<br/>다시 검색하시기 바랍니다.</td></tr>
				</c:if>
			</table> 