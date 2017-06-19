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
                    <vuetable ref="vuetable"
                              api-url="/sm/user"
                              :fields="fields"
                              :css="css.table"
                              pagination-path=""
                              :per-page="10"
                              @vuetable:pagination-data="onPaginationData"
                              @vuetable:loading="onLoading"
                              @vuetable:loaded="onLoaded"
                    >
                        <template slot="actions" scope="props">
                            <div class="table-button-container">
                                <button class="btn btn-info btn-sm" @click="viewUser(props.rowData)">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                                <button class="btn btn-warning btn-sm" @click="editUser(props.rowData)">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </button>
                                <button class="btn btn-danger btn-sm" @click="deleteUser(props.rowData)">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </button>
                            </div>
                        </template>
                    </vuetable>
                    <vuetable-pagination ref="pagination"
                                         :css="css.pagination"
                                         @vuetable-pagination:change-page="onChangePage"
                    ></vuetable-pagination>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
Vue.use(Vuetable);

new Vue({
    el: '#user',
    components: {
        'vuetable-pagination': Vuetable.VuetablePagination
    },
    data: {
        fields: [{
                name: 'loginId',
                title: 'Username',
                sortField: 'loginId'
            }, {
                name: 'name',
                title: 'Name',
                sortField: 'name'
            },{
                name: 'mailAddress',
                title: 'Mail Address',
                sortField: 'mailAddress'
            },
            'dateCreated', 'lastUpdated',
            '__slot:actions'
        ],
        css: {
            table: {
                tableClass: 'table table-striped table-bordered table-hovered',
                loadingClass: 'loading',
                ascendingIcon: 'glyphicon glyphicon-chevron-up',
                descendingIcon: 'glyphicon glyphicon-chevron-down',
                handleIcon: 'glyphicon glyphicon-menu-hamburger',
            },
            pagination: {
                infoClass: 'pull-left',
                wrapperClass: 'vuetable-pagination pull-right',
                activeClass: 'btn-primary',
                disabledClass: 'disabled',
                pageClass: 'btn btn-border',
                linkClass: 'btn btn-border',
                icons: {
                    first: '',
                    prev: '',
                    next: '',
                    last: '',
                },
            }
        }
    },
    computed: {
        /*httpOptions(){
          return {headers: {'Authorization': "my-token"}} //table props -> :http-options="httpOptions"
        },*/
    },
    methods: {
        onPaginationData(paginationData) {
            this.$refs.pagination.setPaginationData(paginationData)
        },
        onChangePage(page) {
            this.$refs.vuetable.changePage(page)
        },
        viewUser(rowData) {
            alert("You clicked view on" + JSON.stringify(rowData))
        },
        editUser(rowData) {
            alert("You clicked edit on" + JSON.stringify(rowData))
        },
        deleteUser(rowData) {
            alert("You clicked delete on" + JSON.stringify(rowData))
        },
        onLoading() {
            console.log('loading... show your spinner here')
        },
        onLoaded() {
            console.log('loaded! .. hide your spinner here')
        }
    }
})
</script>
</body>
</html>