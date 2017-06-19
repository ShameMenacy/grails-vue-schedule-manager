package sm.bipvn

import grails.transaction.Transactional

@Transactional(readOnly = true)
class Sm_UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_User.list(params), model: [sm_UserCount: Sm_User.count()]
    }
}
