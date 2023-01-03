<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <h3>Spring file upload with AJAX</h3>
    <div class="uploadDiv">
      <input type="file" name="uploadFile" multiple />
      <hr />
      <button id="uploadBtn">upload</button>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script>
      // 파일 종류(exe, sh, zip) 및 크기 (5MB) 제한
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880;

      function uploadCheck(fileName, fileSize) {
        if (regex.test(fileName)) {
          //확장자 확인
          alert("해당 형식의 파일은 업로드하실 수 없습니다");
          return false;
        }

        if (fileSize >= maxSize) {
          alert("업로드 허용 크기 초과(5MB) - 업로드 불가");
          return false;
        }
        return true;
      }

      $("#uploadBtn").on("click", function (event) {
        let formData = new FormData(); // form처럼 key/value로 값 생성 가능
        let files = $("input[name='uploadFile']")[0].files;

        //formDate 객체에 파일 추가
        for (var i = 0; i < files.length; i++) {
          if (!uploadCheck(files.name, files.size)) {
            continue;
          } else {
            formData.append("uploadFile", files[i]);
          }
        }

        $.ajax({
          type: "post",
          url: "/upload/ajaxAction",
          data: formData,
          contentType: false,
          processData: false,
          success: function (result) {
            console.log("upload ok!");
          },
        });
      });
    </script>
  </body>
</html>
