<#macro page>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <title>P.E.S</title>
        <#include "./style.css">
</head>
    <div class="header">
    <body><a class="text" href="/"><h1>P.E.S</h1>
    <hr style="color: white">
    <h4>pet emergency service</h4> </a>
    <i style="text-align: left">${user.email}
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="logout__submit" type="submit" value="Выйти"/>
    </i>
    </form>
    </div>
    <#nested ></body>
</html>
</#macro>