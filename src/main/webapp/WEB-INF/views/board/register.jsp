<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시물 작성
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="post" action="/board/register">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input name="title" id="bTitle" class="form-control" placeholder="제목(필수입력)">
                                        </div>
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea name="content" id="bContent" class="form-control" rows="5"></textarea>
                                        </div>                                        
                                        <div class="form-group">
                                            <label>작성자</label>
                                            <input name="writer" id="bWriter" class="form-control">
                                        </div>
                                        <a id="resetBtn" class="btn btn-outline-dark" onclick="handleResetBtn()">리셋</a>
                                        <a href="/board/list" class="btn btn-warning">취소</a>
                                        <button class="btn btn-primary">제출</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
                   

<%@include file="../include/footer.jsp" %>

<script type="text/javascript">
function handleResetBtn() {
	  $("#bTitle").val("");
	  $("#bContent").val("");
	  $("#bWriter").val("");
	}

</script>

