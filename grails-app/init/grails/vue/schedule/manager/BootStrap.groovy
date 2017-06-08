package grails.vue.schedule.manager

import sm.bipvn.Sm_Resource

class BootStrap {

    def init = { servletContext ->
        if (Sm_Resource.count() == 0) {
            new Sm_Resource(name: 'OAA', reserved: 1).save()
        }
    }
    def destroy = {
    }
}
