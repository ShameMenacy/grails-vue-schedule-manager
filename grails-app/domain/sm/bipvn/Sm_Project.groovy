package sm.bipvn

import grails.rest.Resource

class Sm_Project {

    String name
    String title
    String description
    Date dateCreated
    Date lastUpdated

    Sm_User owner

    static hasMany = [task: Sm_Task]

    static constraints = {
        name nullable: false, blank: false
        title nullable: false, blank: false
        description nullable: true, blank: true
        task nullable: true
        owner nullable: true
    }

    static mapping = {
        description type: "text"
        autoTimestamp true
        sort 'dateCreated'
        order 'desc'
    }
}
