<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sm_Task.label', default: 'Sm_Task')}"/>
    <title>
        <g:message code="default.title.website"/>
        -
        <g:message code="default.title.Sm_Task.label"/>
    </title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <g:message code="default.title.Sm_Task.label"/>
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <table id="table_task" class="display">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Plan Start Date</th>
                        <th>Plan End Date</th>
                        <th>Actual Start Date</th>
                        <th>Actual End Date</th>
                        <th>Percent</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sm_TaskList}" var="task">
                        <tr>
                            <td>${task?.name}</td>
                            <td>${task?.plan_startDate}</td>
                            <td>${task?.plan_endDate}</td>
                            <td>${task?.actual_startDate}</td>
                            <td>${task?.actual_endDate}</td>
                            <td>${task?.percent}</td>
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
        $('#table_task').DataTable();
    });
</script>
</body>
</html>