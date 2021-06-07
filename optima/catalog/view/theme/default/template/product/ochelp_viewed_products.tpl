<?php echo $content_top; ?>

    <div class="wrapper">
        <h1>Просмотренные товары</h1>
        <div class="lk">
            <div class="lk__nav">
                <a href="/my-account/">Ваши данные</a>
                <a href="/simplecheckout/">Ваша корзина</a>
                <a href="/order-history/">История покупок</a>
                <a href="/viewed-product/">Просмотренные товары</a>
                <!--a href="">Списки желаний</a-->
            </div>
<div class="lk__interesting interesting">
<?php if ($products) { ?>
<div class="swiper-container">
<a class="interesting__prev"><img src="img/product-prev.svg" alt=""></a>
<a class="interesting__next"><img src="img/product-next.svg" alt=""></a>
<div class="swiper-wrapper">
<?php foreach ($products as $product) { ?>
<div class="swiper-slide">
<div class="catalog__item">
<div class="catalog__title"><h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4></div>
<a href="<?php echo $product['href']; ?>" class="catalog__photo"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
<div class="catalog__price">
<?php if ($product['price']) { ?>
<p><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><?php echo $product['special']; ?><?php } ?></p>
<?php } ?>
<button onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">купить</button></div>
</div>
</div>
<?php } ?>
</div>
</div>
<?php } ?>
</div>
           


<?php if ($products) { ?>
<div class="lk__catalog catalog">
<?php foreach ($products as $product) { ?>
<div class="catalog__item">
<div class="catalog__title"><h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4></div>
<a href="<?php echo $product['href']; ?>" class="catalog__photo"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
<div class="catalog__price">
<?php if ($product['price']) { ?>
<p><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><?php echo $product['special']; ?><?php } ?></p>
<?php } ?>
<button onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">купить</button>
</div>
</div>
<?php } ?>
</div>
<?php } ?>
 </div>
</div>
<?php echo $content_bottom; ?>