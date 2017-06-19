package sm.bipvn

import grails.rest.Resource

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
        plan_startDate nullable: true, blank: true
        plan_endDate nullable: true, blank: true, validator: { val, self ->
            if (val && val < self.plan_startDate) return 'default.invalid.max.message'
        }
        actual_startDate nullable: true, blank: true
        actual_endDate nullable: true, blank: true, validator: { val, self ->
            if (val && val < self.actual_startDate) return 'default.invalid.max.message'
        }
        task_order generator: 'identity'
        percent nullable: true, blank: true, max: 100
        project nullable: true, blank: true
    }

    static mapping = {
        sort 'task_order'
        order 'asc'
        percent defaultValue: 0
    }
}
