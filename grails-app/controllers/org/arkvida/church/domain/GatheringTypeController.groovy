package org.arkvida.church.domain

import org.springframework.dao.DataIntegrityViolationException

class GatheringTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gatheringTypeInstanceList: GatheringType.list(params), gatheringTypeInstanceTotal: GatheringType.count()]
    }

    def create() {
        [gatheringTypeInstance: new GatheringType(params)]
    }

    def save() {
        def gatheringTypeInstance = new GatheringType(params)
        if (!gatheringTypeInstance.save(flush: true)) {
            render(view: "create", model: [gatheringTypeInstance: gatheringTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), gatheringTypeInstance.id])
        redirect(action: "show", id: gatheringTypeInstance.id)
    }

    def show(Long id) {
        def gatheringTypeInstance = GatheringType.get(id)
        if (!gatheringTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), id])
            redirect(action: "list")
            return
        }

        [gatheringTypeInstance: gatheringTypeInstance]
    }

    def edit(Long id) {
        def gatheringTypeInstance = GatheringType.get(id)
        if (!gatheringTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), id])
            redirect(action: "list")
            return
        }

        [gatheringTypeInstance: gatheringTypeInstance]
    }

    def update(Long id, Long version) {
        def gatheringTypeInstance = GatheringType.get(id)
        if (!gatheringTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gatheringTypeInstance.version > version) {
                gatheringTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gatheringType.label', default: 'GatheringType')] as Object[],
                          "Another user has updated this GatheringType while you were editing")
                render(view: "edit", model: [gatheringTypeInstance: gatheringTypeInstance])
                return
            }
        }

        gatheringTypeInstance.properties = params

        if (!gatheringTypeInstance.save(flush: true)) {
            render(view: "edit", model: [gatheringTypeInstance: gatheringTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), gatheringTypeInstance.id])
        redirect(action: "show", id: gatheringTypeInstance.id)
    }

    def delete(Long id) {
        def gatheringTypeInstance = GatheringType.get(id)
        if (!gatheringTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), id])
            redirect(action: "list")
            return
        }

        try {
            gatheringTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gatheringType.label', default: 'GatheringType'), id])
            redirect(action: "show", id: id)
        }
    }
}
