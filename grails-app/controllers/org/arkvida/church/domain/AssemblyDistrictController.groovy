package org.arkvida.church.domain

import java.text.NumberFormat

import org.springframework.dao.DataIntegrityViolationException

class AssemblyDistrictController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[districtInstanceList: AssemblyDistrict.list(params), districtInstanceTotal: AssemblyDistrict.count()]
	}

	def create() {
		def districtInstance = new AssemblyDistrict(params)
		def code = obtainUnusedCode();
		districtInstance.setCode(code)
		[districtInstance: districtInstance]
	}

	private String obtainUnusedCode() {
		def results = AssemblyDistrict.list([max:1, sort:"code", order:"desc"]);
		if ( results ) {
			def code = Integer.valueOf(results[0].getCode(), 10) + 1
			def numberFormat = NumberFormat.getInstance();
			numberFormat.setMinimumIntegerDigits(2);
			numberFormat.setMaximumIntegerDigits(2);
			return numberFormat.format(code);
		}
	}

	def save() {
		def districtInstance = new AssemblyDistrict(params)
		if (!districtInstance.save(flush: true)) {
			render(view: "create", model: [districtInstance: districtInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'district.label', default: 'District'),
			districtInstance.id
		])
		redirect(action: "show", id: districtInstance.id)
	}

	def show(Long id) {
		def districtInstance = AssemblyDistrict.get(id)
		if (!districtInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'district.label', default: 'District'),
				id
			])
			redirect(action: "list")
			return
		}

		[districtInstance: districtInstance]
	}

	def edit(Long id) {
		def districtInstance = AssemblyDistrict.get(id)
		if (!districtInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'district.label', default: 'District'),
				id
			])
			redirect(action: "list")
			return
		}

		[districtInstance: districtInstance]
	}

	def update(Long id, Long version) {
		def districtInstance = AssemblyDistrict.get(id)
		if (!districtInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'district.label', default: 'District'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (districtInstance.version > version) {
				districtInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'district.label', default: 'District')] as Object[],
						"Another user has updated this District while you were editing")
				render(view: "edit", model: [districtInstance: districtInstance])
				return
			}
		}

		districtInstance.properties = params

		if (!districtInstance.save(flush: true)) {
			render(view: "edit", model: [districtInstance: districtInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'district.label', default: 'District'),
			districtInstance.id
		])
		redirect(action: "show", id: districtInstance.id)
	}

	def delete(Long id) {
		def districtInstance = AssemblyDistrict.get(id)
		if (!districtInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'district.label', default: 'District'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			districtInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'district.label', default: 'District'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'district.label', default: 'District'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
