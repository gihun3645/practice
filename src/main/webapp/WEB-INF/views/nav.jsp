<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<style>

	/*전체 글, 글 작성 링크*/
	.p-2.text-dark:hover {
		background-color: #f4f6fb;
		text-decoration: none;
		border-radius: 5px;
		transition: all 0.3s ease;
	}

	/*메인화면 링크*/
	.legacy-board-link:hover {
		background-color: #f4f6fb;
		text-decoration: none;
		border-radius: 5px;
		transition: all 0.3s ease;
	}


</style>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
	<h5 class="my-0 mr-md-auto font-weight-normal"><a class="legacy-board-link" href="/">Legacy Board</a></h5>
	<nav class="my-2 my-md-0 mr-md-3">
		<a class="p-2 text-dark" href="/listPageSearch?num=1">전체 글</a>
		<a class="p-2 text-dark" href="/write">글 작성</a>
	</nav>
	<a class="btn btn-outline-primary" href="#">Sign up</a>
</div>