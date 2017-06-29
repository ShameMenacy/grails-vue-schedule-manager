<!DOCTYPE html>
<html>
<head>
    <title>
        <g:message code="default.title.website"/>
    </title>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Sign In</h3>
                </div>
                <div class="panel-body">
                    <g:form role="form" controller="auth">
                        <fieldset>
                            <div class="form-group">
                                <g:field class="form-control" type="text" name="loginId" placeholder="ユーザID"
                                         min="5" max="15" autofocus="true" value="${user?.loginId}"/>
                            </div>
                            <div class="form-group">
                                <g:field class="form-control" type="email" name="mailAddress" placeholder="メールアドレス"
                                         value="${user?.mailAddress}"/>
                            </div>
                            <div class="form-group">
                                <g:field class="form-control" type="text" name="name" placeholder="担当者名"
                                         value="${user?.name}"/>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <g:field type="checkbox" name="remember"/>
                                    Remember Me
                                </label>
                            </div>
                            <g:hiddenField  name="id" values="${user?.id}"/>
                            <g:actionSubmit class="btn btn-lg btn-success btn-block" value="Login" action="login"/>
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>