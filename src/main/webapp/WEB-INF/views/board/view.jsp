<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

 <div class="row">
     <div class="col-lg-12">
         <h1 class="page-header">Board View</h1>
     </div>
     <!-- /.col-lg-12 -->
 </div>
 <!-- /.row -->
 <div class="row">
     <div class="col-lg-12">
         <div class="panel panel-default">
             <div class="panel-heading">
                 게시물 자세히 보기
             </div>
             <div class="panel-body">
                 <div class="row">
                     <div class="col-lg-6">
                
                         	<div class="text-right">작성일 : <fmt:formatDate value="${bvo.regDate }" pattern="yyyy-MM-dd (E)"/></div>
                             <div class="form-group">
                                 <label>번호</label>
                                 <input name="bno" id="bNo" value="${bvo.bno }" class="form-control" readonly="readonly">
                             </div>
                             <div class="form-group">
                                 <label>제목</label>
                                 <input name="title" id="bTitle" value="${bvo.title }" class="form-control" readonly="readonly">
                             </div>
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea name="content" id="bContent" class="form-control" rows="5" readonly="readonly">${bvo.content }</textarea>
                             </div>                                        
                             <div class="form-group">
                                 <label>작성자</label>
                                 <input name="writer" id="bWriter" class="form-control" value="${bvo.writer }" readonly="readonly">
                             </div>
                         <form role="form" action="/board/modify">
                         <!-- 페이지 번호와 페이지 당 표시할 게시물 수를 파라미터로 추가 -->
                         	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
				   			 <input type="hidden" name="amount" value="${cri.amount }" />
				   			 
				   			<!-- 검색타입과 검색어도 파라미터로 추가 -->
				   			<input type="hidden" name="type" value="${cri.type }" />
				   			<input type="hidden" name="keyword" value="${cri.keyword }" />
				   			
                         	<input type="hidden" name="bno" value="${bvo.bno }">
                             <button data-oper="modify"  class="btn btn-warning">수정하기</button>
                         	<button data-oper="list" formaction="/board/list" class="btn btn-primary">목록으로</button>
                         	
                   
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

