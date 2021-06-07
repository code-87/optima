<?php echo $header; ?>
<div class="breadcrumbs">
<div class="wrapper">
<?php if ($products) { ?>
<div class="breadcrumbs__links"><?php foreach ($breadcrumbs as $breadcrumb) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?></div>
<div class="breadcrumbs__sort">
<a href="/index.php?route=product/category&category_id=60" class="list-view active"><img src="img/row.svg" alt=""></a>
<a href="/index.php?route=product/categorycolumn&category_id=60" class="grid-view"><img src="img/column.svg" alt=""></a>
</div>
</div>
</div>

<div class="content content-catalog-column">
<div class="wrapper">
<h1>Подбор шин</h1>
<div class="content-catalog__container">
<?php echo $column_left; ?>
<div class="catalog">
<?php foreach ($products as $product) { ?>
<div class="catalog__row">
<div class="catalog__row-left">
<a href="<?php echo $product['href']; ?>" class="catalog__photo"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
<div class="catalog__info">
<div class="catalog__row-title"><h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4></div>
<div class="catalog__text">
<?php foreach($product['attribute_groups'] as $attribute_group) { ?>
<?php foreach($attribute_group['attribute'] as $attribute) { ?>
<p><span>• <?php echo $attribute['name']; ?> </span>  <span><?php echo $attribute['text']; ?></span></p>
<?php } ?>
<?php } ?>
</div>
 </div>
</div>
<div class="catalog__row-right">
<div class="catalog__code">Код товара: <span><?php echo $product['model']; ?></span></div>
<div class="catalog__row-price">
<?php if ($product['price']) { ?><p><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><?php echo $product['special']; ?><?php } ?></p><?php } ?>
<div class="catalog__buy">
<div class="catalog__count">
<button data-dir="dwn"><span>-</span></button>
<input type="text" name="quantity" value="<?php echo $product['minimum']; ?>" class="quantity_input" style="display: -webkit-box;
display: -ms-flexbox;display: flex;width: 33.333333%;height: 24px;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;-webkit-box-align: center;
-ms-flex-align: center; align-items: center;font-size: 15px;color: rgba(0,0,0,.8);border: 0;background: #c4c4c4;text-align: center;">
<button data-dir="up"><span>+</span></button>
</div>
<button onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).parent().parent().find('.quantity_input').val())">купить</button>
</div>
 </div>
</div>
</div>
<?php } ?>



<script>
$(document).on('click', '.catalog__count button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.catalog__count').find('input').val().trim(),
		newVal = 1;
			
	if (btn.attr('data-dir') == 'up') {
		newVal = parseInt(oldValue) + 1;
	} else {
		if (oldValue > 1) {
			newVal = parseInt(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	btn.closest('.catalog__count').find('input').val(newVal);
});
</script>

<div class="catalog__navigation"><?php echo $pagination; ?></div>
<?php } ?>
</div>
</div>
</div>
</div>
<?php echo $footer; ?>