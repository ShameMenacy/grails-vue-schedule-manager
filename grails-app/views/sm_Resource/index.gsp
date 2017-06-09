<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sm_Resource.label', default: 'Sm_Resource')}"/>
    <title>
        <g:message code="default.title.website"/>
        -
        <g:message code="default.title.Sm_Resource.label"/>
    </title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <g:message code="default.title.Sm_Resource.label"/>
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="usertable" class="container">
                    <p>
                        <strong>Lorem Ipsum </strong>is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </p>
                    <h3>Configuration</h3>
                    <p>
                        Use this table to see real-time editing of the column names, widths, sorting, grouping and the calculation of totals. You can also toggle edit mode and line numbers.
                    </p>
                    <div class="grid-row" layout="row top-stretch">
                        <div class="grid-cell">
                            <toggle id="line-numbers" v-model="conf.lineNumbers">Line Numbers</toggle>
                            <toggle id="editable" v-model="conf.editable">Editable</toggle>
                            <toggle id="show-reserved" v-model="conf.showReserved">Show Reserved</toggle>
                        </div>
                    </div>
                    <div class="grid-row" layout="row top-stretch">
                        <div class="grid-cell" layout="row">
                            <input type="text" placeholder="Type here to filter resource name" self="size-x1"
                                   v-model="conf.filter">
                        </div>
                    </div>
                    <div class="grid-row" layout="row top-stretch">
                        <div class="grid-cell">
                            <paginator :source="users.data" :page-size="3" :filter="conf.filter">
                                <template scope="user">
                                    <datatable  id="user-table"
                                                :source="user.data"
                                                :filterable="false"
                                                :striped="conf.striped"
                                                :editable="conf.editable"
                                                :line-numbers="conf.lineNumbers">
                                        <datatable-column
                                                    v-for="col in users.columns"
                                                    :id="col.id"
                                                    :label="col.label"
                                                    :sortable="conf.sortable"
                                                    :groupable="conf.groupable">
                                        </datatable-column>
                                    </datatable>
                                </template>
                            </paginator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var formatters = vuetiful.formatters;

    var conf = {
        sortable: true,
        striped: true,
        editable: false,
        lineNumbers: false,
        showReserved: false,
        filter: null
    };

    var data = ${raw(users)}.filter(function(user){
        return user.reserved == 0;
    });

    var users = {
        columns: [
            { id: "name", label: "Name" },
            { id: "reserved", label: "Reserved" }
        ],
        data: data,
        selected: []
    };

    new Vue({
        el: "#usertable",

        data: {
            users: users,
            conf: conf
        },

        computed: {

            selectAll: {
                get: function () {
                    return users.selected.length == user.data.length;
                },
                set: function (value) {
                    users.selected = value ? user.data : [];
                }
            }

        },

        methods: {
            deleteCustomer: function() {
                window.confirm("You are about to delete . Are you sure?");
            }
        },

        mounted() {
            setTimeout(function() {
                introJs().start();
            }, 1000);
        }
    });
</script>
</body>
</html>