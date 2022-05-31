package lockup

import grails.gorm.services.Service

@Service(JobType)
interface JobTypeService {

    JobType get(Serializable id)

    List<JobType> list(Map args)

    Long count()

    void delete(Serializable id)

    JobType save(JobType jobType)

}