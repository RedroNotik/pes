<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="search__container">
        <form action="/" method="get" class="search-form">
            <p style="color: white">Поиск по пациентам:</p> <label>
                <input class="search-input" type="text" name="name" required>
            </label><br>
            <input class="search-btn" type="submit" value="Поиск"/>
        </form>
    </div>
    <div class="cards">
    <#list pets as pet>
        <div class="card">
            <div class="card__top">
            <#if pet.filename??>
                <img  class="card__image" src="/img/${pet.filename}"/>
            </#if>
            </div>
            <div class="card__bottom"><p class="card__title">${pet.name} </p></div>
             <a class="text" href="/pet/${pet.id}">Подробнее</a>
        </div>
    </#list></div>
    <br>
    <br>
    <hr>
    <h3 style="text-align: center; color: white">Новый пациент</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data" class="add_form">
        Имя:<label>
            <input type="text" name="name" required/>
        </label><br><br>
        Описание:<label>
            <input type="text" name="description"/>
        </label><br><br>
        Телефон: <label>
            <input type="text" name="phone"/>
        </label><br><br>
        Фото: <input type="file" name="file"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Добавить"/>
    </form>
</@c.page>