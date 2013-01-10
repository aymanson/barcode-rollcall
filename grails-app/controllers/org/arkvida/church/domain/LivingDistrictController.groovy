package org.arkvida.church.domain

import java.text.NumberFormat

import org.springframework.dao.DataIntegrityViolationException

class LivingDistrictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [livingDistrictInstanceList: LivingDistrict.findAllByDistrict(session["currentDistrict"], params), livingDistrictInstanceTotal: LivingDistrict.count()]
    }

    def create() {
		def livingDistrictInstance = new LivingDistrict(params)
		livingDistrictInstance.setCode(obtainUnusedCode());
        [livingDistrictInstance: livingDistrictInstance]
    }

	private String obtainUnusedCode() {
		def results = LivingDistrict.findAllByDistrict(session["currentDistrict"], [max:1, sort:"code", order:"desc"]);
		def code = Integer.valueOf(results[0].getCode(), 10) + 1
		def numberFormat = NumberFormat.getInstance();
		numberFormat.setMinimumIntegerDigits(2);
		numberFormat.setMaximumIntegerDigits(2);
		return numberFormat.format(code);
	}
	
    def save() {
        def livingDistrictInstance = new LivingDistrict(params)
        if (!livingDistrictInstance.save(flush: true)) {
            render(view: "create", model: [livingDistrictInstance: livingDistrictInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), livingDistrictInstance.id])
        redirect(action: "show", id: livingDistrictInstance.id)
    }

    def show(Long id) {
        def livingDistrictInstance = LivingDistrict.get(id)
        if (!livingDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), id])
            redirect(action: "list")
            return
        }

        [livingDistrictInstance: livingDistrictInstance]
    }

    def edit(Long id) {
        def livingDistrictInstance = LivingDistrict.get(id)
        if (!livingDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), id])
            redirect(action: "list")
            return
        }

        [livingDistrictInstance: livingDistrictInstance]
    }

    def update(Long id, Long version) {
        def livingDistrictInstance = LivingDistrict.get(id)
        if (!livingDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (livingDistrictInstance.version > version) {
                livingDistrictInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'livingDistrict.label', default: 'LivingDistrict')] as Object[],
                          "Another user has updated this LivingDistrict while you were editing")
                render(view: "edit", model: [livingDistrictInstance: livingDistrictInstance])
                return
            }
        }

        livingDistrictInstance.properties = params

        if (!livingDistrictInstance.save(flush: true)) {
            render(view: "edit", model: [livingDistrictInstance: livingDistrictInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), livingDistrictInstance.id])
        redirect(action: "show", id: livingDistrictInstance.id)
    }

    def delete(Long id) {
        def livingDistrictInstance = LivingDistrict.get(id)
        if (!livingDistrictInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), id])
            redirect(action: "list")
            return
        }

        try {
            livingDistrictInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'livingDistrict.label', default: 'LivingDistrict'), id])
            redirect(action: "show", id: id)
        }
    }
}
