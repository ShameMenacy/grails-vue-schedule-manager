package sm.bipvn

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Sm_UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_User.list(params), model:[sm_UserCount: Sm_User.count()]
    }

    def show(Sm_User sm_User) {
        respond sm_User
    }

    def create() {
        respond new Sm_User(params)
    }

    @Transactional
    def save(Sm_User sm_User) {
        if (sm_User == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_User.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_User.errors, view:'create'
            return
        }

        sm_User.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sm_User.label', default: 'Sm_User'), sm_User.id])
                redirect sm_User
            }
            '*' { respond sm_User, [status: CREATED] }
        }
    }

    def edit(Sm_User sm_User) {
        respond sm_User
    }

    @Transactional
    def update(Sm_User sm_User) {
        if (sm_User == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_User.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_User.errors, view:'edit'
            return
        }

        sm_User.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sm_User.label', default: 'Sm_User'), sm_User.id])
                redirect sm_User
            }
            '*'{ respond sm_User, [status: OK] }
        }
    }

    @Transactional
    def delete(Sm_User sm_User) {

        if (sm_User == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sm_User.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sm_User.label', default: 'Sm_User'), sm_User.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sm_User.label', default: 'Sm_User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
