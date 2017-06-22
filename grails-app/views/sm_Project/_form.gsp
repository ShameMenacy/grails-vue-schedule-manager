<g:set var="flgMode" value="${flash?.flgMode}"/>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <g:if test="${(sm.bipvn.Const.FLG_MODE_ADD == flgMode)}">
                    <h4 class="text-info">プロジェクト作成画面</h4>
                </g:if>
                <g:if test="${(sm.bipvn.Const.FLG_MODE_SHOW == flgMode)}">
                    <h4 class="text-info">プロジェクト表示画面</h4>
                </g:if>
                <g:if test="${(sm.bipvn.Const.FLG_MODE_UPDATE == flgMode)}">
                    <h4 class="text-info">プロジェクト更新画面</h4>
                </g:if>
            </div>
            <div class="panel-body">
                <g:form>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Name</label>
                                <g:field type="text" class="form-control"
                                         readonly="${sm.bipvn.Const.FLG_MODE_SHOW == flgMode ?'true':'false'}"
                                         name="name" value="${sm_Project?.name}"/>
                                <p class="help-block">※Project Name</p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Title</label>
                                <g:field type="text" class="form-control"
                                         readonly="${sm.bipvn.Const.FLG_MODE_SHOW == flgMode ?'true':'false'}"
                                         name="title" value="${sm_Project?.title}"/>
                                <p class="help-block">※プロジェクト名</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>Description</label>
                                <g:textArea class="form-control" name="description"
                                            readonly="${(sm.bipvn.Const.FLG_MODE_SHOW == flgMode) ?'true':'false'}"
                                            value="${sm_Project?.description}" rows="5"/>
                                <p class="help-block">※プロジェクト内容</p>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-offset-4">
                            <g:hiddenField name="id" value="${sm_Project?.id}" />
                            <g:hiddenField name="version" value="${sm_Project?.version}" />
                            <g:if test="${(sm.bipvn.Const.FLG_MODE_ADD == flgMode)}">
                                <g:actionSubmit action="save" mapping="smProject" name="save"
                                                value="${message(code: 'default.button.create.label', default: 'Create')}"
                                                class="btn btn-outline btn-danger"/>
                            </g:if>
                            <g:if test="${(sm.bipvn.Const.FLG_MODE_UPDATE == flgMode)}">
                                <g:actionSubmit action="update" mapping="smProject" name="update"
                                                value="${message(code: 'default.button.update.label', default: 'Update')}"
                                                class="btn btn-outline btn-danger"/>
                            </g:if>
                            <g:if test="${(sm.bipvn.Const.FLG_MODE_SHOW == flgMode)}">
                                <g:actionSubmit action="edit" mapping="smProject" name="edit"
                                                value="${message(code: 'default.button.edit.label', default: 'Edit')}"
                                                class="btn btn-outline btn-danger"/>
                            </g:if>
                            <g:if test="${(sm.bipvn.Const.FLG_MODE_ADD != flgMode)}">
                                <g:actionSubmit mapping="smProject" action="delete" name="delete"
                                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                class="btn btn-outline btn-danger" formnovalidate=""
                                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                            </g:if>
                            <g:link class="btn btn-outline btn-danger" action="index" formnovalidate="">
                                <g:if test="${(sm.bipvn.Const.FLG_MODE_SHOW == flgMode)}">
                                    <g:message code="default.button.confirm.label"/>
                                </g:if>
                                <g:else>
                                    <g:message code="default.button.back.label"/>
                                </g:else>
                            </g:link>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </g:form>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->