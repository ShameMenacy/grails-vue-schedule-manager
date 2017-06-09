package sm.bipvn

class Sm_Task {

    String name
    Date plan_startDate
    Date plan_endDate
    Date actual_startDate
    Date actual_endDate
    Integer task_order
    Integer percent

    Sm_Project project

    static hasMany = [resources: Sm_Resource]

    static constraints = {
        name nullable: false, blank: false, maxSize: 128
        task_order generator: 'identity'
        plan_startDate validator: { val, self ->
            if (val && val > self.plan_endDate) return 'default.invalid.max.message'
        }
        actual_startDate validator: { val, self ->
            if (val && val > self.actual_endDate) return 'default.invalid.max.message'
        }
        percent nullable: false, blank: true, max: 100
    }

    static mapping = {
        sort 'task_order'
        order 'asc'
    }
}
