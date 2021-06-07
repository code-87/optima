<div class="main__catalog catalog">
  <?php foreach ($products as $product) { ?>
  
  				<div class="catalog__item">
					<div class="catalog__title">
						<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
					</div>
<a href="<?php echo $product['href']; ?>" class="catalog__photo">
<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
</a>
					<div class="catalog__price">
        <?php if ($product['price']) { ?>
        <p>
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <p><?php echo $product['special']; ?></p>
          <?php } ?>
        </p>
        <?php } ?>
<button onclick="cart.add('<?php echo $product['product_id']; ?>');">купить</button>
</div>
</div>
<?php } ?>
</div>