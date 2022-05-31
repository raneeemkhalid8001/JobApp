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
        textarea{
            width: 100%;
        }
    </style>
</head>

<body>
<g:form action="save" >
    <div style=" width:50%;box-shadow: 0 1px 4px grey;margin:60px auto;padding: 20px">
        <div style="width: 70%;text-align: center;padding-top: 10px;margin: auto">
            <g:hiddenField name="id" value="${position.id}"></g:hiddenField>
            position Name:
            <input type="text" name="positionName" style="margin-bottom: 10px" value="${position?.positionName}"/>
            <br>
%{--            <label style="margin-right: 10px">section:</label>--}%
%{--            <input type="text" name="section" style="margin-bottom: 10px;" value="${position?.section}"/>--}%
%{--            <br>--}%
%{--            <label style="margin-right: 10px">place:</label>--}%
%{--            <input type="text" name="place" style="margin-bottom: 10px;" value="${position?.place}"/>--}%
%{--            <br>--}%
%{--            <label style="margin-right: 10px">number:</label>--}%
%{--            <input type="text" name="number" style="margin-bottom: 10px;" value="${position?.number}"/>--}%
%{--            <br>--}%
%{--            <label style="margin-right: 10px">lastOfDateToApply:</label>--}%
%{--            <input type="date" value="${g.formatDate(date:position?.lastOfDateToApply,format:'yyyy-MM-dd')}" name="lastOfDateToApply"/>--}%
            <h2 style="margin-right: 10px">Description:</h2>
            <p><textarea id="description" name="description" rows="7" cols="10" value="${position?.description}"></textarea></p>
            <br>
            <h2 style="margin-right: 10px">Requirments for this job:</h2>
            <div>
                <p><textarea id="requirements" name="requirements" rows="7" cols="10" value="${position?.requirements}"></textarea></p>
                <h2 style="margin-right: 10px">Position Skills:</h2>
                <p><textarea id="positionSkills" name="positionSkills" rows="7" cols="10" value="${position?.positionSkills}"></textarea></p>
            </div>

        <div>
%{--            Position experience:<input type="text" name="experience" style="margin-bottom: 10px;" value="${position?.experience}"/>--}%
%{--            <br>--}%
%{--            Type Of Job:<g:select id="typeOfJob" name="typeOfJob" from="${jobType}" optionKey="id" optionValue="type" value="${position?.typeOfJob}" />--}%
%{--            <br>--}%
%{--            Degree:<g:select name="degree" from="${degree}" required="" value="${position?.degree}"/>--}%
%{--            <br>--}%
            Category:<input type="text" name="category" style="margin-bottom: 10px;" value="${position?.category}"/>
            <br>
        </div>

            <button type="submit">save</button>
        </div>
    </div>
</g:form>
</body>
</html>