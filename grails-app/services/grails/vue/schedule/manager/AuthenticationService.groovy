package grails.vue.schedule.manager

import grails.transaction.Transactional
import sm.bipvn.Sm_User

@Transactional
class AuthenticationService {

    def doAuthentication() {

    }

    def setAuthority(Map userInfoMap = [:]) {
        def query = "from Sm_User as u where u.loginId=:loginId and u.mailAddress=:mailAddress and u.name=:name"
        def userInfo = Sm_User.findAll(query, userInfoMap)
        if(userInfo){
            session.user = userInfo
        }
    }
}
