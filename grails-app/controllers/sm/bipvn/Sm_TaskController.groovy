package sm.bipvn

import grails.converters.JSON
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

class Sm_TaskController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_Task.list(), model: [sm_TaskCount: Sm_Task.count()]
    }

    @Transactional
    def save() {
        def parameters = JSON.parse(params.dataContent)
        def smTask = new Sm_Task(
                project: parameters.task.project,
                name: parameters.task.data.text,
                plan_startDate: parameters.task.data.plan.start_date,
                plan_endDate: parameters.task.data.plan.end_date,
                actual_startDate: parameters.task.data.actual.start_date,
                actual_endDate: parameters.task.data.actual.end_date
        )
        if (smTask == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (smTask.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond smTask.errors
            return
        }
        smTask.save flush: true
        render status: OK
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
            respond sm_Task.errors, view: 'edit'
            return
        }

        sm_Task.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), sm_Task.id])
                redirect sm_Task
            }
            '*' { respond sm_Task, [status: OK] }
        }
    }

    @Transactional
    def delete(Sm_Task sm_Task) {

        if (sm_Task == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sm_Task.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), sm_Task.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sm_Task.label', default: 'Sm_Task'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
