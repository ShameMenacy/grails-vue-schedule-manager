package sm.bipvn

import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional()
class Sm_ProjectController {

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        [sm_ProjectList: Sm_Project.list(), sm_ProjectCount: Sm_Project.count()]
    }

    def show(Sm_Project sm_Project) {
        if (sm_Project == null) {
            notFound()
            return
        }
        flash.flgMode = Const.FLG_MODE_SHOW
        respond sm_Project
    }

    def create() {
        flash.flgMode = Const.FLG_MODE_ADD
        respond new Sm_Project(params)
    }

    @Transactional
    def save(Sm_Project sm_Project) {
        if (sm_Project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_Project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_Project.errors, view: 'create'
            return
        }

        sm_Project.save flush: true

        redirect sm_Project
    }

    def edit(Sm_Project sm_Project) {
        flash.flgMode = Const.FLG_MODE_UPDATE
        respond sm_Project
    }

    @Transactional
    def update(Sm_Project sm_Project) {
        if (sm_Project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_Project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_Project.errors, view: 'edit'
            return
        }

        sm_Project.save flush: true

        flash.flgMode = Const.FLG_MODE_SHOW
        redirect sm_Project
    }

    @Transactional
    def delete(Sm_Project sm_Project) {

        if (sm_Project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        try {
            sm_Project.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sm_Project.label', default: 'SM Project'), sm_Project.name])
            redirect(action: "index")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'SM Project'), sm_Project.id])
            redirect(action: "show", id: id)
        }
    }

    protected void notFound() {
        flash.errorMessage = message(code: 'default.not.found.message', args: [message(code: 'default.title.Sm_Project.label'), params.id])
        redirect action: 'index'
    }
}
