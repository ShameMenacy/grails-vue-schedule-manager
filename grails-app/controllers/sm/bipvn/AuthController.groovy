package sm.bipvn

import org.apache.commons.lang.StringUtils

class AuthController {
    def authenticationService

    def index() {
        render view: '/login'
    }

    def login() {
        def userInfoMap = [:]
        userInfoMap['loginId'] = params['loginId']
        userInfoMap['mailAddress'] = params['mailAddress']
        userInfoMap['name'] = params['name']
        def query = "from Sm_User as u where u.loginId=:loginId and u.mailAddress=:mailAddress and u.name=:name"
        def userInfo = Sm_User.find(query, userInfoMap)
        if (!userInfo) {
            def authFlg = "dummy" // dummy || product
            if (StringUtils.equals(authFlg, "dummy")) {
                def user = new Sm_User(userInfoMap).save(flush: true, failOnError: true)
                session.userInfo = user
            }
        } else {
            session.userInfo = userInfo
        }
        redirect(uri: "/")
    }

    def logout() {
        session.invalidate()
        render view: '/logout'
    }
}
