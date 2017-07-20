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
        height: 100%;
        padding: 0px;
        margin: 0px;
        overflow: hidden;
    }

    .weekend {
        background: #ffcccc !important;
        color: white !important;
    }

    .gantt_task_progress {
        text-align: left;
        padding-left: 10px;
        box-sizing: border-box;
        color: white;
        font-weight: bold;
    }

    .progress_danger {
        border: 2px solid #a7a8ac;
        color: #a7a8ac;
        background: #a7a8ac
    }

    .progress_danger .gantt_task_progress {
        background: #d9534f
    }

    .progress_warning {
        border: 2px solid #a7a8ac;
        color: #a7a8ac;
        background: #a7a8ac
    }

    .progress_warning .gantt_task_progress {
        background: #f0ad4e
    }

    .progress_info {
        border: 2px solid #a7a8ac;
        color: #a7a8ac;
        background: #a7a8ac
    }

    .progress_info .gantt_task_progress {
        background: #5bc0de
    }

    /*Additional Elements in the Timeline Area*/
    .gantt_task_line, .gantt_line_wrapper {
        margin-top: -10px;
    }

    .gantt_side_content {
        margin-bottom: -3px;
        padding-right: 3px !important;
    }

    .gantt_task_link .gantt_link_arrow {
        margin-top: -12px
    }

    .gantt_side_content .gantt_right {
        bottom: 0;
    }

    .baseline {
        position: absolute;
        border-radius: 2px;
        opacity: 0.6;
        margin-top: -7px;
        height: 12px;
        background: #ffd180;
        border: 1px solid rgb(255, 153, 0);
    }
</style>
<body>
<g:render template="/common/header"/>
<div id="project_gantt" style='width:100%; height:85%;'></div>
<g:javascript>
    var start_time = new Date('${startTime}');

    $(document).ready(function() {
        loadConf();
        gantt.config.readonly = true;
        gantt.init("project_gantt");
        var tasks = initData();
        gantt.parse(tasks,"json");
    });

    function initData() {
        var projects = {
            data:[
                <g:each in="${sm_ProjectList}" var="project">
                {
                    id:${project.id},
                    text:'${project.name.encodeAsJavaScript()}',
                    start_date:"${formatDate(format: 'yyyy-MM-dd', date: project.start_date() ?: new Date())}",
                    end_date:"${formatDate(format: 'yyyy-MM-dd', date: project.end_date() ?: new Date())}",
                    order:10,
                    resources: "${project?.owner?.name}",
                    progress:${project.complete()},
                    open: ${project.id in userProjects.id}
                },
                    <g:each in="${project.tasks}" var="task">
                    {
                        text: "${task.name.encodeAsJavaScript()}",
                        start_date: "${formatDate(format: 'yyyy-MM-dd', date: task.plan_startDate ?: new Date())}",
                        end_date: "${formatDate(format: 'yyyy-MM-dd', date: task.plan_endDate ?: new Date())}",
                        actual_start: "${formatDate(format: 'yyyy-MM-dd', date: task.actual_startDate ?: new Date())}",
                        actual_end: "${formatDate(format: 'yyyy-MM-dd', date: task.actual_endDate ?: new Date())}",
                        order: ${task.task_order ?: 99999},
                        progress: ${task?.percent / 100},
                        resources: "${task?.resources?.name}",
                        parent: ${project.id}
                    },
                    </g:each>
                </g:each>
            ]
        };
        return projects;
    };

    function loadConf() {
        gantt.config.xml_date="%Y-%m-%d";
        gantt.config.sort = true; //To enable sorting in the Gantt chart
        gantt.config.order_branch = true; //To enable drag-n-drop reordering
        gantt.config.order_branch_free = true; //Drag-n-drop within the whole Gantt structure
        gantt.config.scale_height = 3*15;
        // Additional Elements in the Timeline Area
        gantt.config.task_height = 16;
        gantt.config.row_height = 40;
        gantt.config.scale_unit = "month";
        gantt.config.step = 1;
        gantt.config.date_scale = "%Y %M";
        gantt.config.min_column_width = 20;
        gantt.config.autosize = "XY";
        <!--Setting the min, max values of the scale-->
        gantt.config.start_date = new Date(start_time.getFullYear(), start_time.getMonth(), 1);
        gantt.config.end_date = new Date(start_time.getFullYear(), start_time.getMonth() + 5, 0);         // 6 month from now
        var date_to_str = gantt.date.date_to_str(gantt.config.task_date);
        var today = new Date();
        gantt.addMarker({
            start_date: today,
            css: "today",
            text: "Today",
            title:date_to_str(today)
        });
        <!--Specifying Columns-->
        gantt.config.columns = [
            {name:"text",       label:"Task name",  width:"120", tree: true},
            {name:"resources", label:"Assigned to", align: "center", width:100,
                template: function(item) {
                    if (!item.resources) return "";
                    if (item.resources == "[]") return "Nobody";
                    return item.resources;
                }
            },
            {name:"start_date", label:"Start time",  width:"80", align: "center"},
            {name:"end_date",   label:"End date",   width:'80', align: "center"}
        ];
        gantt.config.subscales = [
            {unit:"day", step:1, date:"%d"}
        ];
        <!--Specifying custom templates-->
        gantt.templates.progress_text = function(start, end, task){
            return "<span style='text-align:left;font-size:11px;'>"+Math.round(task.progress * 100)+ "% </span>";
        };
        gantt.templates.task_cell_class = function(item,date){
            if(date.getDay()==0||date.getDay()==6) { return "weekend"; }
        };
        gantt.templates.task_class = function(st,end,item){
            if(item.$level==0) {return "gantt_project";}
            else if(item.progress<0.30) {return "progress_danger";}
            else if(item.progress<0.70) {return "progress_warning";}
            else if(item.progress<0.95) {return "progress_info";}
            else if(item.progress>0.95) {return "progress_success";}
        };
        gantt.templates.leftside_text = function(start, end, task){ return task.duration + " days"; };
        gantt.templates.rightside_text = function(start, end, task){ return "#" + task.text; };
        gantt.templates.task_text = function(start, end, task){ return ""};

        // Additional Elements in the Timeline Area
        gantt.attachEvent("onTaskLoading", function(task){
            task.actual_start = gantt.date.parseDate(task.actual_start, "xml_date");
            task.actual_end = gantt.date.parseDate(task.actual_end, "xml_date");
            return true;
        });
        gantt.addTaskLayer(function draw_planned(task) {
            if (task.actual_start && task.actual_end) {
                var sizes = gantt.getTaskPosition(task, task.actual_start, task.actual_end);
                var el = document.createElement('div');
                el.className = 'baseline';
                el.style.left = sizes.left + 'px';
                el.style.width = sizes.width + 'px';
                el.style.top = sizes.top + gantt.config.task_height  + 13 + 'px';
                return el;
            }
            return false;
        });
        gantt.config.lightbox.sections = [
            {name: "description", height: 70, map_to: "text", type: "textarea", focus: true},
            {name: "time", height: 72, map_to: "auto", type: "duration"},
            {name: "baseline", height: 72, map_to: {
                start_date: "actual_start", end_date: "actual_end"}, type: "duration"}
        ];
        gantt.locale.labels.section_baseline = "Actual";
    }
</g:javascript>

<br/>
<g:render template="/common/footer"/>
<!-- /#wrapper -->
</body>