package sm.bipvn

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Sm_ProjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_Project.list(params), model:[sm_ProjectCount: Sm_Project.count()]
    }

    def show(Sm_Project sm_Project) {
        respond sm_Project
    }

    def create() {
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
            respond sm_Project.errors, view:'create'
            return
        }

        sm_Project.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sm_Project.label', default: 'Sm_Project'), sm_Project.id])
                redirect sm_Project
            }
            '*' { respond sm_Project, [status: CREATED] }
        }
    }

    def edit(Sm_Project sm_Project) {
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
            respond sm_Project.errors, view:'edit'
            return
        }

        sm_Project.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sm_Project.label', default: 'Sm_Project'), sm_Project.id])
                redirect sm_Project
            }
            '*'{ respond sm_Project, [status: OK] }
        }
    }

    @Transactional
    def delete(Sm_Project sm_Project) {

        if (sm_Project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sm_Project.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sm_Project.label', default: 'Sm_Project'), sm_Project.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sm_Project.label', default: 'Sm_Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
