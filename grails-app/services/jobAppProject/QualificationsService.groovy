package jobAppProject

import grails.gorm.services.Service

@Service(Qualifications)
interface QualificationsService {

    Qualifications get(Serializable id)

    List<Qualifications> list(Map args)

    Long count()

    void delete(Serializable id)

    Qualifications save(Qualifications qualifications)

}