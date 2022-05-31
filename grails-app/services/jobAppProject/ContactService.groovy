package jobAppProject

import grails.gorm.services.Service
import grails.web.servlet.mvc.GrailsParameterMap
@Service(Contact)
class ContactService {

    def getContactType(GrailsParameterMap params){
       return ContactType.values()
    }

    Contact save(GrailsParameterMap params) {
        println "save service params = " + params
        Contact contact
        if (params.id)//edit
            contact =Contact.get(params.id)
        else //create
        {
            contact=new Contact()
        }
        contact.properties=params
        contact.type=ContactType.valueOf(params.type)
        println "type ==========="+ContactType.valueOf(params.type)
        contact.validate()
        println "validate = "+contact.validate()
        contact.save()
        return contact
    }

//    Contact get(Serializable id)
//
//    List<Contact> list(Map args)
//
//    Long count()
//
//    void delete(Serializable id)
//
//    Contact save(Contact contact)

}