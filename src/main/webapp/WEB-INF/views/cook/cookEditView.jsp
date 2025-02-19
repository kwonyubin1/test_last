 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="<c:url value="/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" />"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    
    <!-- Main Content -->
    <section id="main2">
    <section class="page-section" id="contact">
        <div class="container">
            <form action="<c:url value='/cookBoardEditDo' />" method="post" onsubmit="return fn_check()" enctype="multipart/form-data">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>제목</th>
                        <td><input class="form-control input-sm" type="text" name="ckTitle" required="required">${cook.ckTitle}</td>
                    </tr>
                    <tr>
                        <th>썸네일</th>
                        <td><input class="form-control input-sm" type="file" name="file" required="required">${cook.ckImage}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea class="form-control input-sm" name="ckContent" id="boContent">${cook.ckContent}</textarea></td>
                    </tr>
                   <input type="hidden" name="ckNo" value="${cook.ckNo}"/>
                    <tr>
                     	<td colspan="2">
                     		<button type="submit" class="btn btn-primary">전송</button>
                     	</td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
    </section>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    
</body>
<script type="text/javascript">
	var oEditors = [];
	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef :oEditors
		   ,elPlaceHolder: "boContent" // 수정
		   ,sSkinURI : "<c:url value='/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html' />"
		   ,htParams: {
			   bUseToolbar : true
			  ,bUseVerticalResier : true
			  ,bUseModeChanger : true
		      ,bSkipXssFilter   : true
		      ,fOnBeforeUnload 	: function(){
		    	  alert("전송!");
		      }
		   },
		   	fCreator : 'createSEditor2'
		});
	});
	
	function fn_check() {
	    oEditors.getById['boContent'].exec("UPDATE_CONTENTS_FIELD", []);
	    let content = document.getElementById('boContent').value;
	    if (
	        content == '' || content == null || content.trim() == '' ||
	        content == '&nbsp;' || content == '<p>&nbsp;</p>'
	    ) {
	        alert("내용을 입력하세요!!");
	        return false;
	    } else {
	        if (confirm("전송할까요?")) {
	            alert("전송하였습니다.");
	        } else {
	            return false;
	        }
	    }
	}
</script>
</html>