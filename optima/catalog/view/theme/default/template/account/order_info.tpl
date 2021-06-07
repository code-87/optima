<?php echo $header; ?>
<div class="content content-story content-lk">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
    <div class="wrapper">
        <h1>Детали заказа</h1>
        <div class="lk">
            <div class="lk__nav">
<a href="/my-account/">Ваши данные</a>
                <a href="/simplecheckout/">Ваша корзина</a>
                <a href="/order-history/">История покупок</a>
                <a href="/viewed-product/">Просмотренные товары</a>
                <!--a href="">Списки желаний</a-->
            </div>
<div class="lk__story story">
<?php foreach ($products as $product) { ?>
<div class="story__item">
<div class="story__left">
<div class="story__photo"><img src="img/catalog/1.jpg" alt=""></div>
<div class="story__name"><p><?php echo $date_added; ?></p><p><?php echo $product['name']; ?></p></div>
</div>
<div class="story__right">
<div class="story__info">
<p class="story__name-tablet"><?php echo $product['name']; ?></p>
<div>Номер заказа <?php echo $order_id; ?></div>
<p>Статус заказа – выполнен</p>
 </div>
<div class="story__count">
<p class="story__code">Код товара: <span><?php echo $product['model']; ?></span></p>
<p class="story__date-tablet"><?php echo $date_added; ?></p>
<div class="story__price">
<p><?php echo $product['quantity']; ?> шт.</p>
<p class="story__summ">Сумма <?php echo $product['price']; ?></p>
</div>
</div>
</div>
</div>
<?php } ?>
</div>
</div>
</div>
</div>
<?php echo $footer; ?>