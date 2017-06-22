<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="${message(code: 'default.title.website')}"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>
<body>
<div id="wrapper">
    <g:render template="/common/header"/>
    <div id="page-wrapper">

        <g:layoutBody/>
    </div>
    <hr/>
    <g:render template="/common/footer"/>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

</body>
</html>
