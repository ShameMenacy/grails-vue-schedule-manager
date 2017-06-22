package grails.vue.schedule.manager


class AuthenticationInterceptor {
    AuthenticationInterceptor() {
        matchAll()
                .excludes(controller: "auth")
    }
    /**
     * Executed before a matched action
     *
     * @return Whether the action should continue and execute
     */
    boolean before() {
        if (!session.userInfo) {
            redirect(controller: "auth")
            return false
        }
        return true
    }

    /**
     * Executed after the action executes but prior to view rendering
     *
     * @return True if view rendering should continue, false otherwise
     */
    boolean after() { true }

    /**
     * Executed after view rendering completes
     */
    void afterView() {
        // no-op
    }
}
