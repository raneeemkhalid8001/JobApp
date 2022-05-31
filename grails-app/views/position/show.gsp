<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/23/2022
  Time: 1:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
        .btn{
            text-decoration: none;
            background-color: green;
            color: white;
            padding: 20px;
            display: block;
            width: 82px;
            border-radius: 30px;
            margin: 20px auto;
        }
    </style>
</head>

<body>
<div style="width: 50%;margin:auto;box-shadow: 0px 1px 4px grey;padding: 20px">
    <div style="margin-top: 60px">
        <h2 style="margin-right: 10px">Description:</h2>
        <p style="margin-left: 10px">${position?.description}</p>
        <br>
        <h2 style="margin-right: 10px">Requirments for this job:</h2>
        <div>
            <p style="display: inline-block;margin-left: 10px">${raw(position?.requirements.encodeAsHTML().replace('\n','<br>'))}</p>
            <br>
            <h2 style="margin-right: 10px">Position Skills:</h2>
            <p style="display: inline-block;margin-left: 10px">${position?.positionSkills}</p>
        </div>
        <div style="direction: rtl">
            <h2>تفاصيل الظيفة</h2>
            <hr>
            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">المسمى الوظيفي:</label>
            <p style="display: inline-block;margin-left: 10px;color: gray">${position?.positionName}</p>
            <br>
            <div>
                <g:each in="${positionInfo}" var="c">
                    <div class="position" style="direction: rtl;margin-bottom: 15px">
                        <div class="">
                            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">اخر موعد للتقديم:</label>
                            <p style="display: inline-block;margin-left: 10px;color: gray">${g.formatDate(date:c?.last_of_date_to_apply,format:'yyyy-MM-dd')}</p>
                            <br>
                            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">المكان:</label>
                            <p style="display: inline-block;margin-left: 10px;color: gray">${c?.place}</p>
                           <br>
                            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">الخبرة:</label>
                            <p style="display: inline-block;margin-left: 10px;color: gray">${c?.experience}</p>
                           <br>
                            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">نوع الوظيفة:</label>
                            <p style="display: inline-block;margin-left: 10px;color: gray">${lockup.JobType.findById(c?.type_of_job_id).type}</p>
                           <br>
                            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">الدرجة العلمية:</label>
                            <p style="display: inline-block;margin-left: 10px;color: gray">${c?.degree}</p>
                        </div>
                    </div>
                </g:each>
            </div>
            <label style="margin-right: 10px;font-size: 18px;font-weight: bold">التصنيف:</label>
            <p style="margin-left: 10px;color: blue">${position?.category}</p>

            </div>
        </div>

    <div style="width: 50%;margin: auto;text-align: center">
        <span>If you are interested in this job:</span>
        <g:link class="btn" controller="apply" action="create" params="[vacancyPositionId:params.vacancyPositionId]">Apply now</g:link>
    </div>
</div>
</div>
</body>
</html>