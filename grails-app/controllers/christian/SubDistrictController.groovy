package christian

import org.springframework.dao.DataIntegrityViolationException

class SubDistrictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subDistrictInstanceList: SubDistrict.list(params), subDistrictInstanceTotal: SubDistrict.count()]
    }

    def create() {
        [subDistrictInstance: new SubDistrict(params)]
    }

    def save() {
        def subDistrictInstance = new SubDistrict(params)
        if (!subDistrictInstance.save(flush: true)) {
            render(view: "create", model: [subDistrictInstance: subDistrictInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), subDistrictInstance.id])
        redirect(action: "show", id: subDistrictInstance.id)
    }

    def show(Long id) {
        def subDistrictInstance = SubDistrict.get(id)
        if (!subDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), id])
            redirect(action: "list")
            return
        }

        [subDistrictInstance: subDistrictInstance]
    }

    def edit(Long id) {
        def subDistrictInstance = SubDistrict.get(id)
        if (!subDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), id])
            redirect(action: "list")
            return
        }

        [subDistrictInstance: subDistrictInstance]
    }

    def update(Long id, Long version) {
        def subDistrictInstance = SubDistrict.get(id)
        if (!subDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subDistrictInstance.version > version) {
                subDistrictInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subDistrict.label', default: 'SubDistrict')] as Object[],
                          "Another user has updated this SubDistrict while you were editing")
                render(view: "edit", model: [subDistrictInstance: subDistrictInstance])
                return
            }
        }

        subDistrictInstance.properties = params

        if (!subDistrictInstance.save(flush: true)) {
            render(view: "edit", model: [subDistrictInstance: subDistrictInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), subDistrictInstance.id])
        redirect(action: "show", id: subDistrictInstance.id)
    }

    def delete(Long id) {
        def subDistrictInstance = SubDistrict.get(id)
        if (!subDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), id])
            redirect(action: "list")
            return
        }

        try {
            subDistrictInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subDistrict.label', default: 'SubDistrict'), id])
            redirect(action: "show", id: id)
        }
    }
}
