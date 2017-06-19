package sm.bipvn

import grails.rest.Resource

class Sm_Project {

    String name
    Date dateCreated
    Date lastUpdated

    Sm_User owner

    static hasMany = [task: Sm_Task]

    static constraints = {
        name nullable: false, blank: false
        task nullable: true
        owner nullable: true
    }

    static mapping = {
        autoTimestamp true
        sort 'id'
        order 'asc'
    }
}
