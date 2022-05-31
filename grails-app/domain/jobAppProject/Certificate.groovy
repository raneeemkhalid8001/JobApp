package jobAppProject

import lockup.CertificateType

class Certificate {
    String description
static belongsTo = [apply:Apply,certificateType: CertificateType]
    static constraints = {
        description nullable: true
        apply nullable: true
    }
}
