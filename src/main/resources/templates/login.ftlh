<!DOCTYPE html>
<html lang="ru">
<head>
    <title>P.E.S</title>
    <script src="https://kit.fontawesome.com/1cf483120b.js" crossorigin="anonymous"></script>
    <#include "./parts/style.css">
</head>
<body>
    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <div class="login__logo">Pet<br>Emergency<br>Service</div>
                <form class="login" action="/login" method="post">
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <label>
                            <input type="email" name="username" class="login__input" placeholder="Email">
                        </label><br><br></div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock"></i>
                        <label>
                            <input type="password" name="password" class="login__input"
                                           placeholder="Пароль">
                        </label><br><br></div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="button login__submit">
                        <span class="button__text">Вход</span>
                    </button>
                    <a style="margin: 30%" href="/registration">Регистрация</a>
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
<#--    <#if RequestParameters.error??>-->
<#--        <h2 style="color: red">Wow</h2>-->
<#--    </#if>-->
</body>
</html>