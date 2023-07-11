<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   <meta charset="UTF-8">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>게시물 목록</title>
</head>
<body>
   <div class="container">
      <div id="nav" class="mb-4">
         <%@ include file="nav.jsp"  %>
      </div>
      <div class="card">
         <table class="table table-striped table-hover">
            <thead>
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성일</th>
                  <th>작성자</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${list}" var="board">
                  <tr>
                     <td>${board.board_id}</td>
                     <td>
                        <a href="/view?board_id=${board.board_id}">${board.title}</a>
                     </td>
                     <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd" /></td>
                     <td>${board.writer}</td>
                     <td>${board.view_count}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
      <div class="input-group">
         <select name="searchType" class="custom-select">
            <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
            <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
            <option value="title_content" <c:if test="${page.searchType eq 'tilte_content'}">selected</c:if>>제목+내용</option>
            <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
         </select>
         <input type="text" name="keyword" value="${page.keyword }" class="form-control" placeholder="검색어"/>
         <div class="input-group-append">
            <button type="button" id="searchBtn" class="btn btn-outline-secondary">검색</button>
         </div>
      </div>

      <div class="d-flex justify-content-center align-items-center mt-3">
         <div class="btn-group">
            <c:if test="${page.prev}">
            <a href="/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="btn btn-outline-secondary">이전</a>
            </c:if>

            <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
               <c:choose>
                  <c:when test="${select == num}">
                     <a href="/listPageSearch?num=${num}${page.searchTypeKeyword}" class="btn btn-secondary">${num}</a>
                  </c:when>
                  <c:otherwise>
                     <a href="/listPageSearch?num=${num}${page.searchTypeKeyword}" class="btn btn-outline-secondary">${num}</a>
                  </c:otherwise>
               </c:choose>
            </c:forEach>

            <c:if test="${page.next}">
            <a href="/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="btn btn-outline-secondary">다음</a>
            </c:if>
         </div>
      </div>
   </div>

   <script>
      // Enter 키로 검색 버튼 작동
      const searchBtn = document.getElementById("searchBtn");
      const keywordInput = document.getElementsByName("keyword")[0];

      // 이벤트 리스너를 등록하여 Enter 키 입력을 감지
      keywordInput.addEventListener("keydown", (e) => {
          if (e.key === "Enter") {
              e.preventDefault(); // 기본 동작방지
              searchBtn.click(); // 검색버튼 클릭
          }
      });

      searchBtn.onclick = () => {
          let searchType = document.getElementsByName("searchType")[0].value;
          let keyword = keywordInput.value;

          console.log(searchType);
          console.log(keyword);

          location.href = "/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
      };
   </script>
</body>
</html>
