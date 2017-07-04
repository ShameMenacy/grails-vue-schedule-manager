package sm.bipvn

class Sm_Resource {

    String name
    Integer reserved = 0

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
