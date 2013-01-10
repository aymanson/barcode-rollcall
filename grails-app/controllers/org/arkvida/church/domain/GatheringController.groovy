package org.arkvida.church.domain

import org.springframework.dao.DataIntegrityViolationException

class GatheringController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gatheringInstanceList: Gathering.findAllByDistrict(session["currentDistrict"], params), gatheringInstanceTotal: Gathering.count()]
    }

    def create() {
        [gatheringInstance: new Gathering(params)]
    }

    def save() {
        def gatheringInstance = new Gathering(params)
        if (!gatheringInstance.save(flush: true)) {
            render(view: "create", model: [gatheringInstance: gatheringInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gathering.label', default: 'Gathering'), gatheringInstance.id])
        redirect(action: "show", id: gatheringInstance.id)
    }

    def show(Long id) {
        def gatheringInstance = Gathering.get(id)
        if (!gatheringInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gathering.label', default: 'Gathering'), id])
            redirect(action: "list")
            return
        }

        [gatheringInstance: gatheringInstance]
    }

    def edit(Long id) {
        def gatheringInstance = Gathering.get(id)
        if (!gatheringInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gathering.label', default: 'Gathering'), id])
            redirect(action: "list")
            return
        }

        [gatheringInstance: gatheringInstance]
    }

    def update(Long id, Long version) {
        def gatheringInstance = Gathering.get(id)
        if (!gatheringInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gathering.label', default: 'Gathering'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gatheringInstance.version > version) {
                gatheringInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gathering.label', default: 'Gathering')] as Object[],
                          "Another user has updated this Gathering while you were editing")
                render(view: "edit", model: [gatheringInstance: gatheringInstance])
                return
            }
        }

        gatheringInstance.properties = params

        if (!gatheringInstance.save(flush: true)) {
            render(view: "edit", model: [gatheringInstance: gatheringInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gathering.label', default: 'Gathering'), gatheringInstance.id])
        redirect(action: "show", id: gatheringInstance.id)
    }

    def delete(Long id) {
        def gatheringInstance = Gathering.get(id)
        if (!gatheringInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gathering.label', default: 'Gathering'), id])
            redirect(action: "list")
            return
        }

        try {
            gatheringInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gathering.label', default: 'Gathering'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gathering.label', default: 'Gathering'), id])
            redirect(action: "show", id: id)
        }
    }
}
