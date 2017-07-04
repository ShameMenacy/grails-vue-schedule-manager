package sm.bipvn

class Sm_Project {

    String name
    String title
    String description
    Date dateCreated
    Date lastUpdated

    Sm_User owner

    static hasMany = [tasks: Sm_Task]

    static constraints = {
        name nullable: false, blank: false
        title nullable: false, blank: false
        description nullable: true, blank: true
        tasks nullable: true
        owner nullable: true
    }

    static mapping = {
        description type: "text"
        autoTimestamp true
        sort 'dateCreated'
        order 'desc'
        tasks sort: 'task_order', order: 'asc'
    }

    def complete(){
//        tasks.percent.sum() / tasks.size()
        Math.abs(new Random().nextInt() % 100) + 1
    }
}
