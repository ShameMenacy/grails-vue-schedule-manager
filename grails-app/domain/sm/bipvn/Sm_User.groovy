package sm.bipvn

class Sm_User {

    String loginId
    String name
    String mailAddress
    Date dateCreated
    Date lastUpdated

    Sm_Project project

    static constraints = {
        loginId size: 5..15, blank: false, unique: true
        name nullable: false, maxSize: 128
        mailAddress email: true, blank: false
    }

    static mapping = {
        autoTimestamp true
        lastUpdated defaultValue: "'9999-12-31 23:59:59'"
        sort 'id'
        order 'asc'
    }
}
