<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/26/2022
  Time: 10:33 AM
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
        width: 100%;
    }
    table td, table th {
        text-align: left;
        padding: 5px;
        text-align: center;
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
        padding: 20px;
        overflow: auto;

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
    .vacancy{
        padding: 20px;
    }
    .v_ubs{
        text-align: center;
    }
    .About{
        text-align: right;
    }
    .About h3{
        color: blue;
    }
    .About a,.About span{
        color: lightgray;
        font-weight: bold;
    }
    .About div{
        margin-bottom: 20px;
    }
    .About h4{
        font-size: 20px;
    }
    .position p{
        color: grey;

    }
    </style>
</head>
<body>
<div style=" width:50%;box-shadow: 0 1px 4px grey;margin:10px auto;padding: 20px">
    <div style="padding: 30px 0">
        <h1 class="v_ubs">Vacancy at UBS</h1>
        <div class="About">
            <h3>عن الشركة</h3>
            <hr>
            <div>
                <h4>الموقع الالكتروني</h4>
                <a href="#">http://ubs.com</a>
            </div>
            <div>
                <h4>القطاع</h4>
                <span>التكنولوجيا والاتصالات</span>
            </div>
            <div>
                <h4>النوع</h4>
                <span>القطاع الخاص</span>
            </div>
            <div>
                <h4>المكان</h4>
                <span>رام الله/والبالوع</span>
            </div>
            <div>
                <h4>حجم الشركة</h4>
                <span>50-100موظف</span>
            </div>
            <div>
                <h4>تأسست عام</h4>
                <span>01-01-2000</span>
            </div>
            <hr>
            <div>
                <h3>Description</h3>
                <textarea style="width: 100%" id="desc" type="text" rows="7" cols="10" name="description" value="${vacancy?.description}"></textarea>
              <input type="date" name="year" value="${g.formatDate(date:vacancy?.year,format:'yyyy-MM-dd')}">
            </div>
    </div>
        <div>
            <h1 class="v_ubs" style="margin: 20px">الوظائف المتاحة</h1>
            <hr>
            <div>
                <g:each in="${vacancy?.vacancyPosition}" var="pos">
                    <div class="position" style="direction: rtl;display: flex;justify-content: space-between;margin-bottom: 15px">
                        <div class="">
                            <p><g:link controller="position" action="show" params="[vacancyPositionId:pos?.id]" id="${pos?.position?.id}" style="color: darkblue" >${pos?.position?.positionName}</g:link></p>
                            <p>${pos?.place}</p>
                        </div>
                        <div style="padding-top: 20px">
                            <span style="color: black">${pos?.number}</span>
                            <p>${g.formatDate(date:pos?.lastOfDateToApply,format:'yyyy-MM-dd')}</p>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
</div>
</div>
<script>
    jQuery(document).ready(function(){
        document.getElementById('desc').value = "${vacancy?.description}";
    })
</script>
</body>
</html>