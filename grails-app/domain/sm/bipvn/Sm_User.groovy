package sm.bipvn

import grails.rest.Resource

@Resource(uri='/sm/users', formats=['json', 'xml'], readOnly=true)
class Sm_User {

    String loginId
    String name
    String mailAddress
    Date dateCreated
    Date lastUpdated

    static hasOne = [project: Sm_Project]

    static constraints = {
        loginId size: 5..15, blank: false, unique: true
        name nullable: false, maxSize: 128
        mailAddress email: true, blank: false
        project nullable: true
    }

    static mapping = {
        autoTimestamp true
        lastUpdated defaultValue: "'9999-12-31 23:59:59'"
        sort 'id'
        order 'asc'
    }
}
