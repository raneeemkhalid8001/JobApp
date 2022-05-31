<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/23/2022
  Time: 1:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    .divtable{
        width: 80%;
        margin: auto;
        display: flex;
        justify-content: center;
    }
    table td, table th {
        /*border: 1px solid #dddddd;*/
        text-align: left;
        padding: 5px;
        text-align: center;
    }
    /*.tbody tr:nth-child(even) {*/
    /*background-color:#f0f5f5;*/
    /*}*/
    .add{
        text-decoration: none;
        color: white;
        font-size: 13px;
        background-color: grey;
        border: 2px solid grey;
        padding: 5px 10px;
        border-radius: 12px;
    }
    .contactSection{
        display: flex;
        justify-content: center;
        /*text-align: center;*/
        /*width: 60%;*/
    }
    .skillstable{
        width: 80%;
        margin: 20px auto;
        text-align: center;
        border: 1px solid #f0f5f5;

    }
    .address{
        list-style-type: none;
    }
    .info{
        margin: auto;
        width: 50%;
        height: 320px;
        border-radius: 20px;
        padding: 20px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    .position {
        margin: auto;
        width: 70%;
        height: 100px;
        border-radius: 15px;
        padding: 10px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    .relate{
        margin: auto;
        width: 70%;
        height: 200px;
        border-radius: 15px;
        padding: 10px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    .sectionSkills{
        margin: auto;
        width: 50%;
        height: 180px;
        border-radius: 15px;
        padding: 10px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    .addressdiv{
        width: 70%;
        height: 230px;
        margin: 10px auto;
        border-radius: 20px;
        padding: 10px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    .certificate{
        width: 70%;
        height: 200px;
        margin: 10px auto;
        border-radius: 20px;
        padding: 10px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    .info label,.certificate label,.relate label{
        /*margin-bottom: 10px;*/
        padding:5px;
        display: block;
    }
    .addressdiv .address label{
        padding:2px;
        display: block;
    }
    .info input,.select,.certificate input{
        border-radius: 10px;
        width: 240px;
        padding: 0 10px;
        height: 34px;
        border: 1px solid white;
    }
    .save{
        margin-top: 20px;
        margin-right: 20px;
        width: 82px;
        height: 37px;
        border: 1px solid #f0f5f5;
        background-color: #f0f5f5;
        border-radius: 15px
    }
    .button{
        display: flex;
        justify-content: center;
    }
    .textAreaDesc{
        height: 74px;
        width: 282px;
        border-radius: 3px;
    }
    .youratachement{
        display: flex;
        padding: 0 30px;
        text-align: center;
        justify-content: center;
        margin-top: 25px;
    }
    .file{
        background-color: #f0f5f5;
        padding: 20px;
        box-sizing: border-box;
        width: 30%;

        border-radius: 20px;
        box-shadow: 0 1px 4px grey
    }
    </style>

</head>

<body>
%{--autocomplete="off"--}%
<g:form action="save" enctype="multipart/form-data" >
    <g:if test="${flash.error}">
        <div  class="alert alert-danger" role="alert">${flash.error}</div></g:if>
    <g:if test="${flash.message}">
        <div class="alert alert-success"  role="alert">${flash.message}</div>
    </g:if>
    <div style=" width:65%;box-shadow: 0 1px 4px grey;margin:10px auto">
        <div style="padding: 30px 0">

            <g:hiddenField name="vacancyPositionId" value="${vacancyPositionId}"/>
            <h2 class="h3" style="text-align: center;margin:20px 5px">Your Information</h2>
            <div class="info">
                <label>local Name: </label>
                <input type="text" name="localName" autocomplete="off" placeholder="localName" required="required"/>
                <label>latin Name: </label>
                <input type="text" name="latinName" autocomplete="off" placeholder="latinName" />
                <label>birthOfDate: </label>
                <input type="date" name="birthOfDate"/>
                <label>Gender: </label>
                <g:select class="select" name="gender" from="${gender}"/>
            </div>
            <h3 class="h3" style="text-align: center;margin: 5px">Your contact</h3>
            <section class="contactSection">
                <div  class="divtable">
                    <table  class="table">
                        <thead>
                        <tr>
                            <th>Type</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                        <tr id="data">
                            <td><g:select id="type" name="type" from="${contactType}"/></td>
                            <td><input id="phone" type="text" name="phone" placeholder="Enter phone"/></td>
                            <td><input id="email" type="text" name="email" placeholder="Enter email"/></td>
                            <td ><button type="button" onclick="add()" style="background-color: #fff;border: 2px solid white"><i class="fa-solid fa-plus" style="background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px"></i></button></td>
                        </tr>
                        </thead>
                        <tbody class="tbody" id="contactTable">

                        </tbody>
                    </table>
                </div>
            </section>
%{--            ***************************************88888--}%
            <h3 style="text-align: center;margin: 20px 5px">your certificate is: </h3>
            <section class="contactSection">
                <div  class="divtable">
                    <table  class="table">
                        <thead>
                        <tr>
                            <th>Type</th>
                            <th>description</th>
                            <th>Action</th>
                        </tr>
                        <tr id="dataa">
                            <td><g:select id="certype" name="certificates" from="${certificateType}" optionKey="id" optionValue="certificateName" value="" /></td>
                            <td><input id="description" type="text" name="description" /></td>
%{--                            <td><textarea class="textAreaDesc" id="description" type="text" name="description" row="5" col="4"></textarea></td>--}%
                            <td><button type="button" onclick="addCert()" style="background-color: #fff;border: 2px solid white"><i class="fa-solid fa-plus" style="background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px"></i></button></td>
                        </tr>
                        </thead>
                        <tbody class="tbody" id="certificateTable">

                        </tbody>
                    </table>
                </div>
            </section>
%{--****************************************************--}%
            <h3 style="text-align: center;margin: 5px">your skills:</h3>
            <section class="sectionSkills">
                <div class="skillstable">
                    <table>
                        <thead>
                        <th>skills</th>
                        </thead>
                        <tbody>
                        <td><g:select style="width: 100%;height: 100%;text-align: center" name="skills" from="${skills}" multiple="" optionKey="id" optionValue="skillName" value=""/></td>
                        </tbody>
                    </table>
                </div>
            </section>
            <div class="youratachement">
%{--                <div class="file">--}%
%{--                    <label>Tawjihi Certificate:</label>--}%
%{--                    <input type="file"/>--}%
%{--                </div>--}%
%{--                <div class="file">--}%
%{--                    <label>University certificate:</label>--}%
%{--                    <input type="file" />--}%
%{--                </div>--}%
                <div class="file">
                    <label>your resume:</label>
                    <input type="file" name="cvFile"/>
                </div>
            </div>
            <div class="button">
                <button class="save" type="submit">save</button>
                <g:link controller="apply" action="show" class="save" style="text-decoration: none;color: black;display: flex;justify-content: center;align-items: center;text-decoration: none;color: black;">Cancel</g:link>
            </div>
        </div>
    </div>
</g:form>
<script>
    var optionList=[]
    function add(){
        var type=document.getElementById("type").value;
        var phone=document.getElementById("phone").value;
        var email=document.getElementById("email").value;
        console.log("type : " + type)
        console.log("phone : " + phone)
        console.log("email : " + email)
        if(type!=""){
            var recordInfo = type+"_"+phone+"_"+email
            var key = recordInfo;
            console.log(key);
            var result = optionList.indexOf(key);
            if(result == -1){
                optionList.push(key) ;
                var vType = "<td>" + type + "<input type='hidden' name='valueOptionData' value='" + recordInfo  + "'></td>" ;
                var vPhone =`<td>`+phone+`</td>`;
                var vEmail=`<td>`+email+`</td>`;
                var delAction = "<td><button id='delBtn' style='background-color: #fff;border: 2px solid white;color:red' value='" + recordInfo  + "' onclick='deleteRow(this);return false;'><i class='fa-solid fa-trash' style='background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px'></i></button></td>" ;
                var tbody=document.getElementById("contactTable");
                tbody.innerHTML+=`<tr>`+vType+vPhone+vEmail+delAction+`</tr>`;
                document.getElementById("type").value ="";
                document.getElementById("phone").value="";
                document.getElementById("email").value="";
            }
        }
    }
    var certList=[]

    function addCert(){
        var certTypeId=document.getElementById("certype").value;
        var certtype=document.getElementById("certype");
        // alert(certtype.value);
        var text = certtype.options[certtype.selectedIndex].text;
        var description=document.getElementById("description").value;
        console.log("certtype : " + certtype)
        console.log("description : " + description)
        if(certtype!=""){
            var recordInfo = certTypeId+"_"+description
            var key = recordInfo;
            console.log(key);
            var result = certList.indexOf(key);
            if(result == -1){
                certList.push(key) ;
                var vType = "<td>" + text + "<input type='hidden' class='certificateData' name='certificateData' value='" + recordInfo  + "'></td>" ;
                var vDescription =`<td>`+description+`</td>`;
                var delAction = "<td><button id='delBtn' style='background-color: #fff;border: 2px solid white;color:red' value='" + recordInfo  + "' onclick='deleteRowcert(this);return false;'><i class='fa-solid fa-trash' style='background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px'></i></button></td>" ;
                // var delAction = "<td><button id='delBtn' value='" + recordInfo  + "' onclick='deleteRowcert(this);return false;'>DEL</button></td>" ;
                var tbody=document.getElementById("certificateTable");
                tbody.innerHTML+=`<tr>`+vType+vDescription+delAction+`</tr>`;
                document.getElementById("certype").value ="";
                document.getElementById("description").value="";
            }
        }
    }
    var relateList=[]
    function addRelate(){
        var relateType=document.getElementById("relateType").value;
        var note=document.getElementById("note").value;
        console.log("relateType : " + relateType)
        console.log("note : " + note)
        if(relateType!=""){
            var recordInfo = relateType+"_"+note
            var key = recordInfo;
            console.log(key);
            var result = relateList.indexOf(key);
            if(result == -1){
                relateList.push(key) ;
                var vType = "<td>" + relateType + "<input type='hidden' class='relateData' name='relateData' value='" + recordInfo  + "'></td>" ;
                var vNote =`<td>`+note+`</td>`;
                var delAction = "<td><button id='delBtn' style='background-color: #fff;border: 2px solid white;color:red' value='" + recordInfo  + "' onclick='deleteRowrelate(this);return false;'><i class='fa-solid fa-trash' style='background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px'></i></button></td>" ;
                var tbody=document.getElementById("relateTable");
                tbody.innerHTML+=`<tr>`+vType+vNote+delAction+`</tr>`;
                document.getElementById("relateType").value ="";
                document.getElementById("note").value="";
            }
        }
    }
    function deleteRowrelate(this_){
        certList = arrayRemove(relateList, this_.value);//delete from option list
        this_.closest("tr").remove();//delete from table
    }
    function deleteRowcert(this_){
        console.log("certList "+certList);
        certList = arrayRemove(certList, this_.value);//delete from option list
        this_.closest("tr").remove();//delete from table
    }
    function deleteRow(this_){
        // alert("   1 - "+optionList);
        console.log("optionList "+optionList);

        optionList = arrayRemove(optionList, this_.value);//delete from option list
        this_.closest("tr").remove();//delete from table
        // alert("   2 - "+optionList);
    }


    function arrayRemove(arr, value) {

        var res =  arr.filter(function(ele){
            return ele != value;
        });
        // alert(res);
        return res;
    }
</script>
</body>
</html>