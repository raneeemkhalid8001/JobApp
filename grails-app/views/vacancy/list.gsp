<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/26/2022
  Time: 10:53 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div style="width: 70%;height: 50%;margin: 30px auto;box-shadow: 0 1px 4px grey;padding: 50px 35px;text-align: center">
    <div id="tblDataDiv">
        <table id="tblData" border="1" width="100%" height="80%" style="margin-top: 30px;margin-bottom: 27px;text-align: center">
            <thead>
            <th>description</th>
            <th>action</th>
            </thead>
            <tbody id="myTable">
            <g:each in="${allvacancy}" var="thisvacancy">
                <tr>
                    <td>${thisvacancy.description}</td>
                    <td>
                        <g:link controller="vacancy" action="deleteRow" id="${thisvacancy.id}">deleteRow</g:link>
                        <br>
                        <g:link controller="vacancy" action="show" id="${thisvacancy.id}">show</g:link>
                        <br>
                        <g:link controller="vacancy" action="edit" id="${thisvacancy.id}">edit</g:link>
                        <br>
                        <br>
                        <g:link controller="vacancy" action="showApplicant" id="${thisvacancy.id}">Show Applicants</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <g:link controller="vacancy" action="create" style="border-radius: 15px;text-decoration: none;background-color: black;color: white;padding: 10px 20px" >create</g:link>

</div>
</body>
</html>