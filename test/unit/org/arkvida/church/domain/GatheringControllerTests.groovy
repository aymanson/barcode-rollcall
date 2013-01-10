package org.arkvida.church.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(GatheringController)
@Mock(Gathering)
class GatheringControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gathering/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gatheringInstanceList.size() == 0
        assert model.gatheringInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gatheringInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gatheringInstance != null
        assert view == '/gathering/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gathering/show/1'
        assert controller.flash.message != null
        assert Gathering.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gathering/list'

        populateValidParams(params)
        def gathering = new Gathering(params)

        assert gathering.save() != null

        params.id = gathering.id

        def model = controller.show()

        assert model.gatheringInstance == gathering
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gathering/list'

        populateValidParams(params)
        def gathering = new Gathering(params)

        assert gathering.save() != null

        params.id = gathering.id

        def model = controller.edit()

        assert model.gatheringInstance == gathering
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gathering/list'

        response.reset()

        populateValidParams(params)
        def gathering = new Gathering(params)

        assert gathering.save() != null

        // test invalid parameters in update
        params.id = gathering.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gathering/edit"
        assert model.gatheringInstance != null

        gathering.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gathering/show/$gathering.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gathering.clearErrors()

        populateValidParams(params)
        params.id = gathering.id
        params.version = -1
        controller.update()

        assert view == "/gathering/edit"
        assert model.gatheringInstance != null
        assert model.gatheringInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gathering/list'

        response.reset()

        populateValidParams(params)
        def gathering = new Gathering(params)

        assert gathering.save() != null
        assert Gathering.count() == 1

        params.id = gathering.id

        controller.delete()

        assert Gathering.count() == 0
        assert Gathering.get(gathering.id) == null
        assert response.redirectedUrl == '/gathering/list'
    }
}
