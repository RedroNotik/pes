<!DOCTYPE html>
<html lang="ru">
<head>
    <title>P.E.S</title>
    <#include "./parts/style.css">
</head>
    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <div class="login__logo">Pet<br>Emergency<br>Service</div>
                <form class="login"  style="padding: 5px" action="/registration" method="post">
                    <div class="login__field">
                        <label>
                            <input class="login__input" type="text" name="username"  placeholder="Имя" required>
                        </label><br><br></div>
                    <div class="login__field">
                        <label>
                            <input class="login__input" type="email" name="email" placeholder="Email" required>
                        </label><br><br></div>
                    <div class="login__field"><label>
                            <input class="login__input" type="text" name="phoneNumber"
                                                                      placeholder="Телефон"  required>
                        </label><br><br></div>
                    <div class="login__field"><label>
                            <input class="login__input" type="password" name="password"
                                                                     placeholder="Пароль"   required>
                        </label><br><br></div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="button login__submit">
                        <span class="button__text">Регистрация</span>
                    </button>
                    <a style="margin: 45%" href="/login">Вход</a>
                </form>
            </div>
            <div class="screen__background">
                <span class="screen__background__shape screen__background__shape4"></span>
                <span class="screen__background__shape screen__background__shape3"></span>
                <span class="screen__background__shape screen__background__shape2"></span>
                <span class="screen__background__shape screen__background__shape1"></span>
            </div>
        </div>
    </div>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</html>