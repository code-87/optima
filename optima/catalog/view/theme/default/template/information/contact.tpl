<?php echo $header; ?>
<div class="breadcrumbs">
<div class="wrapper">
<div class="breadcrumbs__links"><?php foreach ($breadcrumbs as $breadcrumb) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?></div>
</div>
</div>
<div class="content content-contacts">
    <div class="wrapper">
        <h1>Контакты</h1>
        <div class="contacts">
            <div class="contacts__left">
                <div class="contacts__item contacts__phones">
                    <h3>Консультации и заказы по телефонам:</h3>
                    <p>(095) 836-00-01</p>
                    <p>(068) 311-11-20</p>
                    <p>(093) 003-00-13</p>
                </div>
                <div class="contacts__item">
                    <h3>Написать нам:</h3>
                    <p>Для заказов: zakaz@kapitan.cc</p>
                    <p>Для заказов: zakaz@kapitan.cc</p>
                    <p>Skipe: kapitan_cc</p>
                </div>
                <div class="contacts__item">
                    <h3>Наш адрес:</h3>
                    <p>21034 м. Вінниця вул. Фурманова буд. 28</p>
                </div>
            </div>
            <div class="contacts__right">
                <h3>Схема проезда:</h3>
                <div class="contacts__map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2605.156769250636!2d28.516065206703438!3d49.23551688728643!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x472d5b3ccaa12b39%3A0xed9395c8dc135881!2z0YPQuy4g0K7RgNC40Y8g0JrQu9C10L3QsCwgMjgsINCS0LjQvdC90LjRhtCwLCDQktC40L3QvdC40YbQutCw0Y8g0L7QsdC70LDRgdGC0YwsIDIxMDAw!5e0!3m2!1sru!2sua!4v1600217007120!5m2!1sru!2sua" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>