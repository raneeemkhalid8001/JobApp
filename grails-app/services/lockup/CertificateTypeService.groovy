package lockup

import grails.gorm.services.Service

@Service(CertificateType)
interface CertificateTypeService {

    CertificateType get(Serializable id)

    List<CertificateType> list(Map args)

    Long count()

    void delete(Serializable id)

    CertificateType save(CertificateType certificateType)

}