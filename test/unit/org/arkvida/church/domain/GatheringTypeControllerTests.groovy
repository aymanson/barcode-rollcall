package org.arkvida.church.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(GatheringTypeController)
@Mock(GatheringType)
class GatheringTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gatheringType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gatheringTypeInstanceList.size() == 0
        assert model.gatheringTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gatheringTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gatheringTypeInstance != null
        assert view == '/gatheringType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gatheringType/show/1'
        assert controller.flash.message != null
        assert GatheringType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gatheringType/list'

        populateValidParams(params)
        def gatheringType = new GatheringType(params)

        assert gatheringType.save() != null

        params.id = gatheringType.id

        def model = controller.show()

        assert model.gatheringTypeInstance == gatheringType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gatheringType/list'

        populateValidParams(params)
        def gatheringType = new GatheringType(params)

        assert gatheringType.save() != null

        params.id = gatheringType.id

        def model = controller.edit()

        assert model.gatheringTypeInstance == gatheringType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gatheringType/list'

        response.reset()

        populateValidParams(params)
        def gatheringType = new GatheringType(params)

        assert gatheringType.save() != null

        // test invalid parameters in update
        params.id = gatheringType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gatheringType/edit"
        assert model.gatheringTypeInstance != null

        gatheringType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gatheringType/show/$gatheringType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gatheringType.clearErrors()

        populateValidParams(params)
        params.id = gatheringType.id
        params.version = -1
        controller.update()

        assert view == "/gatheringType/edit"
        assert model.gatheringTypeInstance != null
        assert model.gatheringTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gatheringType/list'

        response.reset()

        populateValidParams(params)
        def gatheringType = new GatheringType(params)

        assert gatheringType.save() != null
        assert GatheringType.count() == 1

        params.id = gatheringType.id

        controller.delete()

        assert GatheringType.count() == 0
        assert GatheringType.get(gatheringType.id) == null
        assert response.redirectedUrl == '/gatheringType/list'
    }
}
