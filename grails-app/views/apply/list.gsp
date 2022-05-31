<%--
  Created by IntelliJ IDEA.
  User: ubs
  Date: 5/24/2022
  Time: 4:51 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

</head>

<body>
<div style="width: 90%;margin: 30px auto;box-shadow: 0 1px 4px grey;padding: 50px 35px;text-align: center">
    <g:if test="${flash.message}">
        <div class="alert alert-success"  role="alert">${flash.message}
        </div>
    </g:if>
    <g:textField id="txtSearch"  name="txtSearch" class="input-xxlarge" placeholder="Search" />
    <button id="btn" onclick="search()">Search</button>
    <div id="tblDataDiv">
        <table id="tblData" border="1" width="100%" style="margin-top: 30px;margin-bottom: 27px;text-align: center">
            <thead>
            <th>Local Name</th>
            <th>gender</th>
            <th>resume</th>
            <th>position</th>
            <th>action</th>
            </thead>
            <tbody id="myTable">
            <g:each in="${allApplicants}" var="thisApplicant">
                <tr>
                    <td style="padding: 10px">${thisApplicant?.person?.localName}</td>
                    <td style="padding: 10px">${thisApplicant?.gender}</td>
                    <td style="padding: 10px">${thisApplicant?.attachment?.resumeUrl}</td>
                    <td style="padding: 10px">${thisApplicant?.vacancyPosition?.position?.positionName}</td>
                    <td style="padding: 10px">
                        <g:link controller="apply" action="deleteRow" id="${thisApplicant.id}"><i class="fa-solid fa-trash-can" style="background-color: #f0f5f5;font-size: 12px; padding: 7px;border-radius: 5px;margin-right: 7px;color: black"></i></g:link>
                        <g:link controller="apply" action="show" id="${thisApplicant.id?.toString().replace('[','')?.replace(']','')}"><i class="fa-solid fa-eye" style="background-color: #f0f5f5;font-size: 12px; padding: 7px;border-radius: 5px;margin-right: 7px;color: black"></i></g:link>
                        <g:link controller="apply" action="edit" id="${thisApplicant.id}"><i class="fa-solid fa-pen-to-square" style="background-color: #f0f5f5;font-size: 12px; padding: 7px;border-radius: 5px;margin-right: 7px;color: black"></i></g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <g:link controller="vacancy" action="list" style="border-radius: 15px;text-decoration: none;background-color: black;color: white;padding: 10px 20px" >create</g:link>
%{--    <g:select name="position" from="positions"></g:select>--}%
</div>
</body>
</html>