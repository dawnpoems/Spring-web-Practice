<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

   <div class="row">
       <div class="col-lg-12">
           <h1 class="page-header">Board Modify</h1>
       </div>
       <!-- /.col-lg-12 -->
   </div>
   <!-- /.row -->
   <div class="row">
       <div class="col-lg-12">
           <div class="panel panel-default">
               <div class="panel-heading">
                   게시물 수정하기
               </div>
               <div class="panel-body">
                   <div class="row">
                       <div class="col-lg-6">
                           <form role="form" method="post" action="/board/modify">
                           	<div class="text-right">작성일 : <fmt:formatDate value="${bvo.regDate }" pattern="yyyy-MM-dd (E)"/></div>
                               <div class="form-group">
                                   <label>번호</label>
                                   <input name="bno" id="bno" value="${bvo.bno }" class="form-control" readonly="readonly">
                               </div>
                               <div class="form-group">
                                   <label>제목</label>
                                   <input name="title" id="bTitle" value="${bvo.title }" class="form-control">
                               </div>
                               <div class="form-group">
                                   <label>내용</label>
                                   <textarea name="content" id="bContent" class="form-control" rows="5">${bvo.content }</textarea>
                               </div>                                        
                               <div class="form-group">
                                   <label>작성자</label>
                                   <input name="writer" id="bWriter" class="form-control" value="${bvo.writer }" readonly="readonly">
                               </div>
                               <!-- 페이지 번호와 페이지 당 표시할 게시물 수를 파라미터로 추가 -->
                               <input type="hidden" name="pageNum" value="${cri.pageNum }" />
				   			   <input type="hidden" name="amount" value="${cri.amount }" />
				   			   
				   			   <!-- 검색타입과 검색어도 파라미터로 추가 -->
					   			<input type="hidden" name="type" value="${cri.type }" />
					   			<input type="hidden" name="keyword" value="${cri.keyword }" />
                               
                               <button type="submit" data-oper="list" formaction="/board/list" formmethod="get" class="btn btn-primary">목록으로</button>
                               <button data-oper="remove" onclick="handleDeleteBtn()" id="rmvBtn" class="btn btn-danger">삭제하기</button>
                               <button type="submit" data-oper="modify" class="btn btn-warning">수정하기</button>
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

var bno = "${bvo.bno}"

function handleDeleteBtn(e) {
	if (confirm("정말로 삭제하시겠습니까?")){
		$("#rmvBtn").attr("formaction", "/board/remove")
		submit();
	} else {
		$("#rmvBtn").attr("formaction", "/board/modify")
		$("#rmvBtn").attr("formmethod", "get")
		return false;
	}
	  
	}

</script>

