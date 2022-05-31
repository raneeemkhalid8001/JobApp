<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/23/2022
  Time: 3:15 PM
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

<body style="padding: 20px">
<g:form action="save">
<div class="vacancy" style=" width:100%;box-shadow: 0 1px 4px grey;margin:20px auto;padding: 20px">
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
            <textarea style="width: 100%" type="text" rows="7" cols="10" name="description"></textarea>
            <br>
            <input name="year" type="date">
        </div>
%{--        <h1 class="v_ubs" style="margin: 20px">الوظائف المتاحة</h1>--}%
        <hr>
        <h1>positions</h1>
        <section class="contactSection">
            <div  class="divtable">
                <table  class="table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Number Of Employee</th>

                        <th>place</th>
                        <th>last Of Date To Apply</th>
                        <th>experience</th>
                        <th>typeOfJob</th>
                        <th>degree</th>
                        <th>Action</th>
                    </tr>
                    <tr id="data">
                        <td><g:select id="positionName" name="positionName" optionKey="id" optionValue="positionName" from="${position}"/></td>
                        <td><input id="number" type="number" name="number" placeholder="Enter number.."/></td>
%{--                        <td><input id="section" type="text" name="section" placeholder="Enter section.."/></td>--}%
                        <td><input id="place" type="text" name="place" placeholder="Enter place.."/></td>
                        <td><input id="date" type="date" name="lastOfDateToApply"/></td>
                        <td><input id="experience" type="text" name="experience" placeholder="Enter experience"/></td>
                        <td><g:select id="jobType" optionKey="id" optionValue="type" name="typeOfJob" from="${jobType}"/></td>
                        <td><g:select id="degree" name="degree" from="${degree}"/></td>
                        <td><button type="button" onclick="add()" style="background-color: #fff;border: 2px solid white"><i class="fa-solid fa-plus" style="background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px"></i></button></td>
                    </tr>
                    </thead>
                    <tbody class="tbody" id="contactTable">

                    </tbody>
                </table>
            </div>
        </section>
        <div class="button">
            <button class="save" type="submit">save</button>
            <g:link controller="vacancy" action="list" class="save" style="text-decoration: none;display: flex;justify-content: center;align-items: center;text-decoration: none;color: black;">Cancel</g:link>
        </div>
    </div>
</div>
</g:form>
<script>

    var optionList=[]
    function add(){
        var positionId=document.getElementById("positionName").value;
        var positionName=document.getElementById("positionName");
        var text = positionName.options[positionName.selectedIndex].text;
        var place=document.getElementById("place").value;
        var number=document.getElementById("number").value;
        var lastDate =document.getElementById("date").value;
        var experience=document.getElementById("experience").value;
        var jobTypeId=document.getElementById("jobType").value;
        var jobType=document.getElementById("jobType");
        var jobTypeText = jobType.options[jobType.selectedIndex].text;
        var degree=document.getElementById("degree").value;
        console.log("positionName : " + positionName)
        console.log("place : " + place)
        console.log("number : " + number)
        console.log("lastDate : " + lastDate)
        console.log("experience : " + experience)
        console.log("jobType : " + jobType)
        console.log("degree : " + degree)
        if(positionName!=""){
            var recordInfo = positionId+"_"+number+"_"+place+"_"+lastDate+"_"+experience+"_"+jobTypeId+"_"+degree
            var key = recordInfo;
            console.log(key);
            var result = optionList.indexOf(key);
            if(result == -1){
                optionList.push(key) ;
                var vtext = "<td>" + text + "<input type='hidden' name='valueOptionData' value='" + recordInfo  + "'></td>" ;
                var vnumber=`<td>`+number+`</td>`;
                var vplace =`<td>`+place+`</td>`;
                var vlastDate=`<td>`+lastDate+`</td>`;
                var vexperience=`<td>`+experience+`</td>`;
                var vjobType=`<td>`+jobTypeText+`</td>`;
                var vdegree=`<td>`+degree+`</td>`;
                var delAction = "<td><button id='delBtn' style='background-color: #fff;border: 2px solid white;color:red' value='" + recordInfo  + "' onclick='deleteRow(this);return false;'><i class='fa-solid fa-trash' style='background-color: #f0f5f5;font-size: 13px; padding: 7px;border-radius: 5px'></i></button></td>" ;
                var tbody=document.getElementById("contactTable");
                tbody.innerHTML+=`<tr>`+vtext+vnumber+vplace+vlastDate+vexperience+vjobType+vdegree+delAction+`</tr>`;
                document.getElementById("place").value="";
                document.getElementById("number").value="";
                document.getElementById("date").value="";
                document.getElementById("experience").value="";
            }
        }
    }
    function deleteRow(this_){
        // alert("   1 - "+optionList);
        console.log("optionList "+optionList);

        optionList = arrayRemove(optionList, this_.value);//delete from option list
        this_.closest("tr").remove();//delete from table
        // alert("   2 - "+optionLaist);
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