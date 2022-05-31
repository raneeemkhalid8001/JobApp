<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/31/2022
  Time: 12:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
    .position {
        margin: auto;
        width: 70%;
        height: 100px;
        border-radius: 15px;
        padding: 10px 20px;
        background-color: #f0f5f5;
        text-align: center;
    }
    </style>
</head>
<div>
    <g:select id="positionName" name="positionName" optionKey="position_id" optionValue="position_name" from="${positionsVacancy}" onChange="getApplicants(this.value)"/>
</div>
<div>
    <div class="address">
        <label>Applicants:</label>
        <g:select name="applicant" from="[]"
                  optionKey="id"  style="margin-bottom: 10px; width: 20%; margin-left: 21px"
                  noSelection="['':'Please select ..']"/>
    </div>
</div>
<div>
    <g:each in="${positionsVacancy}" var="pos">
        <div class="position" style="direction: rtl;display: flex;justify-content: space-between;margin-bottom: 15px">
            <div class="">
                <p><g:link controller="position" action="show" params="[vacancyPositionId:pos?.position_id]" id="${pos?.position_id}" style="color: darkblue" >${pos?.position_name}</g:link></p>
            </div>
            <div style="padding-top: 20px">
%{--                <span style="color: black">${pos?.number}</span>--}%
                <table>
                    <thead>
                    <th>Applicants</th>
                    </thead>
                    <tbody>
                    <td>${pos?.applicants}</td>

                    </tbody>
                </table>
            </div>
        </div>
    </g:each>
</div>
<body>
<script type="text/javascript">
    function getApplicants(positionId){
        alert(positionId);
        $.ajax({
            type: "post",
            data: {id: positionId,vacancyId:"${vacancy?.id}"},
            url: '${createLink(controller: 'vacancy', action: 'getApplicant')}',
            success:function(data){

                var applicant = $("#applicant");
                $('#applicant option:gt(0)').remove();
                $.each(data, function (index, element) {
                    applicant.append($("<option></option>").attr("value", element.id).text(element.local_name));
                });
            },error:function(XMLHttpRequest,textStatus,errorThrown){}
        });
    }
</script>
</body>
</html>