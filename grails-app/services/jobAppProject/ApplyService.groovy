package jobAppProject

import grails.gorm.services.Service
import grails.web.servlet.mvc.GrailsParameterMap
import groovy.sql.Sql
import lockup.CertificateType
import grails.gorm.transactions.Transactional
import lockup.Position
import org.springframework.web.multipart.MultipartFile

import java.text.SimpleDateFormat

@Transactional
class ApplyService {
    def getContactType(GrailsParameterMap params){
         return ContactType.values()
    }
    def getCertificateType(GrailsParameterMap params){
        return CertificateType.list()
    }
    def getGender(GrailsParameterMap params){
        return Gender.values()
    }
    def getSkills(GrailsParameterMap params){
        return Skill.list()
    }
    def getPosition(GrailsParameterMap params){
        return Position.list()
    }

    Apply save(GrailsParameterMap params) {
        println "save service params = " + params
        Apply apply
        if (params.id)//edit
            apply = Apply.get(params.id)
        else //create
        {
            apply = new Apply()
        }
        Apply.withTransaction { status ->
            println " << person >> "
            def personInstance
            if (!params.id) {
                personInstance = new Person();
                personInstance.localName = params.localName
                personInstance.latinName = params.latinName
                personInstance.birthOfDate =params.date("birthOfDate",['yyyy-MM-dd','yyyy-MM-dd hh:mm'])
                personInstance.save(failOnError:true)
                apply.person = personInstance
                apply.applicationDate = new Date()
                apply.vacancyPosition = VacancyPosition.findById(params.long("vacancyPositionId"))

//                if(apply.validate()){


                println " << certificate >> "
                Certificate certificate
//        println params.list("certificateData")
                if (params.list("certificateData")) {
                    (params.list("certificateData")).each { it ->
                        certificate = new Certificate()
                        def typeId = it?.toString().split("_")[0]
                        def description = it?.toString().split("_")[1]
                        certificate.certificateType = CertificateType.findById(Long.parseLong(typeId))//
                        certificate.description = description
                        certificate.save()
                        apply.addToCertificates(certificate)
                    }
                }


                println " << contact >> "
                Contact contact
//                println params.list("valueOptionData")
                if (params.list("valueOptionData")) {
                    (params.list("valueOptionData")).each { it ->
                        contact = new Contact()
                        def type = it?.toString().split("_")[0]
                        def phone = Long.parseLong(it?.toString().split("_")[1] ?: "0")
                        def email = it?.toString().split("_")[2]
                        contact.type = ContactType.valueOf(type)
                        contact.phone = phone
                        contact.email = email
                        contact.save(failOnError:true)
                        apply.addToContacts(contact)
                    }
                }

                println " << skillList >> "
                def skillList = params.list('skills')
                println "skillList :  "+skillList
                SkillJobApp skillJobApp
                skillList.each { it->

                    skillJobApp = new SkillJobApp(skill: Skill.findById(Long.parseLong(it)))
                    apply.addToSkillJobApp(skillJobApp)
                }
                println " << cvFile >> "
//                        if(params.cvFile){
//                            params.cvFile.transferTo(new File("D:/submitted_folder/${personInstance.localName}_CV.pdf"));
//                            Attachment attachment = new Attachment(resumeUrl: "D:/submitted_folder/${personInstance.localName}_CV.pdf")
//                            attachment.save(failOnError:true)
//                            apply.attachment = attachment
//                        }else{
//                            log.error("wrong attachment type [${params.cvFile.getClass()}]");
//                        }



                if (params['cvFile'] instanceof MultipartFile) {
                    MultipartFile multipartFile = params['cvFile']

                    if (!multipartFile?.empty && multipartFile?.originalFilename) {


                        if (!multipartFile?.originalFilename?.contains(".xls")) {

                            String fileName = UUID.randomUUID()
                            Attachment attachment = new Attachment(resumeUrl: "D:/submitted_folder/${fileName}")

                            params.cvFile.transferTo(new File("D:/submitted_folder/${fileName}"));
                            attachment.orginalName= multipartFile?.originalFilename
                            attachment.save(failOnError:true)
                            apply.attachment = attachment
                        }
                    }
                }

                    apply.properties = params
                println "-----${apply.validate()}---------------------->"
                    apply.save(failOnError:true)

            }
            return apply
        }
    }
    }