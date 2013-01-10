package org.arkvida.church.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(LivingDistrictController)
@Mock(LivingDistrict)
class LivingDistrictControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/livingDistrict/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.livingDistrictInstanceList.size() == 0
        assert model.livingDistrictInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.livingDistrictInstance != null
    }

    void testSave() {
        controller.save()

        assert model.livingDistrictInstance != null
        assert view == '/livingDistrict/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/livingDistrict/show/1'
        assert controller.flash.message != null
        assert LivingDistrict.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/livingDistrict/list'

        populateValidParams(params)
        def livingDistrict = new LivingDistrict(params)

        assert livingDistrict.save() != null

        params.id = livingDistrict.id

        def model = controller.show()

        assert model.livingDistrictInstance == livingDistrict
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/livingDistrict/list'

        populateValidParams(params)
        def livingDistrict = new LivingDistrict(params)

        assert livingDistrict.save() != null

        params.id = livingDistrict.id

        def model = controller.edit()

        assert model.livingDistrictInstance == livingDistrict
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/livingDistrict/list'

        response.reset()

        populateValidParams(params)
        def livingDistrict = new LivingDistrict(params)

        assert livingDistrict.save() != null

        // test invalid parameters in update
        params.id = livingDistrict.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/livingDistrict/edit"
        assert model.livingDistrictInstance != null

        livingDistrict.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/livingDistrict/show/$livingDistrict.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        livingDistrict.clearErrors()

        populateValidParams(params)
        params.id = livingDistrict.id
        params.version = -1
        controller.update()

        assert view == "/livingDistrict/edit"
        assert model.livingDistrictInstance != null
        assert model.livingDistrictInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/livingDistrict/list'

        response.reset()

        populateValidParams(params)
        def livingDistrict = new LivingDistrict(params)

        assert livingDistrict.save() != null
        assert LivingDistrict.count() == 1

        params.id = livingDistrict.id

        controller.delete()

        assert LivingDistrict.count() == 0
        assert LivingDistrict.get(livingDistrict.id) == null
        assert response.redirectedUrl == '/livingDistrict/list'
    }
}
