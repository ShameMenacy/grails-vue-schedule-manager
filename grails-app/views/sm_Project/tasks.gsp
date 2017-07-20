<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:message code="default.title.website"/>
        -
        <g:message code="default.title.Sm_Project.label"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
</head>
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>

<style type="text/css">
html, body {
    margin: 0px;
    padding: 0px;
    height: 100%;
    overflow: hidden;
}

#project_scheduler {
    width: auto;
    height: 85%;
}
</style>

<g:javascript>
    $(document).ready(function() {
        loadConf();
        scheduler.init('project_scheduler', new Date(), "agenda");
        var events = initData();
        scheduler.parse(events, "json"); //takes the name and format of the data source
    });

    scheduler.attachEvent("onEventAdded", function(id,ev) {
        var entries = {
            'task': {
                'project': $('#projectId').val(),
                'data': scheduler.getEvent(id)
            }
        };
        var targetUrl = '${g.createLink(mapping: 'smTask', action: 'save')}';
        dhtmlxAjax.post(targetUrl, "dataContent=" + JSON.stringify(...[entries]), function(message){
            dhtmlx.message({ text:"Your data has been successfully saved!"});
        });
    });

    scheduler.attachEvent("onEventChanged", function(id,ev) {
        var entries = {
            'task': {
                'project': $('#projectId').val(),
                'data': scheduler.getEvent(id)
            }
        };
        var targetUrl = '${g.createLink(mapping: 'smTask', action: 'update')}';
        dhtmlxAjax.post(targetUrl, "dataContent=" + JSON.stringify(...[entries]), function(message){
            dhtmlx.message({ text:"Your data has been successfully changed!"});
        });
    });

    scheduler.attachEvent("onEventDeleted", function(id,ev) {
        var entries = {
            'task': {
                'id': id
            }
        };
        var targetUrl = '${g.createLink(mapping: 'smTask', action: 'delete')}';
        dhtmlxAjax.post(targetUrl, "dataContent=" + JSON.stringify(...[entries]), function(message){
            dhtmlx.message({ text:"Your data has been successfully deleted!"});
        });
    });

    scheduler.attachEvent("onLimitViolation", function  (id, obj){
        dhtmlx.message('The date is not allowed (between 3year ago to 3year from now)');
    });

    function loadConf() {
        scheduler.templates.calendar_month = scheduler.date.date_to_str("%Y, %M");
        scheduler.templates.calendar_time = scheduler.date.date_to_str("%Y-%M-%d");
        scheduler.config.agenda_start = new Date(new Date().setFullYear(new Date().getFullYear() - 1));      // 1 year ago
        scheduler.config.agenda_end = new Date();
        scheduler.config.limit_start = new Date(new Date().setFullYear(new Date().getFullYear() - 3));       // 3 year ago
        scheduler.config.limit_end = new Date(new Date().setFullYear(new Date().getFullYear() + 3));         // 3 year from now

        //  sets the max and min values of the time selector in the lightbox
        scheduler.config.limit_time_select = true;
        scheduler.config.first_hour = 8;
        scheduler.config.last_hour = 21;
        scheduler.config.time_step = 60;
        scheduler.config.event_duration = 60;
        scheduler.config.start_on_monday = true;
        scheduler.config.auto_end_date = true;
        scheduler.config.left_border = true;
        scheduler.config.resize_month_events = true;
        // Configuring the Lightbox - Lightbox Controls
        scheduler.config.lightbox.sections = [
            { name:"name", map_to:"text", type:"textarea", default_value:"Input task's name...", focus:true},
            { name:"plan", type:"calendar_time", map_to:"plan"}
        ];
        scheduler.locale.labels.year_tab ="Year";
        scheduler.locale.labels.agenda_tab="Agenda";
        scheduler.locale.labels.section_name = "Task Name"
        scheduler.locale.labels.section_plan = "Task Plan"
        scheduler.locale.labels.section_actual = "Task Actual"

        // Configuring the message
        dhtmlx.message.position="bottom";
        dhtmlx.message.expire = 5000; //time in milliseconds
    }

    function initData() {
        var jsonTask = [];
        <g:each in="${project?.tasks}" var="task">
            jsonTask.push({
                id: ${task.id},
                text: '${task.name.encodeAsJavaScript()}',
                start_date: "${formatDate(format: 'MM/dd/yyyy HH:mm', date: task.plan_startDate ?: new Date())}",
                end_date: "${formatDate(format: 'MM/dd/yyyy HH:mm', date: task.plan_endDate ?: new Date())}"
            });
        </g:each>
        return JSON.stringify(jsonTask);
    };

    function show_minical(){
        if (scheduler.isCalendarVisible()){
            scheduler.destroyCalendar();
        } else {
            scheduler.renderCalendar({
                position:"dhx_minical_icon",
                date:scheduler._date,
                navigation:true,
                handler:function(date,calendar){
                    scheduler.setCurrentView(date);
                    scheduler.destroyCalendar()
                }
            });
        }
    };
</g:javascript>

<body>
<g:render template="/common/header"/>
<g:hiddenField name="projectId" id="projectId" value="${project?.id}"/>
<div id="project_scheduler" class="dhx_cal_container">
    <div class="dhx_cal_navline col-lg-12">
        <div class="dhx_cal_prev_button">&nbsp;</div>

        <div class="dhx_cal_next_button">&nbsp;</div>

        <div class="dhx_cal_today_button"></div>

        <div class="dhx_cal_date"></div>

        <div class="dhx_minical_icon" id="dhx_minical_icon" onclick="show_minical()">&nbsp;</div>

        <div class="dhx_cal_tab" name="day_tab"></div>

        <div class="dhx_cal_tab" name="week_tab"></div>

        <div class="dhx_cal_tab" name="month_tab"></div>

        <div class="dhx_cal_tab" name="year_tab"></div>

        <div class="dhx_cal_tab" name="agenda_tab"></div>
    </div>

    <div class="dhx_cal_header">
    </div>

    <div class="dhx_cal_data">
    </div>
</div>
<br/>
<g:render template="/common/footer"/>
<!-- /#wrapper -->
</body>