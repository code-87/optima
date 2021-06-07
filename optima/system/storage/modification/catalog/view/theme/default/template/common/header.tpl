<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>

<?php if ($noindex) { ?>
<!-- OCFilter Start -->
<meta name="robots" content="noindex,nofollow" />
<!-- OCFilter End -->
<?php } ?>
      
<base href="<?php echo $base; ?>" />
<meta name="robots" content="noindex, nofollow" /
<?php if ($description) { ?><meta name="description" content="<?php echo $description; ?>" /><?php } ?>
<?php if ($keywords) { ?><meta name="keywords" content= "<?php echo $keywords; ?>" /><?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?><meta property="og:image" content="<?php echo $og_image; ?>" /><?php } else { ?><meta property="og:image" content="<?php echo $logo; ?>" /><?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<link href="catalog/view/theme/default/stylesheet/main.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/jquery-3.4.1.min.js"></script>
<!--script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script-->
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script src="catalog/view/javascript/common.js"></script>
<?php foreach ($styles as $style) { ?><link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" /><?php } ?>
<?php foreach ($links as $link) { ?><link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" /><?php } ?>
<?php foreach ($scripts as $script) { ?><script src="<?php echo $script; ?>" type="text/javascript"></script><?php } ?>
<?php foreach ($analytics as $analytic) { ?><?php echo $analytic; ?><?php } ?>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script type="text/javascript">
if (typeof grecaptcha != "undefined") {
  $(document).ready(function() {
    $('.g-recaptcha').each(function(){
      $(this).html('');
      var widgetId = grecaptcha.render($(this)[0], {sitekey : $(this).data('sitekey')});
    });
  });
}
</script>
<link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
<link rel="manifest" href="favicon/site.webmanifest">
<link rel="mask-icon" href="favicon/safari-pinned-tab.svg" color="#5bbad5">
<link rel="shortcut icon" href="favicon/favicon.ico">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="msapplication-config" content="favicon/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<script src="catalog/view/javascript/jquery/maskedinput.js" type="text/javascript"></script>
<script src="catalog/view/javascript/callback_send.js" type="text/javascript"></script>
			

					<?php
					// XD Stickers start
						if (!empty($xdstickers)) {
							echo'<style type="text/css">';
							echo $xdstickers_inline_styles;
							foreach ($xdstickers as $xdsticker) {
								if ($xdsticker['status'] == '1') {
					?>
									.<?php echo $xdsticker['id'] ?> {
										background-color:<?php echo $xdsticker['bg'] ?>;
										color:<?php echo $xdsticker['color'] ?>;
									}
					<?php
								}
							}
							echo'</style>';
						}
					// XD Stickers end
					?>
				
</head>
<body class="<?php echo $class; ?>">

			
			  <?php /* start socnetauth2 */ ?>
			  
			  <?php echo $SOCNETAUTH2_DATA_DOBOR['code']; ?>
			  <?php /* end socnetauth2 */ ?>
			  
            
<div class="modal modal-call">
<div class="modal__body">
<a class="modal__close">
<img src="img/cross.svg" alt=""></a>
<h3>Заказ обратного звонка</h3><p class="modal__call-text">Введите данные и мы к вам позвоним</p>
<form id="callback_data" data-ajax-submit enctype="multipart/form-data" method="post">
<div class="modal__form">
<?php if(isset($callbackpro['config_on_off_fields_firstname_cb'])) { ?>
<div class="modal__input <?php echo isset($callbackpro['config_fields_firstname_requared_cb']) ? 'sections_block_rquaired' : 'sections_block' ; ?>">
<label>Ваше Имя<sup>*</sup></label>
<input id="contact-name" class="contact-name" type="text" placeholder="<?php echo $callbackpro['config_placeholder_fields_firstname_cb'][$lang_id]['config_placeholder_fields_firstname_cb']; ?>" value="" name="name">
<div id="error_name_callback" class="error_callback"></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['config_on_off_fields_phone_cb'])) { ?>
<div class="modal__input input-phone <?php echo isset($callbackpro['config_fields_phone_requared_cb']) ? 'sections_block_rquaired' : 'sections_block' ; ?>">
<label>Номер телефона<sup>*</sup></label>
<input id="contact-phone" class="contact-phone" type="text" placeholder="<?php echo $callbackpro['config_placeholder_fields_phone_cb'][$lang_id]['config_placeholder_fields_phone_cb']; ?>" value="" name="phone">
<div id="error_phone_callback" class="error_callback"></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['config_on_off_fields_comment_cb'])) { ?>
<div class="modal__input <?php echo isset($callbackpro['config_fields_comment_requared_cb']) ? 'sections_block_rquaired' : 'sections_block' ; ?>">
<label>Ваш вопрос</label><textarea value="" name="comment_buyer"></textarea>
<div id="error_comment_callback" class="error_callback"></div>
</div>
<?php } ?>
<input type="hidden" id="callback_url" value="" name="url_site"  />

<div class="modal__recaptcha sections_block_rquaired"><div id="input-payment-captcha" class="g-recaptcha" data-sitekey="6Le9ydgZAAAAAK0dzjagbbJs9Ot3cNqtEAxyDiZk"></div>
</div>
<button onclick="sendCallback();" type="submit" class="ladda-button" data-style="expand-left">Позвонить мне</button>
</div>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
<?php if($callbackpro['config_mask_phone_number_cb'] !='') { ?>
$("#contact-phone").mask('<?php echo $callbackpro['config_mask_phone_number_cb'];?>');
<?php } ?>
});
</script>
</div>

<div class="modal success-call" ><div class="modal__body">
<a class="modal__close" ><img src="img/cross.svg" alt=""></a>
<h3>Заявка</h3>
<div class="empty">Ваша заявка успешно отправлена!</div>
</div></div>

<header>
<div class="top"><div class="wrapper"><div class="top__logo"><a href="/"><img src="img/logo.svg" alt=""></a></div><div class="top__search"><img src="img/search.svg" alt=""><?php echo $search; ?></div></div></div>
<div class="header">
<div class="wrapper">
<div class="header__title">Интернет магазин – шины, диски, аккумуляторы</div>
<div class="header__right">
<div class="header__contacts">
<div class="header__time">Время работы: пн-пт: 09:00 – 18:00, сб: 09:00 – 14:00.</div>
<div class="header__phone"><img src="img/phone.svg" alt="">
<a href="tel:+380678888888">067 888 88 88</a><a href="tel:+380508888888">050 888 88 88</a><a href="tel:+380638888888">063 888 88 88</a></div>
</div>
<div class="header__personal"><div class="header__call"><a class="call-phone">Позвонить мне</a></div>
<div class="header__viewed"><a href="/viewed-product/"><img src="img/eye.svg" /> Просмотренные товары</a></div>
<div class="header__lk">
<div class="header__your">
<a href="">Ваш кабинет <img src="img/lk.svg" alt=""></a>
<?php if ($logged) { ?>
<div class="header__navigation">
<div class="header__navigation-inner">
<a class="header__nav-link" href="/my-account/">Ваши данные</a>
<a class="header__nav-link" href="/cart/">Ваша корзина</a>
<a class="header__nav-link" href="/order-history/">История покупок</a>
<a class="header__nav-link" href="/viewed-product/">Просмотренные товары</a>
<a class="header__nav-link" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
<!--a class="header__nav-link" href="">Списки желаний</a -->
</div>
</div>
<?php } else { ?>
<div class="header__navigation">
<div class="header__navigation-inner">
<form class="header__auth" action="/login/" method="post" enctype="multipart/form-data">
<div class="header__input">
<label>Электронная почта (e-mail)</label>
<input type="email"	name="email">
</div>
<div class="header__input">
<label>Пароль</label>
<input type="password" name="password">
</div>
<button type="submit">Вход</button>
</form>
<?php /* start socnetauth2 */ ?><div style="display:none;"><?php echo $SOCNETAUTH2_DATA_BUTTONS['code']; ?></div><?php /* end socnetauth2 */ ?>
<div class="header__socials"><p>Вход через</p><a href="/socnetauth2/facebook.php?first=1"><img src="img/facebook.svg" alt=""></a><a href="/socnetauth2/gmail.php?first=1"><img src="img/google.svg" alt=""></a></div>
<a class="header__nav-link" href="/simpleregister/">Регистрация</a>
<a class="header__nav-link" href="/forgot-password/">Восстановление пароля</a>
</div>
</div>
<?php } ?>
</div>
<?php echo $cart; ?>
</div>
</div>
</div>
</div>
</div>
<div class="nav">
<div class="wrapper">
<div class="nav__left">
<a href="/shiny/">Шины</a>
<a href="/diski/">Диски</a>
<a href="/akkumulyatory/">Аккумуляторы</a>
</div>
<div class="nav__right">
<a href="/o-kompanii.html">О компании</a>
<a href="/contact/">Контакты</a>
<a href="/delivery.html#ancor2">Доставка</a>
<a href="/delivery.html#ancor3">Оплата</a>
<a href="/garantiya.html">Гарантия</a>
<a href="/voprosy-i-otvety/">Вопросы и ответы</a>
</div>
<a class="nav__burger"><img src="img/white-burger.svg" alt=""></a>
<div class="nav-mobile__menu">
<a href="/delivery.html#ancor2">доставка</a>
<a href="/delivery.html#ancor3">оплата</a>
<a href="/garantiya.html">гарантия</a>
<a href="/delivery.html#ancor4">возврат</a>
</div>
</div>
</div>
<div class="nav-mobile">
<div class="wrapper">
<div class="nav-mobile__left">
<a class="nav-mobile__burger"><img src="img/white-burger.svg" alt=""></a>
<a class="nav-mobile__phone call-phone"><img src="img/white-phone.svg" alt=""></a>
<a class="nav-mobile__eye" href="/viewed-product/"><img src="img/white-eye.svg" alt=""><span class="items"><?php echo $ocd_viewed_total; ?></span></a>
<a class="nav-mobile__search" href=""><img src="img/white-search.svg" alt=""></a>
</div>
<div class="nav-mobile__right">
<a class="nav-mobile__lk"><span>Ваш кабинет</span> <img src="img/white-lk.svg" alt=""></a>
<div class="header__navigation nav-mobile__lk-nav">
<?php if ($logged) { ?>
<div class="header__navigation-inner">
<a class="header__nav-link" href="/my-account/">Ваши данные</a>
<a class="header__nav-link" href="/cart/">Ваша корзина</a>
<a class="header__nav-link" href="/order-history/">История покупок</a>
<a class="header__nav-link" href="/viewed-product/"> Просмотренные товары</a>
<a class="header__nav-link" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
<!--a class="header__nav-link" href="">Списки желаний</a -->
</div>
<?php } else { ?>
<div class="header__navigation-inner">
<form class="header__auth" class="header__auth" action="/login/" method="post" enctype="multipart/form-data">
<div class="header__input"><label>Электронная почта (e-mail)</label><input type="email"name="email"></div>
<div class="header__input"><label>Пароль</label><input type="password" name="password"></div>
<button type="submit">Вход</button>
</form>
<div class="header__socials"><p>Вход через</p><a href="/socnetauth2/facebook.php?first=1"><img src="img/facebook.svg" alt=""></a><a href="/socnetauth2/gmail.php?first=1"><img src="img/google.svg" alt=""></a></div>
<a class="header__nav-link" href="/simpleregister/">Регистрация</a>
<a class="header__nav-link" href="/forgot-password/">Восстановление пароля</a>
</div>
<?php } ?>
</div>
<?php echo $cart; ?>
</div>
<div class="header__navigation nav-mobile__eye-nav">

</div>

<div class="nav-mobile__menu">
<a href="/shiny/">шины</a>
<a href="/diski/">диски</a>
<a href="/akkumulyatory/">аккумуляторы</a>
<a href="/o-kompanii.html">о компании</a>
<a href="/contact/">контакты</a>
<a href="/delivery.html#ancor3">оплата</a>
<a href="/garantiya.html">гарантия</a>
<a href="/delivery.html#ancor4">возврат</a>
<a href="/delivery.html#ancor2">доставка</a>
</div>
</div>
</div>
</header>