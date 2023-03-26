<#import "parts/common.ftlh" as c>
<@c.page>

    <h1> P.E.S </h1>
    <h3>Имя пользователя: <i>${user.email}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <h3>pet emergency service</h3>
    <div class="search__container">
        <form action="/" method="get">
            Поиск по пациентам: <label>
                <input class="search__input" type="text" name="name" required>
            </label><br>
            <input type="submit" value="Поиск"/>
        </form>
    </div>
    <#list pets as pet>
        <div>
            <p><b>${pet.name}</b> ${pet.description} | <a href="/pet/${pet.id}">Кто это</a></p>
        </div>
    </#list>
    <hr>
    <h3>Новый питомец</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Имя:<label>
            <input type="text" name="name" required/>
        </label><br><br>
        Описание:<label>
            <input type="text" name="description"/>
        </label><br><br>
        Телефон: <label>
            <input type="text" name="phone"/>
        </label><br><br>
        Фото: <input type="file" name="file1"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Добавить"/>
    </form>
</@c.page>