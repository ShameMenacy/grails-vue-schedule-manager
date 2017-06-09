package sm.bipvn

import grails.rest.Resource

@Resource(uri='/sm/resources', formats=['json', 'xml'])
class Sm_Resource {

    String name
    Integer reserved

    static hasMany = [tasks: Sm_Task]
    static belongsTo = Sm_Task

    static constraints = {
        name nullable: false, blank: false, maxSize: 128
        reserved defaultValue: 0
    }

    static mapping = {
        sort 'id'
        order 'desc'
    }
}
