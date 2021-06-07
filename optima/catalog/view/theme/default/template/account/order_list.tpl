<?php echo $header; ?>
<div class="content content-story content-lk">
    <div class="wrapper">
        <h1>История покупок</h1>
        <div class="lk">
            <div class="lk__nav">
<a href="/my-account/">Ваши данные</a>
                <a href="/simplecheckout/">Ваша корзина</a>
                <a href="/order-history/">История покупок</a>
                <a href="/viewed-product/">Просмотренные товары</a>
                <!--a href="">Списки желаний</a-->
            </div>
<div class="lk__story story">
<?php if ($orders) { ?>
<?php foreach ($orders as $order) { ?>
<div class="story__item">
<div class="story__left">
<div class="story__photo">
<img src="img/catalog/1.jpg" alt="">
</div>
<div class="story__name">
<p><?php echo $order['date_added']; ?></p>
<p></p>
</div>
</div>
<div class="story__right">
<div class="story__info">
<p class="story__name-tablet"> </p>
<a href="<?php echo $order['view']; ?>">Номер заказа <?php echo $order['order_id']; ?></a>
<p>Статус заказа – <?php echo $order['status']; ?></p>
</div>
<div class="story__count">
<p class="story__code"> <span></span></p>
<p class="story__date-tablet"><?php echo $order['date_added']; ?></p>
<div class="story__price">
<p><?php echo $order['products']; ?> шт.</p>
<p class="story__summ">Сумма <?php echo $order['total']; ?></p>
</div>
</div>
</div>
</div>
<?php } ?>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>

</div>
</div>
</div>
</div>








<?php echo $footer; ?>
