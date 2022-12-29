<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="../include/header.jsp" %>

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
      <div class="panel-heading">게시물 자세히 보기</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-lg-6">
            <div class="text-right">
              작성일 :
              <fmt:formatDate
                value="${bvo.regDate }"
                pattern="yyyy-MM-dd (E)"
              />
            </div>
            <div class="form-group">
              <label>번호</label>
              <input
                name="bno"
                id="bNo"
                value="${bvo.bno }"
                class="form-control"
                readonly="readonly"
              />
            </div>
            <div class="form-group">
              <label>제목</label>
              <input
                name="title"
                id="bTitle"
                value="${bvo.title }"
                class="form-control"
                readonly="readonly"
              />
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea
                name="content"
                id="bContent"
                class="form-control"
                rows="5"
                readonly="readonly"
              >
${bvo.content }</textarea
              >
            </div>
            <div class="form-group">
              <label>작성자</label>
              <input
                name="writer"
                id="bWriter"
                class="form-control"
                value="${bvo.writer }"
                readonly="readonly"
              />
            </div>
            <form role="form" action="/board/modify">
              <!-- 페이지 번호와 페이지 당 표시할 게시물 수를 파라미터로 추가 -->
              <input type="hidden" name="pageNum" value="${cri.pageNum }" />
              <input type="hidden" name="amount" value="${cri.amount }" />

              <!-- 검색타입과 검색어도 파라미터로 추가 -->
              <input type="hidden" name="type" value="${cri.type }" />
              <input type="hidden" name="keyword" value="${cri.keyword }" />

              <input type="hidden" name="bno" value="${bvo.bno }" />
              <button data-oper="modify" class="btn btn-warning">
                수정하기
              </button>
              <button
                data-oper="list"
                formaction="/board/list"
                class="btn btn-primary"
              >
                목록으로
              </button>
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

<!-- 댓글목록 시작 -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i>Reply
        <button id="newBtn" class="btn btn-info btn-xs pull-right">
          댓글 달기
        </button>
      </div>
      <div class="panel-body">
        <!-- 댓글 쓰기 -->
        <div id="newReplyFrm" style="display: none">
          <div class="form-group">
            <label for="replyerInput">작성자</label>
            <input type="text" class="form-control" id="replyerInput" />
          </div>
          <div class="form-group">
            <label for="replyInput">댓글</label>
            <textarea
              name="reply"
              id="replyInput"
              class="form-control"
              rows="3"
            ></textarea>
          </div>
          <div class="text-right">
            <button id="replySubmitBtn" class="btn btn-default">등록</button>
          </div>
        </div>
        <!-- 댓글 쓰기 END -->
        <ul class="chat">
          <!-- replies -->
          <li data-rno="3" onclick="handleReplyClick()">
            <div class="header">
              <strong>user00</strong>
              <small class="pull-right">2022-12-19 11:22 </small>
            </div>
            <div>good job!</div>
          </li>
          <!-- END replies -->
        </ul>

        <hr />
      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- 수정 modal -->
<div
  class="modal fade"
  id="myModal"
  tabindex="-1"
  role="dialog"
  aria-labelledby="myModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-hidden="true"
        >
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>작성자</label>
          <input name="replyer" id="replyer" class="form-control" />
        </div>
        <div class="form-group">
          <label>댓글내용</label>
          <textarea
            name="reply"
            id="reply"
            class="form-control"
            rows="3"
          ></textarea>
        </div>
        <div class="form-group">
          <label>작성 날짜</label>
          <input name="regDate" id="regDate" class="form-control" readonly />
        </div>
      </div>
      <div class="modal-footer">
        <button id="replyRemBtn" type="button" class="btn btn-danger">
          댓글삭제
        </button>
        <button id="replyModBtn" type="button" class="btn btn-warning">
          댓글수정
        </button>
        <button
          id="closeBtn"
          type="button"
          class="btn btn-default"
          data-dismiss="modal"
        >
          Close
        </button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="/resources/js/reply.js"></script>
<script>
  //댓글작성 열고닫기
  $("#newBtn").click(handleReplyAddClick);

  function handleReplyAddClick() {
    if ($("#newReplyFrm").attr("style") == "display: none") {
      $("#newReplyFrm").attr("style", "display: block");
      $("#newBtn").text("댓글작성 닫기");
    } else {
      $("#newReplyFrm").attr("style", "display: none");
      $("#newBtn").text("댓글 달기");
    }
  }

  var bnoVal = "${bvo.bno}";
  const replyUL = $(".chat");

  function makeList(pageNum) {
    replyService.list({ bno: bnoVal, pageNum: pageNum }, function (result) {
      if (result == null || result.length == 0) {
        //댓글이 없는 경우
        replyUL.html("");
      } else {
        //댓글이 있는 경우
        let tag = "";
        for (let i = 0; i < result.length; i++) {
          tag +=
            "<li data-rno='" +
            result[i].rno +
            "'> <div class='header'> <strong>" +
            result[i].replyer +
            "</strong> <small class='pull-right'>" +
            replyService.display(result[i].regDate) +
            "</small> </div> <div>" +
            result[i].reply +
            "</div> </li>";
        }
        replyUL.html(tag);
      }
    });
  }

  makeList(1);

  //댓글 등록
  $("#replySubmitBtn").click(function () {
    let replyerInput = $("#replyerInput").val();
    let replyInput = $("#replyInput").val();

    replyService.register(
      { bno: bnoVal, reply: replyInput, replyer: replyerInput },
      function (result) {
        alert("댓글이 등록되었습니다");
      }
    );
    handleReplyAddClick();
    makeList(1);
    $("#replyerInput").val("");
    $("#replyInput").val("");
  });

  const modal = $("#myModal");

  //댓글 수정창 모달
  replyUL.on("click", "li", function () {
    modal.modal("show");
    let rno = $(this).data("rno");

    replyService.view(rno, function (result) {
      $("#replyer").val(result.replyer);
      $("#reply").val(result.reply);
      $("#regDate").val(replyService.display(result.regDate));
      modal.data("rno", result.rno);
    });
  });

  //댓글 수정
  $("#replyModBtn").click(function () {
    replyService.modify(
      { rno: modal.data("rno"), reply: $("#reply").val() },
      function (result) {
        modal.modal("hide");
        alert("댓글이 수정되었습니다");
        makeList(1);
      }
    );
  });

  //댓글 삭제
  $("#replyRemBtn").click(function () {
    if (confirm("정말로 삭제하시겠습니까?")) {
      replyService.remove(modal.data("rno"), function (result) {
        modal.modal("hide");
        alert("댓글이 삭제되었습니다");
        makeList(1);
      });
    }
  });

  // 댓글 등록 테스트
  // replyService.register(
  //   { bno: bnoVal, reply: "안녕하세요~", replyer: "aaaa" },
  //   function (result) {
  //     alert("댓글이 등록되었습니다");
  //   }
  // );

  //댓글 수정 테스트
  //   replyService.modify({ rno: 8, reply: "댓댓글~" }, function (result) {
  //     alert("댓글이 수정되었습니다");
  //   });

  //댓글 목록 테스트
  //   replyService.list({ bno: bnoVal, pageNum: 1 }, function (result) {
  //     for (let i = 0; i < result.length; i++) {
  //       console.log(result[i]);
  //     }
  //   });

  //댓글 삭제 테스트
  //   replyService.remove(12, function (result) {
  //     alert("댓글이 삭제되었습니다");
  //   });

  // 댓글 하나보기 테스트
  // replyService.view(3, function (result) {
  //   console.log(result);
  // });
</script>

<%@include file="../include/footer.jsp" %>

<script type="text/javascript">
  function handleResetBtn() {
    $("#bTitle").val("");
    $("#bContent").val("");
    $("#bWriter").val("");
  }
</script>
