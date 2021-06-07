<div class="content content-order">
<h1>Оформление заказа</h1>
<form class="order">
<div class="order__top">
<?php if ($display_login) { ?><button type="button" onclick="location.href='/login/'">Я постоянный клиент</button><?php } else { ?><button type="button">Информация о заказе</button><?php } ?>
<div class="order__summ">
<button type="button"><img width="29" src="img/button-cart.svg" alt=""><span>
<?php foreach ($totals as $total) { ?><span class="simplecheckout-cart-total-value"><?php echo $total['text']; ?></span>
<?php } ?></span><img src="img/filter-arrow.svg" alt=""></button>
<div class="order__info info">  
<div class="info__top">
<p class="info__name">№ Наименование:</p>
<div class="info__right"><p class="info__count">шт</p><p class="info__price">цена, грн.</p></div></div>
<?php foreach ($products as $product) { ?>
<div class="info__item">
<a data-onclick="removeProduct" data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key'] ?>" class="info__close"><img src="img/cross.svg" alt=""></a>
<p class="info__name"><?php echo $product['name']; ?></p>
<div class="info__right"><p class="info__count"><?php echo $product['quantity']; ?></p><p class="info__price"><?php echo $product['price']; ?></p></div>
</div>
<?php } ?>
				
<div class="info__summ">
<p>Итого</p>
<p><?php foreach ($totals as $total) { ?><span class="simplecheckout-cart-total-value"><?php echo $total['text']; ?></span>
<?php } ?></p>
</div>
</div>
</div>		
</div>		
</form>
</div>


<div class="simplecheckout-block" id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $has_error ? 'data-error="true"' : '' ?>>
<?php if ($display_header) { ?>
    <div class="checkout-heading panel-heading"><?php echo $text_cart ?></div>
<?php } ?>
<?php if ($attention) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>


<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
</div>
