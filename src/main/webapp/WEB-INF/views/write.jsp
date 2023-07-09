<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%--    JQuery & Bootstrap--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
    <title>게시물 작성</title>
</head>
<body>
<div class="container">
    <div id="nav" class="mb-4">
        <%@  include file="nav.jsp" %>
    </div>
    <c:if test="${msg != 'login_error'}">
        <form>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="제목을 입력 하세요." id="title">
            </div>

            <div class="form-group">
                <div class="form-control" id="editor"></div>
            </div>

            <!-- Hidden input field for the username -->
            <input type="hidden" id="username" value="${username}">


        </form>
        <button id="btn-save" class="btn btn-primary">작성</button>
    </c:if>

    <c:if test="${msg == 'login_error'}">
        <p>로그인을 하셔야 글을 작성할 수 있습니다.</p>
        <p><a href="/">홈으로</a></p>
    </c:if>
</div>
<script>
    // 에디터 스크립트
    const Editor = toastui.Editor;
    const editor = new Editor({
            el: document.querySelector("#editor"),
            height: "600px",
            initialEditType: "wysiwyg",
            placeholder: "내용을 입력해주세요",
            language: "ko-KR",
            plugins: [Editor.plugin.codeSyntaxHighlight],
        }
    );

    // Ajax 스크립트
    let index = {
        init: function () {
            $("#btn-save").on("click", () => {
                this.save();
            });
        },

        save: function () {
            let data = {
                title: $("#title").val(),
                writer: $("#username").val(),
                content: editor.getHTML(),
            }

            console.log(data);


            $.ajax({
                type: "POST",
                url: "/write",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
            }).done(function () {
                alert("글쓰기가 완료되었습니다.");
                location.href = "/listPageSearch?num=1";
            }).fail(function (error) {
                alert(JSON.stringify(error));
                console.log(error);
            })
        }
    }

    index.init();
</script>
</body>
</html>
