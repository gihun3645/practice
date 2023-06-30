<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
</head>
<body>
    <div id="nav">
        <%@ include file="nav.jsp"  %>
    </div>
    <table>
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
    <div>
    
        <c:if test="${page.prev}">
            <span>[ <a href="/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
        </c:if>
        
        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            <span>
            
                <c:if test="${select != num}">
                    <a href="/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
                </c:if>
                <c:if test="${select == num}">
                    <b>${num}</b>
                </c:if>
                
            </span>
        </c:forEach>
        
        <c:if test="${page.next}">
            <span>[ <a href="/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span> 
        </c:if>
        
        <div>
            <select name="searchType">
                <option value="title" <c:if test="${page.searchType eq 'title'}">seelcted</c:if>>제목</option>
                <option value="content" <c:if test="${page.searchType eq 'content'}">seelcted</c:if>>내용</option>
                <option value="title_content" <c:if test="${page.searchType eq 'tilte_content'}">seelcted</c:if>>제목+내용</option>
                <option value="writer" <c:if test="${page.searchType eq 'writer'}">seelcted</c:if>>작성자</option>
            </select>
            <input type="text" name="keyword" value="${page.keyword }"/>
            <button type="button" id="searchBtn">검색</button>
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
