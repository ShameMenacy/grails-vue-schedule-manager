<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sm_User.label', default: 'Sm_User')}"/>
    <title>
        <g:message code="default.title.website"/>
        -
        <g:message code="default.title.Sm_User.label"/>
    </title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <g:message code="default.title.Sm_User.label"/>
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="user" class="container">
                    <p>
                        <strong>A project administrator</strong> is a professional who organizes the
                        necessary team members and specializes in facilitating, reporting and analyzing projects under
                        the supervision of a project manager
                    </p>
                    <table id="table_id" class="display">
                        <thead>
                        <tr>
                            <th>Login ID</th>
                            <th>Name</th>
                            <th>Mail Address</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${sm_UserList}" var="user">
                            <tr>
                                <td>${user.loginId}</td>
                                <td>${user.name}</td>
                                <td>${user.mailAddress}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready( function () {
        $('#table_id').DataTable();
    } );
</script>
</body>
</html>