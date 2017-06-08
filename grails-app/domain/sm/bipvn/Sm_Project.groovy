package sm.bipvn

class Sm_Project {
    String name
    Date dateCreated
    Date lastUpdated

    Sm_Task task

    static hasOne = [owner: Sm_User]

    static constraints = {
        owner unique: true
        name nullable: false, blank: false
    }

    static mapping = {
        autoTimestamp true
        sort 'id'
        order 'asc'
    }
}
