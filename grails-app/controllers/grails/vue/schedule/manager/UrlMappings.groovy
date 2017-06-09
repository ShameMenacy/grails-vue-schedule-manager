package grails.vue.schedule.manager

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

        // Using for mappings URL starting with /admin/$controller
        name smProject: "/sm/project/$action?/$id?(.$format)?"(controller: 'sm_Project')
        name smResource: "/sm/resource/$action?/$id?(.$format)?"(controller: 'sm_Resource')
        name smTask: "/sm/task/$action?/$id?(.$format)?"(controller: 'sm_Task')
        name smUser: "/sm/user/$action?/$id?(.$format)?"(controller: 'Sm_User')
    }
}
