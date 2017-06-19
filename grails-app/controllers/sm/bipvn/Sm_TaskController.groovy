package sm.bipvn

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Sm_TaskController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sm_Task.list(), model: [sm_TaskCount: Sm_Task.count()]
    }

}
