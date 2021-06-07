<?php echo $header; ?>
<?php if ($success) { ?><div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div><?php } ?>
<div class="content content-profile content-lk">
    <div class="wrapper">
        <h1>Ваши данные</h1>
<div class="lk">
<div class="lk__nav">
<a href="/my-account/">Ваши данные</a>
<a href="/simplecheckout/">Ваша корзина</a>
<a href="/order-history/">История покупок</a>
<a href="/viewed-product/">Просмотренные товары</a>
<!--a href="">Списки желаний</a-->
</div>
            <div class="lk__profile profile">
            <form>
                <div class="profile__item">
                    <label>Имя и фамилия</label>
                    <input type="text">
                </div>
                <div class="profile__item">
                    <label>Электронная почта e-mail</label>
                    <input type="email">
                </div>
                <div class="profile__item">
                    <label>Номер телефона</label>
                    <input type="text">
                </div>
                <div class="profile__item profile__address">
                    <label>Адрес для доставок</label>
                    <textarea></textarea>
                </div>
                <div class="profile__item profile__count">
                    <label>Количество автомобилей</label>
                    <input type="text">
                </div>
                <div class="profile__item">
                    <label>Марка, год выпуска и модель автомобиля (автомобилей)</label>
                    <textarea></textarea>
                </div>
                <div class="profile__item">
                    <label>Пароль</label>
                    <input type="password">
                </div>
                <div class="profile__item">
                    <label>Восстановление пароля — введите ваш электронный адрес (e-mail)</label>
                    <input type="email">
                </div>
                <div class="profile__item">
                    <label>Смена пароля — введите ваш старый пароль</label>
                    <input type="password">
                </div>
                <div class="profile__item">
                    <label>Введите новый пароль</label>
                    <input type="password">
                </div>
                <div class="profile__item">
                    <label>Повторите новый пароль</label>
                    <input type="password">
                </div>
                <div class="profile__button">
                    <button>Сохранить</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>
<?php echo $footer; ?> 