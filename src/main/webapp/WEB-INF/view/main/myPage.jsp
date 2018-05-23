<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {

		$("#testModal").modal()

	});
	
	
	  $(".checkId").click(function(e) {
   	   var id= e.target.getAttribute('data-id');
   	   console.log(id);
   	    $(".modal-body").load("<c:url value="/api/modal"/>/"+id);
	  });
	  
</script>

<title>myPage modal</title>
</head>
<body>

마이페이지 모달 나와야 해
{% block start-footer %}

<div class="modal" id="testModal" tabindex="-1" role="dialog">

	<div class="modal-dialog modal-sm">

		<div class="modal-content">

			{% endblock %} {% block modal-header %}



			{% endblock %} {% block modal-body %}

			<div class="modal-body">



				<h1> modal test </h1>



			</div>

			{% endblock %} {% block modal-footer %}

			<div class="modal-footer">

				<button type="button" class="btn" data-dismiss="modal">닫기</button>

			</div>

			{% endblock %} {% block end-footer %}

		</div>

	</div>

</div>

</body>
</html>