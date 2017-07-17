package sm.bipvn

import grails.converters.JSON
import grails.transaction.Transactional

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

class Sm_TaskController {

    def dateFormater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")

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
                plan_startDate: parameters.task.data.start_date,
                plan_endDate: parameters.task.data.end_date
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

    @Transactional
    def update() {
        def parameters = JSON.parse(params.dataContent)
        def smTask = Sm_Task.get(parameters.task.data.id)

        if (smTask == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        smTask.name = parameters.task.data.text
        smTask.plan_startDate = Date.parse("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", parameters.task.data.start_date)
        smTask.plan_endDate = Date.parse("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", parameters.task.data.end_date)

        if (smTask.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond smTask.errors
            return
        }
        smTask.save flush: true
        render status: OK
    }

    @Transactional
    def delete() {
        def parameters = JSON.parse(params.dataContent)
        def smTask = Sm_Task.get(parameters.task.id)

        if (smTask == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        smTask.delete flush: true
        render status: NO_CONTENT
    }

    def edit(Sm_Task sm_Task) {
        respond sm_Task
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
