<jsp:include page="common/header.jsp"/>


<%@ page import="com.exceed_teste.examples.Constants" %>

<%@ page import="org.jinstagram.Instagram" %>

<%@ page import="org.jinstagram.entity.users.basicinfo.UserInfoData" %>


<%

    Object objInstagram = session.getAttribute(Constants.INSTAGRAM_OBJECT);

    Instagram instagram = null;

    if (objInstagram != null) {
        instagram = (Instagram) objInstagram;
    } else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }


%>


<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Instagram</a>
        </div>       
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-lg-12">
            <h1 class="page-header">User Profile</h1>
        </div>
        <%
            UserInfoData userInfoData = instagram.getCurrentUserInfo().getData();

        %>
        <p class="lead">

            <img src="<%=userInfoData.getProfile_picture()%>"/> <br/>

        <p>Username : <%=userInfoData.getUsername()%>
        </p>     

        <p>Follows : <%=userInfoData.getCounts().getFollows()%>
        </p>

        <p>Followed By : <%=userInfoData.getCounts().getFollwed_by()%>
        </p>

		<%
		//Console
		System.out.println("Username : " + userInfoData.getUsername());
		System.out.println("Follows : " + userInfoData.getCounts().getFollows());
		System.out.println("Followed By : " + userInfoData.getCounts().getFollwed_by());		
		%>


    </div>

    <hr>


<jsp:include page="common/footer.jsp"/>
</div>