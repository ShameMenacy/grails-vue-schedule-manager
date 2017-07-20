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

    def complete() {
//        tasks.percent.sum() / tasks.size()
        Math.abs(new Random().nextInt(100) / 100)
    }

    def start_date() {
        if (tasks) {
            tasks.sort { it.plan_startDate }.find { it.plan_startDate != null}?.plan_startDate
        }
    }

    def end_date() {
        if (tasks) {
            tasks.sort { it.plan_endDate }.last()?.plan_endDate
        }
    }
}
