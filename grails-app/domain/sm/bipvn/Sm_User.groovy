package sm.bipvn

import grails.rest.Resource

class Sm_User {

    String loginId
    String mailAddress
    String name
    Date dateCreated
    Date lastUpdated

    static constraints = {
        loginId size: 5..15, blank: false, unique: true
        mailAddress email: true, blank: false, unique: true
        name nullable: false, maxSize: 128
    }

    static mapping = {
        autoTimestamp true
        sort 'id'
        order 'asc'
        dateCreated defaultValue: "now()"
        lastUpdated defaultValue: "'9999-12-31 23:59:59'"
    }
}
