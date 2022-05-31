package lockup

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CertificateTypeController {

    CertificateTypeService certificateTypeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond certificateTypeService.list(params), model:[certificateTypeCount: certificateTypeService.count()]
    }

    def show(Long id) {
        respond certificateTypeService.get(id)
    }

    def create() {
        respond new CertificateType(params)
    }

    def save(CertificateType certificateType) {
        if (certificateType == null) {
            notFound()
            return
        }

        try {
            certificateTypeService.save(certificateType)
        } catch (ValidationException e) {
            respond certificateType.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'certificateType.label', default: 'CertificateType'), certificateType.id])
                redirect certificateType
            }
            '*' { respond certificateType, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond certificateTypeService.get(id)
    }

    def update(CertificateType certificateType) {
        if (certificateType == null) {
            notFound()
            return
        }

        try {
            certificateTypeService.save(certificateType)
        } catch (ValidationException e) {
            respond certificateType.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'certificateType.label', default: 'CertificateType'), certificateType.id])
                redirect certificateType
            }
            '*'{ respond certificateType, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        certificateTypeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'certificateType.label', default: 'CertificateType'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificateType.label', default: 'CertificateType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
