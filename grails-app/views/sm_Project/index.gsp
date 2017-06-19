<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sm_Project.label', default: 'Sm_Project')}"/>
    <title>
        <g:message code="default.title.website"/>
        -
        <g:message code="default.title.Sm_Project.label"/>
    </title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <g:message code="default.title.Sm_Project.label"/>
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <table id="table_project" class="display">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Date Created</th>
                        <th>Last Update</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sm_ProjectList}" var="project">
                        <tr>
                            <td>${project.name}</td>
                            <td>${project.dateCreated}</td>
                            <td>${project.lastUpdated}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready( function () {
        $('#table_project').DataTable();
    } );
</script>
</body>
</html>