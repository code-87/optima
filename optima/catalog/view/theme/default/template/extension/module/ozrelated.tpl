<div class="product__interesting interesting">
<?php if ($title) { ?><h2><?php echo $title; ?></h2><?php } ?>
<div class="swiper-container">
<a class="interesting__prev">
<img src="img/product-prev.svg" alt="">
</a>
<a class="interesting__next">
<img src="img/product-next.svg" alt="">
</a>
<div class="swiper-wrapper">
<?php foreach ($products as $product) { ?>
<div class="swiper-slide">
<div class="catalog__item">
<div class="catalog__title">
<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
</div>
<a href="<?php echo $product['href']; ?>" class="catalog__photo"><?php if (!$simple&&$product['image']) { ?><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /><?php } ?></a>
<div class="catalog__price">
<?php if (!$simple) { ?>
<p><?php echo $product['price']; ?></p>
<?php } ?>
</div>
</div>
</div>
<?php } ?>
</div>
</div>
</div>