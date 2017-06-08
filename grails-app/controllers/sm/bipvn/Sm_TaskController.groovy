package sm.bipvn

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Sm_TaskController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_Task.list(params), model:[sm_TaskCount: Sm_Task.count()]
    }

    def show(Sm_Task sm_Task) {
        respond sm_Task
    }

    def create() {
        respond new Sm_Task(params)
    }

    @Transactional
    def save(Sm_Task sm_Task) {
        if (sm_Task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_Task.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_Task.errors, view:'create'
            return
        }

        sm_Task.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), sm_Task.id])
                redirect sm_Task
            }
            '*' { respond sm_Task, [status: CREATED] }
        }
    }

    def edit(Sm_Task sm_Task) {
        respond sm_Task
    }

    @Transactional
    def update(Sm_Task sm_Task) {
        if (sm_Task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_Task.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_Task.errors, view:'edit'
            return
        }

        sm_Task.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), sm_Task.id])
                redirect sm_Task
            }
            '*'{ respond sm_Task, [status: OK] }
        }
    }

    @Transactional
    def delete(Sm_Task sm_Task) {

        if (sm_Task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sm_Task.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), sm_Task.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
