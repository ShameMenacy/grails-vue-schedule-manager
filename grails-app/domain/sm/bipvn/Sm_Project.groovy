package sm.bipvn

class Sm_Project {
    String name
    Date dateCreated
    Date lastUpdated

    static hasOne = [task: Sm_Task]

    Sm_User owner

    static constraints = {
        owner unique: true
        name nullable: false, blank: false
        task nullable: true
    }

    static mapping = {
        autoTimestamp true
        sort 'id'
        order 'asc'
    }
}
