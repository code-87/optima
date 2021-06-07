<div class="modal modal-cart">
<div class="modal__body">
<a class="modal__close"  onclick="$('.modal-cart').popup('hide')" ><img src="img/cross.svg" alt=""></a>
<h3>Корзина</h3>
<?php if ($products || $vouchers) { ?>
<div class="modal__cart cart">
<?php foreach ($products as $key => $product) { ?>
<div class="cart__item cart__item_<?php echo $key; ?>_<?php echo $product['id']; ?>">
<p class="cart__name">
<a onclick="$(this).parent().next().children('.cart__count').children().find('input').val(''); updateCart('<?php echo $product['id']; ?>', '<?php echo $product['key']; ?>')"><img src="img/cross.svg" alt=""></a> <?php echo $product['name']; ?></p>
<div class="cart__info">
<div class="cart__photo">
<?php if ($product['thumb']) { ?><img src="<?php echo $product['thumb']; ?>" onclick="location='<?php echo $product['href']; ?>'" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /><?php } ?>
<?php if ($product['price']) { ?><p><?php echo $product['price']; ?></p><?php } ?>
</div>
<div class="cart__count">
<div class="cart__plus">
<a  onclick="updateCart('<?php echo $product['id']; ?>', '<?php echo $product['key']; ?>', '-')"><img src="img/minus.svg" alt=""></a>
<input type="text" name="<?php echo $product['key']; ?>" size="2" value="<?php echo $product['quantity']; ?>" onchange="updateCart('<?php echo $product['id']; ?>', '<?php echo $product['key']; ?>')" />
<a onclick="updateCart('<?php echo $product['id']; ?>', '<?php echo $product['key']; ?>', '+')"><img src="img/plus.svg" alt=""></a>
</div>
<p>шт</p>
</div>
<div class="cart__total"><?php echo $product['total']; ?></div>
</div>
</div>
<?php } ?>
</div>

<div class="modal__bottom">
<div class="modal__total">
<p><?php foreach($totals as $total) { ?><?php echo $total['title']; ?> <?php echo $total['text']; ?><?php } ?></p>
<button type="button" onclick="$('.modal-cart').popup('hide')">Продолжить покупки</button>
</div>
<button type="button" class="modal__button" onclick="location='<?php echo $checkout; ?>'">Оформить заказ</button>
</div>
</div>
<?php } else { ?>
<div class="empty"><?php echo $text_empty; ?></div>
<?php } ?>
<input type="hidden" name="addtocart_logic" value="<?php echo $addtocart_logic; ?>" />
<input type="hidden" name="click_on_cart" value="<?php echo $click_on_cart; ?>" />
</div>


<script type="text/javascript">
$(document).ready(function(){
	$('.modal-cart').popup({transition: 'all 0.3s',	scrolllock: true});	
});
function p_array() {
	<?php foreach ($products as $product) { ?>
		<?php if($product['option']) { ?>
			replace_button('<?php echo $product['id']; ?>', 1);
		<?php } else { ?>
			replace_button('<?php echo $product['id']; ?>', 0);
		<?php } ?>
	<?php } ?>
}
</script>