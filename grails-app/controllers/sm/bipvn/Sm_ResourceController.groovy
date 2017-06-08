package sm.bipvn

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Sm_ResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_Resource.list(params), model:[sm_ResourceCount: Sm_Resource.count()]
    }

    def show(Sm_Resource sm_Resource) {
        respond sm_Resource
    }

    def create() {
        respond new Sm_Resource(params)
    }

    @Transactional
    def save(Sm_Resource sm_Resource) {
        if (sm_Resource == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_Resource.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_Resource.errors, view:'create'
            return
        }

        sm_Resource.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sm_Resource.label', default: 'Sm_Resource'), sm_Resource.id])
                redirect sm_Resource
            }
            '*' { respond sm_Resource, [status: CREATED] }
        }
    }

    def edit(Sm_Resource sm_Resource) {
        respond sm_Resource
    }

    @Transactional
    def update(Sm_Resource sm_Resource) {
        if (sm_Resource == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sm_Resource.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sm_Resource.errors, view:'edit'
            return
        }

        sm_Resource.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sm_Resource.label', default: 'Sm_Resource'), sm_Resource.id])
                redirect sm_Resource
            }
            '*'{ respond sm_Resource, [status: OK] }
        }
    }

    @Transactional
    def delete(Sm_Resource sm_Resource) {

        if (sm_Resource == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sm_Resource.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sm_Resource.label', default: 'Sm_Resource'), sm_Resource.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sm_Resource.label', default: 'Sm_Resource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
