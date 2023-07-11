<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css"/>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
</head>
<body>
<div class="container">
    <%@  include file="nav.jsp" %> <!-- 네비게이션 바 -->
    <form method="post">
        <div class="form-group">
            <label>제목</label>
            <input type="text" name="title" value="${view.title}" class="form-control"/>
        </div>

        <div class="form-group">
            <label>작성자</label>
            <input type="text" disabled="disabled" name="writer" value="${view.writer}" class="form-control"/>
        </div>

        <div class="form-group">
            <div id="editor">${view.content}</div>
        </div>

    </form>
    <button id="btn-update" class="btn btn-primary">작성</button>
</div>
<!-- TOAST UI 하이라이트 플러그인 -->
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
<script>
    const Editor = toastui.Editor;
    const editor = new Editor({
        el: document.querySelector("#editor"),
        height: "600px",
        initialEditType: "wysiwyg",
        placeholder: "내용을 입력해주세요",
        language: "ko-KR",
        plugins: [Editor.plugin.codeSyntaxHighlight],
    });


    // 수정 버튼 클릭 시 AJAX
    // Ajax 스크립트
    let index = {
        init: function () {
            $("#btn-update").on("click", () => {
                this.update();
            });
        },

        update: function () {
            let data = {
                title: $("#title").val(),
                writer: $("#writer").val(),
                content: editor.getHTML(),
            }

            console.log(data);


            $.ajax({
                type: "POST",
                url: "/modify",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
            }).done(function () {
                alert("수정이 완료되었습니다.");
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
