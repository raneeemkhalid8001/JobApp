package lockup

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class JobTypeServiceSpec extends Specification {

    JobTypeService jobTypeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new JobType(...).save(flush: true, failOnError: true)
        //new JobType(...).save(flush: true, failOnError: true)
        //JobType jobType = new JobType(...).save(flush: true, failOnError: true)
        //new JobType(...).save(flush: true, failOnError: true)
        //new JobType(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //jobType.id
    }

    void "test get"() {
        setupData()

        expect:
        jobTypeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<JobType> jobTypeList = jobTypeService.list(max: 2, offset: 2)

        then:
        jobTypeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        jobTypeService.count() == 5
    }

    void "test delete"() {
        Long jobTypeId = setupData()

        expect:
        jobTypeService.count() == 5

        when:
        jobTypeService.delete(jobTypeId)
        sessionFactory.currentSession.flush()

        then:
        jobTypeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        JobType jobType = new JobType()
        jobTypeService.save(jobType)

        then:
        jobType.id != null
    }
}
