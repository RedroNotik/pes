<#import "parts/common.ftlh" as c>
<@c.page>

<h1>  P.E.S </h1>
<h2>pet emergency service</h2>
  <#if pet.filename??>
    <img src="/img/${pet.filename}">
  </#if>
<div>
  <p>${pet.name}</p>
  <p>${pet.description}</p>
</div>
<b>Питомец:</b> ${pet.name} <br>
Описание: <p>${pet.description}</p>
<hr>
<form action="/pet/delete/${pet.id}" method="post">
  <input type="hidden" name="_csrf" value="${_csrf.token}"/>
  <input type="submit" value="delete"/>
</form>

</@c.page>