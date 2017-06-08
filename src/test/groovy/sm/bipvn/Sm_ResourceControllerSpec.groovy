package sm.bipvn

import grails.test.mixin.*
import spock.lang.*

@TestFor(Sm_ResourceController)
@Mock(Sm_Resource)
class Sm_ResourceControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.sm_ResourceList
            model.sm_ResourceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.sm_Resource!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def sm_Resource = new Sm_Resource()
            sm_Resource.validate()
            controller.save(sm_Resource)

        then:"The create view is rendered again with the correct model"
            model.sm_Resource!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            sm_Resource = new Sm_Resource(params)

            controller.save(sm_Resource)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/sm_Resource/show/1'
            controller.flash.message != null
            Sm_Resource.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def sm_Resource = new Sm_Resource(params)
            controller.show(sm_Resource)

        then:"A model is populated containing the domain instance"
            model.sm_Resource == sm_Resource
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def sm_Resource = new Sm_Resource(params)
            controller.edit(sm_Resource)

        then:"A model is populated containing the domain instance"
            model.sm_Resource == sm_Resource
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/sm_Resource/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def sm_Resource = new Sm_Resource()
            sm_Resource.validate()
            controller.update(sm_Resource)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.sm_Resource == sm_Resource

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            sm_Resource = new Sm_Resource(params).save(flush: true)
            controller.update(sm_Resource)

        then:"A redirect is issued to the show action"
            sm_Resource != null
            response.redirectedUrl == "/sm_Resource/show/$sm_Resource.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/sm_Resource/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def sm_Resource = new Sm_Resource(params).save(flush: true)

        then:"It exists"
            Sm_Resource.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(sm_Resource)

        then:"The instance is deleted"
            Sm_Resource.count() == 0
            response.redirectedUrl == '/sm_Resource/index'
            flash.message != null
    }
}
