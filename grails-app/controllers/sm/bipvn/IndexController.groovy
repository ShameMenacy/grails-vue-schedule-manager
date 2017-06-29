package sm.bipvn

import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo

class IndexController {

    def index() {
        render(view: "/index", model: [projectCount : Sm_Project.count(),
                                       taskCount    : Sm_Task.count(),
                                       userCount    : Sm_User.count(),
                                       resourceCount: Sm_Resource.count()])
    }

    @MessageMapping("/chat")
    @SendTo("/topic/chat")
    protected String message(String message) {
        return "${message}"
    }
}
