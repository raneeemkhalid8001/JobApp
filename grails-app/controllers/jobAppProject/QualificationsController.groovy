package jobAppProject

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class QualificationsController {

    QualificationsService qualificationsService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect(action: 'create')
    }

    def show(Long id) {
        respond qualificationsService.get(id)
    }

    def create() {
        respond new Qualifications(params)
    }

    def save(Qualifications qualifications) {
        if (qualifications == null) {
            notFound()
            return
        }

        try {
            qualificationsService.save(qualifications)
        } catch (ValidationException e) {
            respond qualifications.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'qualifications.label', default: 'Qualifications'), qualifications.id])
                redirect qualifications
            }
            '*' { respond qualifications, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond qualificationsService.get(id)
    }

    def update(Qualifications qualifications) {
        if (qualifications == null) {
            notFound()
            return
        }

        try {
            qualificationsService.save(qualifications)
        } catch (ValidationException e) {
            respond qualifications.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'qualifications.label', default: 'Qualifications'), qualifications.id])
                redirect qualifications
            }
            '*'{ respond qualifications, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        qualificationsService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'qualifications.label', default: 'Qualifications'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualifications.label', default: 'Qualifications'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
