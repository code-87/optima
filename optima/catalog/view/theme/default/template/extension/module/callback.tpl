<div class="modal modal-call" id="callback">
<div class="modal__body">
<a class="modal__close">
<img src="img/cross.svg" alt=""></a>
<h3>Заказ обратного звонка</h3><p class="modal__call-text">Введите данные и мы к вам позвоним</p>
<div class="modal__form">
<form id="callback_data" data-ajax-submit enctype="multipart/form-data" method="post">
<?php if(isset($callbackpro['config_on_off_fields_firstname_cb'])) { ?>
<div class="modal__input <?php echo isset($callbackpro['config_fields_firstname_requared_cb']) ? 'sections_block_rquaired' : 'sections_block' ; ?>">
<label>Ваше Имя<sup>*</sup></label>		
<input id="contact-name" class="contact-name" type="text" placeholder="<?php echo $callbackpro['config_placeholder_fields_firstname_cb'][$lang_id]['config_placeholder_fields_firstname_cb']; ?>" value="" name="name">		
<span class="input-group-addon"><i class="icon-append-1 fa fa-user fa-fw"></i></span>
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
</form>


<div class="modal__recaptcha"><p>ReCaptcha я не робот</p></div>
<button onclick="sendCallback();" type="submit" class="ladda-button" data-style="expand-left">Позвонить мне</button>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
<?php if($callbackpro['config_mask_phone_number_cb'] !='') { ?>
$("#contact-phone").mask('<?php echo $callbackpro['config_mask_phone_number_cb'];?>');
<?php } ?>
});
</script>
</div>