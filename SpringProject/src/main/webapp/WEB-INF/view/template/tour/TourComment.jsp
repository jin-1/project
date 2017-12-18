<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<c:if test="${empty comment}"> 
				등록된 리뷰가 없습니다. <br>
				소중한 경험을 리뷰로 남겨주세요!<br>
				<p></p>
				리뷰 등록 <input type="text" size=80 name="commentAdd" id="commentAdd"/> <input type="submit" id="submitButton" value="등록">
				<p></p>
			</c:if>
			<c:if test="${not empty comment}">
				<c:forEach var="comment" items="${comment}" varStatus="status">
					${comment.memberId}&nbsp;&nbsp;
					<fmt:formatDate value="${comment.commentDate}" type="date" pattern="yyyy-MM-dd"/><br>
					${comment.content}<br><br>
				</c:forEach>
				리뷰 등록 <input type="text" size=80 name="commentAdd" id="commentAdd" /> <input type="submit" id="submitButton" value="등록">
				<p></p>
			</c:if>