<?php echo $header; ?>
<div class="breadcrumbs"><div class="wrapper">
<div class="breadcrumbs__links"><?php foreach ($breadcrumbs as $breadcrumb) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?></div></div></div>
<div class="content content-product">
<div class="wrapper">
<div class="product">
<div class="product__tabs">
<a class="active">Всё о товаре</a>
<a>Отзывы</a>
<a>Фото</a>
<p class="product__code">Код товара: <span><?php echo $model; ?></span></p>
</div>
<h1><?php echo $heading_title; ?></h1>
<div class="product__item item item-info active">
<div class="product__description">
<div class="product__info">
<div class="product__spec">
<div class="product__photo">

<?php if (!empty($xdstickers)) { ?>
<?php foreach($xdstickers as $xdsticker) { ?><div class="product__stock"><?php echo $xdsticker['text']; ?></div><?php } ?>
<?php } ?>

<div class="swiper-pagination"></div>
<div class="swiper-container">
<div class="swiper-wrapper">
<?php if ($thumb || $images) { ?>
<?php if ($thumb) { ?>
<div class="swiper-slide"><a data-fancybox="gallery" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
<?php } ?>
<?php foreach ($images as $image) { ?><div class="swiper-slide"><a data-fancybox="gallery" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div><?php } ?><?php } ?>
</div></div></div>	
<div class="product__parameters"><?php foreach ($attribute_groups as $attribute_group) { ?><?php foreach ($attribute_group['attribute'] as $attribute) { ?>
<p><span>• <?php echo $attribute['name']; ?> </span>  <span><?php echo $attribute['text']; ?></span></p><?php } ?><?php } ?></div>
<div class="product__buy">
<?php if ($price) { ?><?php if (!$special) { ?><p><?php echo $price; ?></p><?php } else { ?><p><?php echo $special; ?></p><?php } ?><?php } ?>
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
<button type="button" class="button-cart"><img src="img/button-cart.svg" /><span>купить</span></button>
</div>
</div>
<div class="product__text"><h2>Описание</h2><div class="product__text-holder"><?php echo $description; ?></div></div>
</div>
<div class="product__delivery"><h3>Доставка</h3>
<ul>
<li>Самовывоз – Вы можете забрать этот товар самостоятельно из отделений перевозчиков “Новая Почта” или “Интайм”. Стоимость доставки – по тарифам компаний перевозчиков.</li>
<li>Доставка курьерской службой – Мы доставим этот товар курьерской службой доставки “Новая Почта” или “Интайм”. Стоимость доставки – по тарифам компаний перевозчиков.</li>
</ul>
<h3>Оплата</h3>
<p>Наличными, Безналичными (ЧП “Капитан” – плательщик НДС), Visa/MasterCard.</p>
<h3>Гарантия</h3>
<p>Товар надлежащего качества - обмен и возврат в течении 14 дней при сохранении оригинальной упаковки и отсудствии следов монтажа.. <a href="/delivery.html">подробнее</a></p>
</div>
<div class="product__text product__text-bottom">
<h2>Описание</h2>
<div class="product__text-holder">
<?php echo $description; ?>
</div>
<p class="product__text-more">...<a>читать далее</a></p>
</div>
</div>
<?php echo $content_bottom; ?>

</div>

<div class="product__item item item-rev">
<div class="product__rate rate">
<div class="rate__top">
<p>Общая оценка пользователей</p>
<span class="rate__stars">
<?php if ($review_status) {?>      
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) {				  ?>
             <img src="img/star-grey.svg" alt="">
              <?php } else { ?>
              <img src="img/star-yellow.svg" alt="">
              <?php } ?>
              <?php } ?>
          <?php } ?>
</span>
<a href="">на основе <?php echo $reviews;?></a>
</div>
<div class="rate__item">
<?php if ($thumb) { ?><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /><?php } ?>
<div class="rate__buy"><?php if ($price) { ?><?php if (!$special) { ?><p><?php echo $price; ?></p><?php } else { ?><p><?php echo $special; ?></p><?php } ?><?php } ?><button type="button" class="button-cart"><img src="img/button-cart.svg" /><span>купить</span></button></div>
</div>
</div>

</div>

<div class="product__item item item-gallery">
<div class="product__gallery gallery">
<div class="gallery__img">
<?php if ($thumb || $images) { ?>
<?php if ($thumb) { ?>
<img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
<?php } ?>
<?php foreach ($images as $image) { ?>
<img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
<?php } ?><?php } ?>
</div>
<div class="gallery__buy">
<?php if ($price) { ?><?php if (!$special) { ?><p><?php echo $price; ?></p><?php } else { ?><p><?php echo $special; ?></p><?php } ?><?php } ?>
<button type="button" class="button-cart"><img src="img/button-cart.svg" /><span>купить</span></button>
 </div>
</div>
</div>

<div class="product__reviews reviews">
</div>

</div>
</div>
</div>
<style>
body.compensate-for-scrollbar{overflow:hidden}.fancybox-active{height:auto}.fancybox-is-hidden{left:-9999px;margin:0;position:absolute!important;top:-9999px;visibility:hidden}.fancybox-container{-webkit-backface-visibility:hidden;height:100%;left:0;outline:none;position:fixed;-webkit-tap-highlight-color:transparent;top:0;-ms-touch-action:manipulation;touch-action:manipulation;transform:translateZ(0);width:100%;z-index:99992}.fancybox-container *{box-sizing:border-box}.fancybox-bg,.fancybox-inner,.fancybox-outer,.fancybox-stage{bottom:0;left:0;position:absolute;right:0;top:0}.fancybox-outer{-webkit-overflow-scrolling:touch;overflow-y:auto}.fancybox-bg{background:#1e1e1e;opacity:0;transition-duration:inherit;transition-property:opacity;transition-timing-function:cubic-bezier(.47,0,.74,.71)}.fancybox-is-open .fancybox-bg{opacity:.9;transition-timing-function:cubic-bezier(.22,.61,.36,1)}.fancybox-caption,.fancybox-infobar,.fancybox-navigation .fancybox-button,.fancybox-toolbar{direction:ltr;opacity:0;position:absolute;transition:opacity .25s ease,visibility 0s ease .25s;visibility:hidden;z-index:99997}.fancybox-show-caption .fancybox-caption,.fancybox-show-infobar .fancybox-infobar,.fancybox-show-nav .fancybox-navigation .fancybox-button,.fancybox-show-toolbar .fancybox-toolbar{opacity:1;transition:opacity .25s ease 0s,visibility 0s ease 0s;visibility:visible}.fancybox-infobar{color:#ccc;font-size:13px;-webkit-font-smoothing:subpixel-antialiased;height:44px;left:0;line-height:44px;min-width:44px;mix-blend-mode:difference;padding:0 10px;pointer-events:none;top:0;-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.fancybox-toolbar{right:0;top:0}.fancybox-stage{direction:ltr;overflow:visible;transform:translateZ(0);z-index:99994}.fancybox-is-open .fancybox-stage{overflow:hidden}.fancybox-slide{-webkit-backface-visibility:hidden;display:none;height:100%;left:0;outline:none;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:absolute;text-align:center;top:0;transition-property:transform,opacity;white-space:normal;width:100%;z-index:99994}.fancybox-slide:before{content:"";display:inline-block;font-size:0;height:100%;vertical-align:middle;width:0}.fancybox-is-sliding .fancybox-slide,.fancybox-slide--current,.fancybox-slide--next,.fancybox-slide--previous{display:block}.fancybox-slide--image{overflow:hidden;padding:44px 0}.fancybox-slide--image:before{display:none}.fancybox-slide--html{padding:6px}.fancybox-content{background:#fff;display:inline-block;margin:0;max-width:100%;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:relative;text-align:left;vertical-align:middle}.fancybox-slide--image .fancybox-content{animation-timing-function:cubic-bezier(.5,0,.14,1);-webkit-backface-visibility:hidden;background:transparent;background-repeat:no-repeat;background-size:100% 100%;left:0;max-width:none;overflow:visible;padding:0;position:absolute;top:0;transform-origin:top left;transition-property:transform,opacity;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;z-index:99995}.fancybox-can-zoomOut .fancybox-content{cursor:zoom-out}.fancybox-can-zoomIn .fancybox-content{cursor:zoom-in}.fancybox-can-pan .fancybox-content,.fancybox-can-swipe .fancybox-content{cursor:grab}.fancybox-is-grabbing .fancybox-content{cursor:grabbing}.fancybox-container [data-selectable=true]{cursor:text}.fancybox-image,.fancybox-spaceball{background:transparent;border:0;height:100%;left:0;margin:0;max-height:none;max-width:none;padding:0;position:absolute;top:0;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;width:100%}.fancybox-spaceball{z-index:1}.fancybox-slide--iframe .fancybox-content,.fancybox-slide--map .fancybox-content,.fancybox-slide--pdf .fancybox-content,.fancybox-slide--video .fancybox-content{height:100%;overflow:visible;padding:0;width:100%}.fancybox-slide--video .fancybox-content{background:#000}.fancybox-slide--map .fancybox-content{background:#e5e3df}.fancybox-slide--iframe .fancybox-content{background:#fff}.fancybox-iframe,.fancybox-video{background:transparent;border:0;display:block;height:100%;margin:0;overflow:hidden;padding:0;width:100%}.fancybox-iframe{left:0;position:absolute;top:0}.fancybox-error{background:#fff;cursor:default;max-width:400px;padding:40px;width:100%}.fancybox-error p{color:#444;font-size:16px;line-height:20px;margin:0;padding:0}.fancybox-button{background:rgba(30,30,30,.6);border:0;border-radius:0;box-shadow:none;cursor:pointer;display:inline-block;height:44px;margin:0;padding:10px;position:relative;transition:color .2s;vertical-align:top;visibility:inherit;width:44px}.fancybox-button,.fancybox-button:link,.fancybox-button:visited{color:#ccc}.fancybox-button:hover{color:#fff}.fancybox-button:focus{outline:none}.fancybox-button.fancybox-focus{outline:1px dotted}.fancybox-button[disabled],.fancybox-button[disabled]:hover{color:#888;cursor:default;outline:none}.fancybox-button div{height:100%}.fancybox-button svg{display:block;height:100%;overflow:visible;position:relative;width:100%}.fancybox-button svg path{fill:currentColor;stroke-width:0}.fancybox-button--fsenter svg:nth-child(2),.fancybox-button--fsexit svg:first-child,.fancybox-button--pause svg:first-child,.fancybox-button--play svg:nth-child(2){display:none}.fancybox-progress{background:#ff5268;height:2px;left:0;position:absolute;right:0;top:0;transform:scaleX(0);transform-origin:0;transition-property:transform;transition-timing-function:linear;z-index:99998}.fancybox-close-small{background:transparent;border:0;border-radius:0;color:#ccc;cursor:pointer;opacity:.8;padding:8px;position:absolute;right:-12px;top:-44px;z-index:401}.fancybox-close-small:hover{color:#fff;opacity:1}.fancybox-slide--html .fancybox-close-small{color:currentColor;padding:10px;right:0;top:0}.fancybox-slide--image.fancybox-is-scaling .fancybox-content{overflow:hidden}.fancybox-is-scaling .fancybox-close-small,.fancybox-is-zoomable.fancybox-can-pan .fancybox-close-small{display:none}.fancybox-navigation .fancybox-button{background-clip:content-box;height:100px;opacity:0;position:absolute;top:calc(50% - 50px);width:70px}.fancybox-navigation .fancybox-button div{padding:7px}.fancybox-navigation .fancybox-button--arrow_left{left:0;left:env(safe-area-inset-left);padding:31px 26px 31px 6px}.fancybox-navigation .fancybox-button--arrow_right{padding:31px 6px 31px 26px;right:0;right:env(safe-area-inset-right)}.fancybox-caption{background:linear-gradient(0deg,rgba(0,0,0,.85) 0,rgba(0,0,0,.3) 50%,rgba(0,0,0,.15) 65%,rgba(0,0,0,.075) 75.5%,rgba(0,0,0,.037) 82.85%,rgba(0,0,0,.019) 88%,transparent);bottom:0;color:#eee;font-size:14px;font-weight:400;left:0;line-height:1.5;padding:75px 44px 25px;pointer-events:none;right:0;text-align:center;z-index:99996}@supports (padding:max(0px)){.fancybox-caption{padding:75px max(44px,env(safe-area-inset-right)) max(25px,env(safe-area-inset-bottom)) max(44px,env(safe-area-inset-left))}}.fancybox-caption--separate{margin-top:-50px}.fancybox-caption__body{max-height:50vh;overflow:auto;pointer-events:all}.fancybox-caption a,.fancybox-caption a:link,.fancybox-caption a:visited{color:#ccc;text-decoration:none}.fancybox-caption a:hover{color:#fff;text-decoration:underline}.fancybox-loading{animation:a 1s linear infinite;background:transparent;border:4px solid #888;border-bottom-color:#fff;border-radius:50%;height:50px;left:50%;margin:-25px 0 0 -25px;opacity:.7;padding:0;position:absolute;top:50%;width:50px;z-index:99999}@keyframes a{to{transform:rotate(1turn)}}.fancybox-animated{transition-timing-function:cubic-bezier(0,0,.25,1)}.fancybox-fx-slide.fancybox-slide--previous{opacity:0;transform:translate3d(-100%,0,0)}.fancybox-fx-slide.fancybox-slide--next{opacity:0;transform:translate3d(100%,0,0)}.fancybox-fx-slide.fancybox-slide--current{opacity:1;transform:translateZ(0)}.fancybox-fx-fade.fancybox-slide--next,.fancybox-fx-fade.fancybox-slide--previous{opacity:0;transition-timing-function:cubic-bezier(.19,1,.22,1)}.fancybox-fx-fade.fancybox-slide--current{opacity:1}.fancybox-fx-zoom-in-out.fancybox-slide--previous{opacity:0;transform:scale3d(1.5,1.5,1.5)}.fancybox-fx-zoom-in-out.fancybox-slide--next{opacity:0;transform:scale3d(.5,.5,.5)}.fancybox-fx-zoom-in-out.fancybox-slide--current{opacity:1;transform:scaleX(1)}.fancybox-fx-rotate.fancybox-slide--previous{opacity:0;transform:rotate(-1turn)}.fancybox-fx-rotate.fancybox-slide--next{opacity:0;transform:rotate(1turn)}.fancybox-fx-rotate.fancybox-slide--current{opacity:1;transform:rotate(0deg)}.fancybox-fx-circular.fancybox-slide--previous{opacity:0;transform:scale3d(0,0,0) translate3d(-100%,0,0)}.fancybox-fx-circular.fancybox-slide--next{opacity:0;transform:scale3d(0,0,0) translate3d(100%,0,0)}.fancybox-fx-circular.fancybox-slide--current{opacity:1;transform:scaleX(1) translateZ(0)}.fancybox-fx-tube.fancybox-slide--previous{transform:translate3d(-100%,0,0) scale(.1) skew(-10deg)}.fancybox-fx-tube.fancybox-slide--next{transform:translate3d(100%,0,0) scale(.1) skew(10deg)}.fancybox-fx-tube.fancybox-slide--current{transform:translateZ(0) scale(1)}@media (max-height:576px){.fancybox-slide{padding-left:6px;padding-right:6px}.fancybox-slide--image{padding:6px 0}.fancybox-close-small{right:-6px}.fancybox-slide--image .fancybox-close-small{background:#4e4e4e;color:#f2f4f6;height:36px;opacity:1;padding:6px;right:0;top:0;width:36px}.fancybox-caption{padding-left:12px;padding-right:12px}@supports (padding:max(0px)){.fancybox-caption{padding-left:max(12px,env(safe-area-inset-left));padding-right:max(12px,env(safe-area-inset-right))}}}.fancybox-share{background:#f4f4f4;border-radius:3px;max-width:90%;padding:30px;text-align:center}.fancybox-share h1{color:#222;font-size:35px;font-weight:700;margin:0 0 20px}.fancybox-share p{margin:0;padding:0}.fancybox-share__button{border:0;border-radius:3px;display:inline-block;font-size:14px;font-weight:700;line-height:40px;margin:0 5px 10px;min-width:130px;padding:0 15px;text-decoration:none;transition:all .2s;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;white-space:nowrap}.fancybox-share__button:link,.fancybox-share__button:visited{color:#fff}.fancybox-share__button:hover{text-decoration:none}.fancybox-share__button--fb{background:#3b5998}.fancybox-share__button--fb:hover{background:#344e86}.fancybox-share__button--pt{background:#bd081d}.fancybox-share__button--pt:hover{background:#aa0719}.fancybox-share__button--tw{background:#1da1f2}.fancybox-share__button--tw:hover{background:#0d95e8}.fancybox-share__button svg{height:25px;margin-right:7px;position:relative;top:-1px;vertical-align:middle;width:25px}.fancybox-share__button svg path{fill:#fff}.fancybox-share__input{background:transparent;border:0;border-bottom:1px solid #d7d7d7;border-radius:0;color:#5d5b5b;font-size:14px;margin:10px 0 0;outline:none;padding:10px 15px;width:100%}.fancybox-thumbs{background:#ddd;bottom:0;display:none;margin:0;-webkit-overflow-scrolling:touch;-ms-overflow-style:-ms-autohiding-scrollbar;padding:2px 2px 4px;position:absolute;right:0;-webkit-tap-highlight-color:rgba(0,0,0,0);top:0;width:212px;z-index:99995}.fancybox-thumbs-x{overflow-x:auto;overflow-y:hidden}.fancybox-show-thumbs .fancybox-thumbs{display:block}.fancybox-show-thumbs .fancybox-inner{right:212px}.fancybox-thumbs__list{font-size:0;height:100%;list-style:none;margin:0;overflow-x:hidden;overflow-y:auto;padding:0;position:absolute;position:relative;white-space:nowrap;width:100%}.fancybox-thumbs-x .fancybox-thumbs__list{overflow:hidden}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar{width:7px}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-track{background:#fff;border-radius:10px;box-shadow:inset 0 0 6px rgba(0,0,0,.3)}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-thumb{background:#2a2a2a;border-radius:10px}.fancybox-thumbs__list a{-webkit-backface-visibility:hidden;backface-visibility:hidden;background-color:rgba(0,0,0,.1);background-position:50%;background-repeat:no-repeat;background-size:cover;cursor:pointer;float:left;height:75px;margin:2px;max-height:calc(100% - 8px);max-width:calc(50% - 4px);outline:none;overflow:hidden;padding:0;position:relative;-webkit-tap-highlight-color:transparent;width:100px}.fancybox-thumbs__list a:before{border:6px solid #ff5268;bottom:0;content:"";left:0;opacity:0;position:absolute;right:0;top:0;transition:all .2s cubic-bezier(.25,.46,.45,.94);z-index:99991}.fancybox-thumbs__list a:focus:before{opacity:.5}.fancybox-thumbs__list a.fancybox-thumbs-active:before{opacity:1}@media (max-width:576px){.fancybox-thumbs{width:110px}.fancybox-show-thumbs .fancybox-inner{right:110px}.fancybox-thumbs__list a{max-width:calc(100% - 10px)}}
.product__item {display:none;}
.product__item.active {display:block;}
.product__tabs a {cursor:pointer;}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js"></script>
<script type="text/javascript">
var interestSwiper = new Swiper ('.interesting .swiper-container', {
        direction: 'horizontal',
        slidesPerView: 2,
        loop: true,
        navigation: {
            nextEl: '.interesting__next',
            prevEl: '.interesting__prev',
        },
        breakpoints: {
            768: {
                slidesPerView: 4,
            },
            1366: {
                slidesPerView: 6,
            },
            1851: {
                slidesPerView: 8,
            },
        }
    }
);
var productSwiper = new Swiper ('.product__photo .swiper-container', {
        direction: 'horizontal',
        slidesPerView: 1,
        loop: false,
        pagination: {
            el: '.product__photo .swiper-pagination',
            clickable: true,
            renderBullet: function (index, className) {
                return '<span class="' + className + '"><img src="<?php echo $popup; ?>" alt=""></span>';
            },
        }
    }
);
</script>
<script type="text/javascript"><!--
$('.button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('.button-cart').button('loading');
		},
		complete: function() {
			$('.button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				$('.call-cart > span').html(json['total']);
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script>
(function($) {
$(function() {
  $('.product__tabs').on('click', 'a:not(.active)', function() {
    $(this)
      .addClass('active').siblings().removeClass('active')
      .closest('div.product').find('div.product__item').removeClass('active').eq($(this).index()).addClass('active');
  });
  
});
})(jQuery);
</script>

<script>
$(document).ready(function() {
$(".reviews__button").click(function() {
$(".reviews__text").css({"display":"none"});
$(".reviews__form").css({"display":"block"});
});
 
 $('.reviews__more').click(function() {
    $(this).hide();
	$('.comment_content').removeClass('inactive');
});
 
});
</script>
<script src="/catalog/view/javascript/jquery/jquery.fancybox.min.js"></script>
<?php echo $footer; ?>