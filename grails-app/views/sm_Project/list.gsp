<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sm_Project.label', default: 'Project')}"/>
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

<g:each in="${sm_ProjectList}" var="project" status="idx">
    <a href="${createLink(mapping:'smProject', action: 'show', id: project.id)}">
        <div class="${ ((idx + 1) % 3) == 0 ?'row':'' }">
            <div class="col-lg-4">
                <div class="panel">
                    <div class="panel-heading">
                        ${project.title}
                        <a href="${createLink(mapping:'smProject', action: 'delete', id: project.id)}" class="close fa fa-times" data-dismiss="alert" aria-label="close"></a>
                    </div>
                    <div class="panel-body">
                        ${project.description ?: 'BLANK'}
                    </div>
                    <div class="panel-footer">
                        <g:formatDate format="yyyy-MM-dd" date="${project.dateCreated}"/>
                    </div>
                </div>
            </div>
        </div>
    </a>
</g:each>
<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <g:link class="btn btn-outline btn-danger btn-lg btn-block" action="create">
            <g:message code="default.new.label" args="[entityName]"/>
        </g:link>
    </div>
</div>
<script type="text/javascript">
var panelClass = ['panel-default', 'panel-success', 'panel-info', 'panel-warning', 'panel-danger'];

$(".panel").each(function(e){
    classIndex = Math.floor(Math.random() * panelClass.length);
    $(this).addClass(panelClass[classIndex]);
})
</script>
</body>
</html>