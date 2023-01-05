<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="../include/header.jsp" %>

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
      <div class="panel-heading">게시물 수정하기</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-lg-6">
            <form role="form" method="post" action="/board/modify">
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
                  id="bno"
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
                />
              </div>
              <div class="form-group">
                <label>내용</label>
                <textarea
                  name="content"
                  id="bContent"
                  class="form-control"
                  rows="5"
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
              <!-- 페이지 번호와 페이지 당 표시할 게시물 수를 파라미터로 추가 -->
              <input type="hidden" name="pageNum" value="${cri.pageNum }" />
              <input type="hidden" name="amount" value="${cri.amount }" />

              <!-- 검색타입과 검색어도 파라미터로 추가 -->
              <input type="hidden" name="type" value="${cri.type }" />
              <input type="hidden" name="keyword" value="${cri.keyword }" />

              <button
                type="submit"
                data-oper="list"
                formaction="/board/list"
                formmethod="get"
                class="btn btn-primary"
              >
                목록으로
              </button>
              <button
                data-oper="remove"
                onclick="handleDeleteBtn()"
                id="rmvBtn"
                class="btn btn-danger"
              >
                삭제하기
              </button>
              <button
                id="modBtn"
                type="submit"
                data-oper="modify"
                class="btn btn-warning"
              >
                수정하기
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

<!-- image 시작 -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">image</div>
      <div class="panel-body">
        <div class="uploadDiv">
          <input type="file" name="uploadFile" multiple />
          <hr />

          <!-- 업로드 결과출력 창 -->
          <div class="uploadResult">
            <ul></ul>
          </div>

          <!-- 썸네일 이미지 원본 표시 창 -->
          <div class="originImgDiv">
            <div class="originImg"></div>
          </div>
        </div>
        <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->

  <div>hihiihihiihihi</div>

  <%@include file="../include/footer.jsp" %>

  <script type="text/javascript">
    var bno = "${bvo.bno}";

    //START 파일첨부 관련함수
    var bnoVal = "${bvo.bno}";
    //파일첨부 관련

    //업로드 결과 출력 함수
    const resultUL = $(".uploadResult ul");
    function showUploadFile(result) {
      let tag = "";

      $(result).each(function (i, obj) {
        //서버로 전송할 데이터를 li태그 안에 넣기
        tag +=
          "<li data-folder='" +
          obj.upFolder +
          "' data-uuid='" +
          obj.uuid +
          "' data-filename='" +
          obj.fileName +
          "' data-image='" +
          obj.image +
          "'> ";

        if (obj.image) {
          let thumbImg = encodeURIComponent(
            obj.upFolder + "/s_" + obj.uuid + "_" + obj.fileName
          );

          //썸네일 이미지 클릭 시 원본 이미지 표시
          let originImg = obj.upFolder + "\\" + obj.uuid + "_" + obj.fileName;
          originImg = originImg.replace(new RegExp(/\\/g), "/");

          tag +=
            "<img src='/display?fileName=" +
            thumbImg +
            "' onclick=\"showOriginal('" +
            originImg +
            "')\"/><br>" +
            (i + 1) +
            ". " +
            obj.fileName +
            " <span data-file='" +
            thumbImg +
            "' data-type='image' class='btn btn-warning btn-circle'>" +
            "<i class='fa fa-times'></i></span> </li>";
        } else {
          let filePath = encodeURIComponent(
            obj.upFolder + "/" + obj.uuid + "_" + obj.fileName
          );
          tag +=
            "<img src='/resources/imgs/attach.png'/> </a> <br>" +
            (i + 1) +
            ". " +
            obj.fileName +
            "<span data-file='" +
            filePath +
            "' data-type='file' class='btn btn-warning btn-circle'>" +
            "<i class='fa fa-times'></i> </span> </li> ";
        }
      });

      resultUL.html(tag);
    }

    // json 데이터 타입으로 업로드한 파일정보 받기
    $.getJSON("/board/attachList", { bno: bnoVal }, function (result) {
      console.log(result);
      showUploadFile(result);
    });

    //X버튼 클릭시 이미지 삭제
    $(".uploadResult").on("click", "span", function () {
      console.log($(this).data("file"));
      console.log($(this).data("type"));

      $.ajax({
        type: "post",
        url: "/deleteFile",
        data: { fileName: $(this).data("file"), type: $(this).data("type") },
        dataType: "text",
        success: function (result) {
          alert(result);
        },
      });

      $(this).parent().remove();
    });

    //수정버튼 클릭시 이벤트 처리
    $("#modBtn").click(function (e) {
      e.preventDefault();
      let tag = "";
      let lis = resultUL.children("li");
      lis.each(function (i, obj) {
        tag +=
          "<input type='hidden' name='attachList[" +
          i +
          "].fileName' " +
          "value='" +
          $(obj).data("filename") +
          "'> " +
          "<input type='hidden' name='attachList[" +
          i +
          "].upFolder' " +
          "value='" +
          $(obj).data("folder") +
          "'> " +
          "<input type='hidden' name='attachList[" +
          i +
          "].uuid' " +
          "value='" +
          $(obj).data("uuid") +
          "'> " +
          "<input type='hidden' name='attachList[" +
          i +
          "].image' " +
          "value='" +
          $(obj).data("image") +
          "'> ";
      });
      console.log(tag);
      $("form[role='form']").append(tag);
      $("form[role='form']").submit();
    });

    // END 파일첨부 관련함수

    function handleDeleteBtn(e) {
      if (confirm("정말로 삭제하시겠습니까?")) {
        $("#rmvBtn").attr("formaction", "/board/remove");
        submit();
      } else {
        $("#rmvBtn").attr("formaction", "/board/modify");
        $("#rmvBtn").attr("formmethod", "get");
        return false;
      }
    }
  </script>
</div>
