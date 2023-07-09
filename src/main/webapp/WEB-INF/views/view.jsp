<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <%--토스트 UI--%>
    <!-- Editor's Style -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css"/>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
    <!-- 토스트 UI viewer css -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css"/>
    <!-- TOAST UI 하이라이트 플러그인 -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/themes/prism.min.css"
    />
    <link
            rel="stylesheet"
            href="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight.min.css"
    />
    <script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
    <title>게시물 조회</title>
</head>
<body>
<div id="nav" class="mb-5">
    <%@ include file="nav.jsp" %>
</div>

<div class="container">
    <h2 class="mb-4">${view.title}</h2>

    <hr/>

    <div class="writer mb-3">
        <span>작성자 : </span><strong>${view.writer}</strong>
    </div>

    <hr/>

    <div class="form-group" id="viewer">
        ${view.content}
    </div>

    <hr/>

    <div class="mb-4">
            <a href="/modify?board_id=${view.board_id}" class="btn btn-warning">게시물 수정</a>
            <a href="/delete?board_id=${view.board_id}" class="btn btn-danger">게시물 삭제</a>
    </div>

    <!-- 댓글 시작 -->
    <hr/>

    <ul class="list-unstyled">
        <c:forEach items="${reply}" var="reply">
            <li class="mb-3 p-3 border rounded">
                <div>
                    <p><strong>${reply.writer}</strong> / ${reply.reg_date}</p>
                    <p>${reply.content}</p>

                    <p>
                        <a href="/reply_modify?board_id=${view.board_id}&reply_id=${reply.reply_id}" class="btn btn-sm btn-warning">수정</a>
                        <a href="/reply/delete?board_id=${view.board_id}&reply_id=${reply.reply_id}" class="btn btn-sm btn-danger">삭제</a>
                    </p>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="my-5">
        <form method="post" action="/reply/write">
            <div class="form-group">
                <label>댓글 작성자</label>
                <input type="text" name="writer" class="form-control">
            </div>
            <div class="form-group">
                <textarea rows="5" class="form-control" name="content"></textarea>
            </div>
            <div class="form-group">
                <input type="hidden" name="board_id" value="${view.board_id}">
                <button type="submit" class="btn btn-primary">댓글 작성</button>
            </div>
        </form>
    </div>

    <script>

    </script>

    <!-- 댓글 끝 -->
</div>


<!-- Toast UI viewer -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
<!-- Toast UI 하이라이트 플러그인 -->
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
<script>

    const viewer = new toastui.Editor({
        el: document.querySelector('#viewer'),
        viewer: true,
    });


</script>
</body>
</html>
