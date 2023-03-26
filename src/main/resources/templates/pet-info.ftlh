<#import "parts/common.ftlh" as c>
<@c.page>

<h1>  P.E.S </h1>
<h2>pet emergency service</h2>
<#list images as img>
  <img src="/images/${img.id}" height="60px" alt=""/><br><br>
</#list>
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
<!--<h3>Новый питомец</h3>-->
<!--<form action="/product/create" method="post">-->
<!--  Имя:<input type="text" name="name"/><br><br>-->
<!--  Описание:<input type="text" name="description"/><br><br>-->
<!--  Телефон: <input type="text" name="phone"/><br><br>-->
<!--  <input type="submit" value="Добавить"/>-->
<!--</form>-->

</@c.page>