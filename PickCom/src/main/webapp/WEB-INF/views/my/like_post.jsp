<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layout/myLayout.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PickCom:견적추천 커뮤니티</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<main>
		<div
			class="position-absolute top-50 start-50 translate-middle h-75 d-inline-block" style="width: 1000px;">
			<h2>추천한 글</h2>
			<!-- 목록 테이블 -->
			<table border="1" width="90%" class="table">
				<thead class="table-light">
					<tr>
						<th width="10%" scope="col">분류</th>
						<th width="*" scope="col">제목</th>
						<th width="15%" scope="col">작성자</th>
						<th width="10%" scope="col">작성일</th>
						<th width="8%" scope="col">조회수</th>
						<th width="8%" scope="col">추천수</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${ empty boardLists }">
						<tr>
							<td colspan="6" align="center">추천한 글이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ boardLists }" var="row" varStatus="loop">
							<tr align="center">
								<td>${ row.board_category }<input type="hidden"
									value="${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}" />
								</td>
								<td align="left"><a
									href="../board/view.do?idx=${ row.board_no }">${ row.board_title }</a>
								</td>
								<td>${ row.member_name }</td>
								<td>${ row.board_createDate }</td>
								<td>${ row.board_visitCount }</td>
								<td>${ row.like_count }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="row">
				<div class="col text-center">${ map.pagingImg }</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>