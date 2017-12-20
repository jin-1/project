<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
 			<table id="productTable" >
				<c:if test="${not empty result}">  
					<tr>
						<th colspan="3">�˻����</th>
					</tr>
					<c:forEach var="prd" items="${result}" varStatus="status">
						<tr id="itemList" height="140">
							<td id="photo"><a href="ProductIndex?prdName=${prd.prdName}" id="image"><img height="110" width="140" src="img/prd/${prd.prdImg }.jpg"></a></td>
							<td id="details">
								<label id="name" ><a href="ProductIndex?prdName=${prd.prdName}">${prd.prdName }</a></label><br>
								<label id="stack">������</label>
							</td>
							<td>
								<label id="price">${prd.prdPrice } ��</label><br/>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty result}">  
					<tr><td colspan="3">��ϵ� ��ǰ�� �����ϴ�.<br/>�ٽ� �˻��Ͻñ� �ٶ��ϴ�.</td></tr>
				</c:if>
			</table> 