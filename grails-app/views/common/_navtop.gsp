<g:set var="userInfo" value="${session?.userInfo}"/>
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/">Schedule Management System</a>
</div>
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-right">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-messages">
            <li>
                <a href="#">
                    <div>
                        <strong>John Smith</strong>
                            <span class="pull-right text-muted">
                                <em>Yesterday</em>
                            </span>
                    </div>
                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>Read All Messages</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <!-- /.dropdown-messages -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-tasks">
            <g:each in="${userProjects}" var="userProject" status="idx">
                <g:set var="complete" value="${userProject.complete()}"/>
                <li>
                    <a href="${createLink(mapping:'smProject', action: 'tasks', id: userProject.id)}">
                        <div>
                            <p>
                                <strong>${userProject.name}</strong>
                                <span class="pull-right text-muted">${complete}% Complete</span>
                            </p>
                            <div class="progress progress-striped active">
                                <g:if test="${complete < 30}">
                                    <g:set var="progress" value="danger"/>
                                </g:if>
                                <g:elseif test="${complete < 70}">
                                    <g:set var="progress" value="warning"/>
                                </g:elseif>
                                <g:elseif test="${complete < 95}">
                                    <g:set var="progress" value="info"/>
                                </g:elseif>
                                <g:else>
                                    <g:set var="progress" value="success"/>
                                </g:else>
                                <div class="progress-bar progress-bar-${progress}" role="progressbar"
                                     aria-valuenow="${complete}"
                                     aria-valuemin="0" aria-valuemax="100" style="width: ${complete}%">
                                    <span class="sr-only">${complete}% Complete (success)</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
            </g:each>
            <li>
                <a class="text-center" href="${createLink(mapping:'smProject', action: 'list')}">
                    <strong>See All Tasks</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <!-- /.dropdown-tasks -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-alerts">
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-comment fa-fw"></i> New Comment
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                        <span class="pull-right text-muted small">12 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-tasks fa-fw"></i> New Task
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>See All Alerts</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <!-- /.dropdown-alerts -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user">
            <g:hiddenField name="userId" id="userId" value="${userInfo.id}"/>
            <g:hiddenField name="userName" id="userName" value="${userInfo.name}"/>
            <li><a href="${createLink(mapping:'smUser', action: 'show', id: userInfo.id)}"><i
                    class="fa fa-user fa-fw"></i> User Profile</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="${createLink(controller:'auth', action: 'logout')}">
                    <i class="fa fa-sign-out fa-fw"></i> Logout
                </a>
            </li>
        </ul>
        <!-- /.dropdown-user -->
    </li>
    <!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->