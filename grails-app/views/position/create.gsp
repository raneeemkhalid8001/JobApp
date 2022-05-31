<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/23/2022
  Time: 1:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
    textarea{
        width: 100%
    }
    </style>
</head>

<body>
<g:form action="save" >
    <div style=" width:50%;box-shadow: 0 1px 4px grey;margin:60px auto;display: flex;justify-content: center;align-items: center">
        <div style="width: 70%;text-align: center;padding: 20px">
            Position Name:<input type="text" name="positionName" style="margin-bottom: 10px;"/>
            <h2 style="margin-right: 10px">Description:</h2>
            <textarea id="description" name="description" rows="7" cols="10"></textarea>
            <h2 style="margin-right: 10px">Requirments for this job:</h2>
            <div>
                <p><textarea id="requirements" name="requirements" rows="7" cols="10"></textarea></p>
                <h2 style="margin-right: 10px">Position Skills:</h2>
                <p><textarea id="positionSkills" name="positionSkills" rows="7" cols="10"></textarea></p>
            </div>
            <div>
                Category:<input type="text" name="category" style="margin-bottom: 10px;"/>
            </div>
            <button type="submit">save</button>
        </div>
    </div>
</g:form>
</body>
</html>