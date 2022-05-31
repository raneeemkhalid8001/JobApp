package jobAppProject

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ContactController {

    ContactService contactService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() {
        redirect(action:list())
    }
    def list(){
        def contact = Contact.list()
        [contact: contact]
    }
    def create(){
        Contact contact=new Contact()
        [contact: contact,ContactType:ContactService.getContactType(params)]
    }
    def save (){
        println "============================================="+params
        def result = contactService.save(params)
        println "=====result======"+result
        if(!result.hasErrors()){
            println "contact no error"
            redirect(action:"show",id :result?.id)//?.--> if result fech result.id because it make show for record and this record has an id
        }
        else {
            redirect(action:"create")
            println "has errors "
        }
    }
    def show(){
        Contact contact=Contact.get(params.id)
        [contact: contact]
    }
    def edit(){
        [contact: Contact.get(params.id)]
    }
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond contactService.list(params), model:[contactCount: contactService.count()]
//    }
//
//    def show(Long id) {
//        respond contactService.get(id)
//    }
//
//    def create() {
//        respond new Contact(params)
//    }
//
//    def save(Contact contact) {
//        if (contact == null) {
//            notFound()
//            return
//        }
//
//        try {
//            contactService.save(contact)
//        } catch (ValidationException e) {
//            respond contact.errors, view:'create'
//            return
//        }
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contact.id])
//                redirect contact
//            }
//            '*' { respond contact, [status: CREATED] }
//        }
//    }
//
//    def edit(Long id) {
//        respond contactService.get(id)
//    }
//
//    def update(Contact contact) {
//        if (contact == null) {
//            notFound()
//            return
//        }
//
//        try {
//            contactService.save(contact)
//        } catch (ValidationException e) {
//            respond contact.errors, view:'edit'
//            return
//        }
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contact.id])
//                redirect contact
//            }
//            '*'{ respond contact, [status: OK] }
//        }
//    }
//
//    def delete(Long id) {
//        if (id == null) {
//            notFound()
//            return
//        }
//
//        contactService.delete(id)
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
