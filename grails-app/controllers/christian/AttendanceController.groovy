package christian

import org.springframework.dao.DataIntegrityViolationException

class AttendanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "barcodeRollcall", params: params)
    }

	def barcodeRollcall() {
		def attendanceInstance = new Attendance(params)
		def calendar = new GregorianCalendar()
		calendar.set(Calendar.HOUR, 0)
		calendar.set(Calendar.MINUTE, 0)
		calendar.set(Calendar.SECOND, 0)
		calendar.set(Calendar.MILLISECOND, 0)
		attendanceInstance.date = calendar.getTime()
		[attendanceInstance: attendanceInstance]
	}
	
	def attend() {
		def attendanceInstance = new Attendance(params)
		def calendar = new GregorianCalendar()
		calendar.set(Calendar.HOUR, 0)
		calendar.set(Calendar.MINUTE, 0)
		calendar.set(Calendar.SECOND, 0)
		calendar.set(Calendar.MILLISECOND, 0)
		attendanceInstance.recordTime = new Date();
		attendanceInstance.date = calendar.getTime()
		attendanceInstance.save(flush: true)
		Thread.sleep(1500);
		def userProfileInstance = UserProfile.findById(params.userProfileId)
		[attendanceInstance: attendanceInstance, userProfileInstance: userProfileInstance]
	}
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [attendanceInstanceList: Attendance.list(params), attendanceInstanceTotal: Attendance.count()]
    }

    def create() {
        [attendanceInstance: new Attendance(params)]
    }

    def save() {
        def attendanceInstance = new Attendance(params)
		attendanceInstance.arrivalTime = new Date();
        if (!attendanceInstance.save(flush: true)) {
            render(view: "create", model: [attendanceInstance: attendanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'attendance.label', default: 'Attendance'), attendanceInstance.id])
        redirect(action: "show", id: attendanceInstance.id)
    }

    def show(Long id) {
        def attendanceInstance = Attendance.get(id)
        if (!attendanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
            return
        }

        [attendanceInstance: attendanceInstance]
    }

    def delete(Long id) {
        def attendanceInstance = Attendance.get(id)
        if (!attendanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
            return
        }

        try {
            attendanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "show", id: id)
        }
    }
}
