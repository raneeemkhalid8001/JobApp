
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    .tbody tr:nth-child(even) {
        background-color:#f0f5f5;
    }
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
        width: 60%;
        margin: 20px auto;
        text-align: center;
        border: 1px solid #f0f5f5;

    }
    .address{
        list-style-type: none;
    }
    .info{
        margin: auto;
        width: 70%;
        height: 330px;
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
        width: 70%;
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
    </style>
</head>
<body>
<div style=" width:50%;box-shadow: 0 1px 4px grey;margin:10px auto">
    <div style="padding: 30px 0">
        <h2 class="h3" style="text-align: center;margin:20px 5px">Your Information</h2>
            <div class="info">
                <label>local Name: </label>
                <input type="text" name="localName" autocomplete="off" placeholder="localName" value="${apply?.person?.localName}" required="required"/>
                <label>latin Name: </label>
                <input type="text" name="latinName" autocomplete="off" placeholder="latinName" value="${apply?.person?.localName}"/>
                <label>birthOfDate: </label>
                <input type="date" value="${g.formatDate(date:apply?.person?.birthOfDate,format:'yyyy-MM-dd')}" name="beginingDate"/>                <label>Gender: </label>
                <g:select class="select" name="gender" from="${gender}" value="${apply?.gender}"/>
            </div>
        <h3 style="text-align: center;margin: 5px">your position:</h3>
        <section class="sectionSkills">
            <div class="skillstable">
                <table>
                    <thead>
                    <th>positions</th>
                    </thead>
                    <tbody>
                    <g:each in="${apply?.vacancyPosition?.position}" var="thisApplyPosition">
                        <tr>
                            <td>${thisApplyPosition?.positionName}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </section>
        <h3 class="h3" style="text-align: center;margin: 5px">Your contact</h3>
<section class="contactSection">
            <div  class="divtable">
                <table  class="table">
                    <thead>
                    <tr>
                        <th>Type</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>

                    </thead>
                    <tbody class="tbody" id="contactTable">
                    <g:each in="${apply.contacts}" var="thisApplycontact">
                        <tr>
                            <td>${thisApplycontact?.type}</td>
                            <td>${thisApplycontact?.phone}</td>
                            <td>${thisApplycontact?.email}</td>
                        </tr>
                    </g:each>

                    </tbody>
                </table>
            </div>
        </section>
        <h3 style="text-align: center;margin: 5px">your certificate is: </h3>
        <section class="contactSection">
            <div  class="divtable">
                <table  class="table">
                    <thead>
                    <tr>
                        <th>Type</th>
                        <th>description</th>
                    </tr>
                    </thead>
                    <tbody class="tbody" id="certificateTable">
                    <g:each in="${apply.certificates}" var="thisApplyCertificate">
                        <tr>
                            <td>${thisApplyCertificate?.certificateType?.certificateName}</td>
                            <td>${thisApplyCertificate?.description}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </section>
        <h3 style="text-align: center;margin: 5px">your skills:</h3>
        <section class="sectionSkills">
            <div class="skillstable">
                <table>
                    <thead>
                    <th>skills</th>
                    </thead>
                    <tbody>
                    <g:each in="${apply?.skillJobApp.skill}" var="thisApplySkill">
                        <tr>
                            <td>${thisApplySkill?.skillName}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </section>

        <div class="button">
            <g:link controller="vacancy" action="list" class="save" style="text-decoration: none;color: black;display: flex;justify-content: center;align-items: center;text-decoration: none;color: black;">Cancel</g:link>
        </div>
    </div>
</div>
</body>
</html>