package lockup

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CertificateTypeServiceSpec extends Specification {

    CertificateTypeService certificateTypeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new CertificateType(...).save(flush: true, failOnError: true)
        //new CertificateType(...).save(flush: true, failOnError: true)
        //CertificateType certificateType = new CertificateType(...).save(flush: true, failOnError: true)
        //new CertificateType(...).save(flush: true, failOnError: true)
        //new CertificateType(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //certificateType.id
    }

    void "test get"() {
        setupData()

        expect:
        certificateTypeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<CertificateType> certificateTypeList = certificateTypeService.list(max: 2, offset: 2)

        then:
        certificateTypeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        certificateTypeService.count() == 5
    }

    void "test delete"() {
        Long certificateTypeId = setupData()

        expect:
        certificateTypeService.count() == 5

        when:
        certificateTypeService.delete(certificateTypeId)
        sessionFactory.currentSession.flush()

        then:
        certificateTypeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        CertificateType certificateType = new CertificateType()
        certificateTypeService.save(certificateType)

        then:
        certificateType.id != null
    }
}
