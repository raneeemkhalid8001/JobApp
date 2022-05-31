package jobAppProject

class Attachment {
    String resumeUrl

    String orginalName
//    static belongsTo = [apply:Apply]
    static constraints = {

        orginalName nullable: true
    }
    static mapping = {
        table("attachment")
    }
}
