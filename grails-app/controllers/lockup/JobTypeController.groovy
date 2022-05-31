package lockup

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class JobTypeController {

    JobTypeService jobTypeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond jobTypeService.list(params), model:[jobTypeCount: jobTypeService.count()]
    }

    def show(Long id) {
        respond jobTypeService.get(id)
    }

    def create() {
        respond new JobType(params)
    }

    def save(JobType jobType) {
        if (jobType == null) {
            notFound()
            return
        }

        try {
            jobTypeService.save(jobType)
        } catch (ValidationException e) {
            respond jobType.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jobType.label', default: 'JobType'), jobType.id])
                redirect jobType
            }
            '*' { respond jobType, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond jobTypeService.get(id)
    }

    def update(JobType jobType) {
        if (jobType == null) {
            notFound()
            return
        }

        try {
            jobTypeService.save(jobType)
        } catch (ValidationException e) {
            respond jobType.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'jobType.label', default: 'JobType'), jobType.id])
                redirect jobType
            }
            '*'{ respond jobType, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        jobTypeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'jobType.label', default: 'JobType'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
