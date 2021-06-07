<?php if ($comment_status) {  ?>
<div id="cmswidget-<?php echo $cmswidget; ?>" data-prefix="<?php echo $prefix;?>">
<?php echo $box_begin; ?>
<div class="cmswidget-new-<?php echo $cmswidget; ?>">
<div class="container_reviews cmswidget" id="<?php echo $prefix;?>container_reviews_<?php echo $mark;?>_<?php echo $mark_id;?>">
		<noindex>
			<div class="container_reviews_vars acr<?php echo $cmswidget; ?>" style="display: none">
				<div class="mark" data-text="<?php echo $mark; ?>"></div>
				<div class="mark_id" data-text="<?php echo $mark_id; ?>"></div>
				<div class="theme" data-text="<?php echo $theme; ?>"></div>
				<div class="visual_editor" data-text="<?php echo $visual_editor; ?>"></div>
				<div class="ascp_widgets_position" data-text="<?php echo $ascp_widgets_position;?>"></div>
				<div class="settingswidget" data-text="<?php echo $cmswidget; ?>"></div>
				<div class="text_wait" data-text="<?php echo $text_wait; ?>"></div>
				<div class="visual_rating" data-text="<?php echo $settings_widget['visual_rating']; ?>"></div>
				<div class="captcha_status" data-text="<?php if ($captcha_status == '') $captcha_status = 0; echo $captcha_status; ?>"></div>
				<div class="rating_status" data-text="<?php if ($rating_status == '') $rating_status = 0; echo $rating_status; ?>"></div>
				<div class="signer" data-text="<?php echo $settings_widget['signer']; ?>"></div>
				<div class="imagebox" data-text="<?php echo $imagebox; ?>"></div>
				<div class="prefix" data-text="<?php echo $prefix;?>"></div>
				<div class="wysibbuploader" data-text="<?php echo $wysibbuploader;?>"></div>
				<div class="wysibbuploader_key_imageshack" data-text="<?php echo $wysibbuploader_key_imageshack;?>"></div>
			</div>
  		</noindex>
<?php if (isset($settings_widget['visual_editor']) && $settings_widget['visual_editor']) { ?>
<script>
if (typeof WBBLANG !=="undefined"){
CURLANG = WBBLANG['<?php echo $lang_code;?>'] || WBBLANG['en'] || CURLANG;
}
</script>
<?php } ?>

<?php if ($review_guest) { ?>
<a style="display:none;" onclick="$('#<?php echo $prefix;?>comment_id_reply_0').click();" class="textdecoration_none leavereview-<?php echo $cmswidget; ?>" href="<?php echo $href; ?>#<?php echo $prefix;?>comment-title"><ins class="hrefajax textdecoration_none"><?php echo $text_write_review; ?><?php if (SC_VERSION > 15) { ?>&nbsp;<i class="fa fa-reply" aria-hidden="true"></i><?php } ?>&nbsp;&darr;</ins></a>
<?php } else { ?><?php echo $error_reg; ?><?php } ?>

<div id="<?php echo $prefix;?>div_comment_<?php echo $mark_id; ?>" >
<div id="<?php echo $prefix;?>comment_<?php echo $mark_id; ?>" ><?php  echo $html_comment; ?></div>

<?php if ($review_guest) { ?>
<div id="<?php echo $prefix;?>comment-title" class="sc_tc_link_write_review">
<a style="display:none;" href="#"  id="<?php echo $prefix;?>comment_id_reply_0" data-cmswidget="<?php echo $cmswidget; ?>" data-prefix="<?php echo $prefix;?>" class="comment_reply comment_buttons form_reply">
<ins id="<?php echo $prefix;?>reply_0" class="hrefajax text_write_review"><?php echo $text_write; ?></ins>
</a>
</div>


<div id="<?php echo $prefix;?>comment_work_0" class="<?php echo $prefix;?>comment_work"></div>
<div id="<?php echo $prefix;?>reply_comments" class="<?php echo $prefix;?>comment_form comment_form" data-prefix="<?php echo $prefix;?>" style="display:none">
<div id="<?php echo $prefix;?>comment_work_" class="<?php echo $prefix;?>form_customer_pointer">
<?php if (isset($customer_id) && !$customer_id)   { ?>
<div id="form_customer_none" style="display:none;"></div>
<div class="form_customer <?php echo $prefix;?>form_customer" id="<?php echo $prefix;?>form_customer" style="display:none;">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<div class="form_customer_content">
<a class="modal__close" onclick="$('.<?php echo $prefix;?>form_customer').hide(); $('.sc-auth').hide(); return false;">
<img src="img/cross.svg" alt=""></a>
<div>
<div class="order__input"><label><?php echo $entry_email; ?></label><input type="text" name="email" class="form-control sc-form-control" value="<?php echo $email; ?>" /></div>
<div class="order__input"><label><?php echo $entry_password; ?></label><input type="password" name="password" class="form-control sc-form-control" value="<?php echo $password; ?>" /></div>
<div class="profile__button">
<button value="<?php echo $button_login; ?>" class="button btn btn-primary"><?php echo $button_login; ?></button></div>
<?php if ($redirect) { ?><input type="hidden" name="redirect" value="<?php echo $redirect; ?>#tabs" /><?php } ?>
</div>
<div class="floatleft sc-auth" style="display:none;"></div>
</div>
</form>
</div>
<?php } ?>
<div class="reviews__form">
<form id="<?php echo $prefix;?>form_work_">
<div class="seocmspro_customer_name width100 overflowhidden" <?php  if (isset($settings_widget['name_status']) && !$settings_widget['name_status'])   {   ?>style="display: none;"<?php } ?>>
<?php if (isset($settings_widget['avatar_status']) && $settings_widget['avatar_status']) { ?>
<div class="seocmspro_load_avatar seocmspro_avatar"><img src="<?php echo $avatar_customer; ?>" alt="avatar" style="width:<?php echo $avatar_width; ?>px ; height:<?php echo $avatar_height; ?>px ; "></div>
<?php } ?>
<div class="seocmspro_author" <?php  if (isset($settings_widget['name_status']) && !$settings_widget['name_status'])   {   ?>style="display: none;"<?php } ?>>
<input type="text" name="name" class="form-control sc-form-control" onblur="if (this.value==''){this.value='<?php echo $text_login; ?>'}" onfocus="if (this.value=='') this.value='<?php echo $text_login; ?>';"  value="<?php echo $text_login; ?>" <?php
if (isset($customer_id) && $customer_id) {
//echo 'readonly="readonly" style="background-color:#DDD; color: #555;"';
}
?>>
<?php if (isset($fields) && !empty($fields)) { ?>
<?php if (!$fields_view) { ?><a href="#" class="hrefajax" onclick="$('.addfields').toggle(); return false;"><?php echo $language->get('entry_addfields_begin');  ?><ins class="lowercase"><?php
$i=0;
foreach($fields as $af_name => $field) {
$i++;
if (isset($field['field_description'][$config_language_id])) {
echo str_replace('?', '', $field['field_description'][$config_language_id]);
if (count($fields)!=$i) echo ", ";
}
}
?></ins></a>
<?php } ?>
<?php
foreach ($fields as $af_name => $field) {
if (isset($field['field'][$config_language_id]['field_class_in']) && $field['field'][$config_language_id]['field_class_in']!='') {$class_in = $field['field'][$config_language_id]['field_class_in'];} else {$class_in = '';}
if ($class_in!='') {$field_class = $class_in;} else {$field_class = 'blog-record';}
if (isset($field['field_must']) && $field['field_must']=="1") {$field_class.=' borderleft3pxred';}
if (!isset($field['field_public'])) {$field['field_public'] = true;}
if (!isset($field['field'][$config_language_id]['field_template_in']) || $field['field'][$config_language_id]['field_template_in']=='') {

				$field['field'][$config_language_id]['field_template_in'] ='
				<div>
					  <div class="floatleft">
					  {IMAGE}
					  </div>
				      <div>
				      	{REQUIRE}
				      	<ins class="field_title">{DESCRIPTION}</ins>
				      	<div>
				      		{FIELD}
				      	</div>
				      </div>
				      <div class="clearboth"> </div>
			    </div>
			    ';
			}


			if(!$field['field_public']) {
				$field['field_description'][$config_language_id].= $language->get('text_unpublic');
			}

			if (isset($field['field'][$config_language_id]['field_template_in']) && $field['field'][$config_language_id]['field_template_in']!='') {

				 $field_html = $field['field'][$config_language_id]['field_template_in'];
				 $field_text ='';

				if (isset($field['field'][$config_language_id]['field_class_in']) && $field['field'][$config_language_id]['field_class_in']!='') {
					$class = $field['field'][$config_language_id]['field_class_in'];
				} else {
					$class = '';
				}

				if ($class!='') {$field_class = $class;} else {$field_class = 'blog-record';}
				if ($field['field_must']=="1") {$field_class.=' borderleft3pxred';}

$field_html = str_replace('{FIELD}', $field_text, $field_html);
if ($field['field_name']=='modelcar') { $field_html = '<input type="text" name="af['.$field['field_name'].']" class="form-control sc-form-control '.$field_class.'" placeholder="Модель авто">'; 
} 
if ($field['field_name']=='expirience') { $field_html = '<input type="text" name="af['.$field['field_name'].']" class="form-control sc-form-control '.$field_class.'" placeholder="Опыт использования">'; 
} 
				if ($field['field_image']!='') {
					$field_html = str_replace('{IMAGE}', '<img src="'.$http_image.$field['field_image'].'" title="'.strip_tags($field['field_description'][$config_language_id]).'" alt="'.strip_tags($field['field_description'][$config_language_id]).'">', $field_html);
				} else {
					$field_html = str_replace('{IMAGE}', '',$field_html);
				}

if ($field['field_description'][$config_language_id]!='') {$field_html = str_replace('{DESCRIPTION}',$field['field_description'][$config_language_id], $field_html);} else {$field_html = str_replace('{DESCRIPTION}', '',$field_html);}
if (isset($field['field_must']) && $field['field_must'])  {$field_html = str_replace('{REQUIRE}', '<span class="blog_require '.$class.'">*</span>', $field_html);} else {$field_html = str_replace('{REQUIRE}', '',$field_html);}
echo html_entity_decode($field_html, ENT_QUOTES, 'UTF-8') ;}
  }
?>
<?php  }  ?>

<?php  if (isset($customer_id) && !$customer_id)   { ?>
<div class="asc_textlogin">
<a href="#" class="textdecoration_none hrefajax" data-cmswidget="<?php echo $cmswidget; ?>" data-prefix="<?php echo $prefix; ?>">
<ins class="hrefajax customer_enter customer_auth" data-prefix="<?php echo $prefix; ?>" data-cmswidget="<?php echo $cmswidget; ?>"><?php echo $text_customer_enter; ?></ins></a>
</div><?php } ?>

<div class="reviews__your-rate">
<?php if (isset($settings_widget['rating']) && $settings_widget['rating']) { ?>
<p>Общая оценка</p>
<?php if (isset($settings_widget['visual_rating']) && $settings_widget['visual_rating']) { ?>
<div class="reviews__stars">
<input id="star-4" type="radio" name="rating" value="5"><label title="gorgeous" for="star-4"></label>
<input id="star-3" type="radio" name="rating" value="4"><label title="good" for="star-3"></label>
<input id="star-2" type="radio" name="rating" value="3"><label title="regular" for="star-2"></label>
<input id="star-1" type="radio" name="rating" value="2"><label title="poor" for="star-1"></label>
<input id="star-0" type="radio" name="rating" value="1"><label title="bad" for="star-0"></label>
</div>
						<?php } else { ?>
						<span><ins class="color_bad"><?php echo $entry_bad; ?></ins></span>&nbsp;
						<input type="radio"  name="rating" value="1" >
						<ins class="blog-ins_rating" style="">1</ins>
						<input type="radio"  name="rating" value="2" >
						<ins class="blog-ins_rating" >2</ins>
						<input type="radio"  name="rating" value="3" >
						<ins class="blog-ins_rating" >3</ins>
						<input type="radio"  name="rating" value="4" >
						<ins class="blog-ins_rating" >4</ins>
						<input type="radio"  name="rating" value="5" >
						<ins class="blog-ins_rating" >5</ins>
						&nbsp;&nbsp; <span><ins  class="color_good"><?php echo $entry_good; ?></ins></span>
<?php } ?>
<?php } else { ?>
<input type="radio" name="rating" value="5" checked style="display:none;"><?php } ?>
</div>
</div>
</div>

<?php if (isset($fields) && !empty($fields)) { ?>
<?php if (!$fields_view) { ?><a href="#" class="hrefajax" onclick="$('.addfields').toggle(); return false;"><?php echo $language->get('entry_addfields_begin');  ?><ins class="lowercase"><?php
$i=0;
foreach($fields as $af_name => $field) {
$i++;
if (isset($field['field_description'][$config_language_id])) {
echo str_replace('?', '', $field['field_description'][$config_language_id]);
if (count($fields)!=$i) echo ", ";
}
}
?></ins></a>
<?php } ?>
<?php
foreach ($fields as $af_name => $field) {
if (isset($field['field'][$config_language_id]['field_class_in']) && $field['field'][$config_language_id]['field_class_in']!='') {$class_in = $field['field'][$config_language_id]['field_class_in'];} else {$class_in = '';}
if ($class_in!='') {$field_class = $class_in;} else {$field_class = 'blog-record';}
if (isset($field['field_must']) && $field['field_must']=="1") {$field_class.=' borderleft3pxred';}
if (!isset($field['field_public'])) {$field['field_public'] = true;}

			if (!isset($field['field'][$config_language_id]['field_template_in']) || $field['field'][$config_language_id]['field_template_in']=='') {

				$field['field'][$config_language_id]['field_template_in'] ='
				<div>
					  <div class="floatleft">
					  {IMAGE}
					  </div>
				      <div>
				      	{REQUIRE}
				      	<ins class="field_title">{DESCRIPTION}</ins>
				      	<div>
				      		{FIELD}
				      	</div>
				      </div>
				      <div class="clearboth"> </div>
			    </div>
			    ';
			}

if(!$field['field_public']) {$field['field_description'][$config_language_id].= $language->get('text_unpublic');}
if (isset($field['field'][$config_language_id]['field_template_in']) && $field['field'][$config_language_id]['field_template_in']!='') {
$field_html = $field['field'][$config_language_id]['field_template_in'];
$field_text ='';
if (isset($field['field'][$config_language_id]['field_class_in']) && $field['field'][$config_language_id]['field_class_in']!='') {$class = $field['field'][$config_language_id]['field_class_in'];} else {$class = '';}
$field_html = '<div style="display:none;">({FIELD})</div>';
if ($field['field_name']=='plusprod') { $field_html = '<textarea name="af['.$field['field_name'].']" cols="40" rows="1" placeholder="Преимущества"></textarea>'; } 
if ($field['field_name']=='minusprod') { $field_html = '<textarea name="af['.$field['field_name'].']" cols="40" rows="1" placeholder="Недостатки"></textarea>'; } 

				if ($field['field_image']!='') {
					$field_html = str_replace('{IMAGE}', '<img src="'.$http_image.$field['field_image'].'" title="'.strip_tags($field['field_description'][$config_language_id]).'" alt="'.strip_tags($field['field_description'][$config_language_id]).'">', $field_html);
				} else {
					$field_html = str_replace('{IMAGE}', '',$field_html);
				}

				if ($field['field_description'][$config_language_id]!='') {
					$field_html = str_replace('{DESCRIPTION}',$field['field_description'][$config_language_id], $field_html);
				} else {
					$field_html = str_replace('{DESCRIPTION}', '',$field_html);
				}

				if (isset($field['field_must']) && $field['field_must'])  {
					$field_html = str_replace('{REQUIRE}', '<span class="blog_require '.$class.'">*</span>', $field_html);
				} else {
					$field_html = str_replace('{REQUIRE}', '',$field_html);
				}

	 			echo html_entity_decode($field_html, ENT_QUOTES, 'UTF-8') ;
		 	}
  }
?>

<?php  }  ?>


<?php  if (isset($settings_widget['comment_must']) && $settings_widget['comment_must'])   {   ?>
<ins class="color_entry_name"><?php echo $entry_comment;  ?></ins><span class="blog_require">*</span>
<div class="ascp_bbode"><textarea name="text" id="<?php echo $prefix;?>editor_" class="form-control blog-record-textarea <?php echo $prefix;?>editor blog-textarea_height"></textarea></div>
<?php if (isset($settings_widget['help_view']) && $settings_widget['help_view']) { ?><div class="help_text"><span class="text_note"><?php echo $text_note; ?></span></div><?php  } ?>
<?php  } ?>
<?php if ($captcha_status) { ?><?php if (isset($settings_widget['help_view']) && $settings_widget['help_view']) { ?>
<div class="ascp_captcha_title help_text"><?php echo $entry_captcha_title; ?>&nbsp;&darr;</div>
<div class="ascp_entry_captcha help_text"><?php echo $entry_captcha; ?></div><?php  } ?><div class="captcha_status"></div><?php  } ?>
<?php if (SC_VERSION < 20) { ?>
<div class="buttons">
<div class="left"><a class="button button-comment" id="<?php echo $prefix;?>button-comment-0"><span><?php echo $button_write; ?></span></a></div>
</div>
<?php } else { ?>
<div class="reviews__button-container">
<button class="button-comment reviews__button" id="<?php echo $prefix;?>button-comment-0" data-loading-text="Опубликовать отзыв" onclick="return false;">Опубликовать отзыв</button>
</div>
<?php } ?>
</form>
</div>
</div>
</div>
<?php }?>
</div>
</div>
</div>
<?php echo $box_end; ?>
</div>
<style>.asc_textlogin {margin-bottom:12px;}.form_customer {position: relative;padding-top: 30px;}
</style>
<script>

<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
	$('#cmswidget-<?php echo $cmswidget; ?>').hide();
<?php } ?>

comment_form_<?php echo $prefix;?> = $('#<?php echo $prefix;?>reply_comments').clone();
$('#<?php echo $prefix;?>reply_comments').remove();

if (typeof tab_select == "undefined") {
	var tab_select = new Array();
}

tab_select[<?php echo $cmswidget; ?>] = '#tab-html-<?php echo $cmswidget; ?>';
</script>


<script>
<?php if (isset($settings_widget['doc_ready']) && $settings_widget['doc_ready']) { ?>
$(document).ready(function(){
<?php } ?>

		<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>

		    var prefix = '<?php echo $prefix;?>';
            var cmswidget = '<?php echo $cmswidget; ?>';
			var heading_title = '<?php echo $heading_title; ?>';
			var total = '<?php echo $comment_total; ?>';

			<?php  if (isset($mark_info['url'])) { ?>
			var name = '<?php if (isset($mark_info['name'])) echo htmlspecialchars($mark_info['name'], ENT_QUOTES & ~ENT_COMPAT, 'UTF-8');  ?>';
			var url = '<?php if (isset($mark_info['url'])) echo $mark_info['url']; ?>';
			<?php } ?>

			<?php  if (isset($mark_info['product_info']['url'])) { ?>
			var product_name = '<?php if (isset($mark_info['product_info']['name'])) echo htmlspecialchars($mark_info['product_info']['name'], ENT_QUOTES & ~ENT_COMPAT, 'UTF-8'); ?>';
			var product_url = '<?php if (isset($mark_info['product_info']['url'])) echo $mark_info['product_info']['url']; ?>';
			<?php } ?>

			var data = $('#cmswidget-<?php echo $cmswidget; ?>').clone();

			<?php echo $settings_widget['anchor']; ?>;

            $('#cmswidget-<?php echo $cmswidget; ?>').show();

			$('.cmswidget-new-<?php echo $cmswidget; ?>').attr('id', 'cmswidget-<?php echo $cmswidget; ?>');

			delete data;
			delete prefix;
			delete cmswidget;
			delete total;

			<?php  if (isset($mark_info['product_info']['url'])) { ?>
			delete product_name;
			delete product_url;
			<?php } ?>

			<?php  if (isset($mark_info['url'])) { ?>
			delete name;
			delete url;
			<?php } ?>


	   <?php  } else { ?>
		   url_cmswidget_<?php echo $cmswidget; ?> = '<?php echo $cmswidget; ?>';
	   <?php } ?>



<?php if (isset($settings_widget['doc_ready']) && $settings_widget['doc_ready']) { ?>
});
<?php } ?>

$(window).on("load", function() {

 if ($('.comments_parent').is(':hidden') == false) {

 } else {
 	$('.comments_parent').show();
 }
 $('#<?php echo $prefix;?>comment_id_reply_0').click();

<?php
  if (isset($settings_general['get_pagination']))
	$get_pagination = $settings_general['get_pagination'];
  else
	$get_pagination = 'tracking';
?>

			url = location.href, idx_<?php echo $cmswidget; ?> = url.indexOf("#")
			hash_<?php echo $cmswidget; ?> = idx_<?php echo $cmswidget; ?> != -1 ? url.substring(idx_<?php echo $cmswidget; ?>+1) : "";

			var idx_cmswidget_<?php echo $cmswidget; ?> =  hash_<?php echo $cmswidget; ?>.lastIndexOf("_");
			url_cmswidget_<?php echo $cmswidget; ?> = idx_cmswidget_<?php echo $cmswidget; ?> != -1 ? hash_<?php echo $cmswidget; ?>.substring(idx_cmswidget_<?php echo $cmswidget; ?>+1) : "";

		    if (url_cmswidget_<?php echo $cmswidget; ?> != '') {
		    	switch_tab_<?php echo $cmswidget; ?> = true;
		    }  else {
		    	switch_tab_<?php echo $cmswidget; ?> = false;
		    }

			<?php if (isset($request_get[$get_pagination])) { ?>
				url_cmswidget_<?php echo $cmswidget; ?> = '<?php echo $cmswidget; ?>';
				switch_tab_<?php echo $cmswidget; ?> = true;
			<?php  } ?>


            if (url_cmswidget_<?php echo $cmswidget; ?> != '') {
				if (url_cmswidget_<?php echo $cmswidget; ?> == '<?php echo $request_get['cmswidget']; ?>' && switch_tab_<?php echo $cmswidget; ?>) {
					$('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').trigger('click');
	            }
                if ($('#' + hash_<?php echo $cmswidget; ?>).length && hash_<?php echo $cmswidget; ?> != "") {
                	$('html, body').animate({scrollTop: $('#' + hash_<?php echo $cmswidget; ?>).offset().top}, 500, function() {});
                }
			}

});

</script>

<script>
<?php $tab_review = sprintf($tab_review, $comment_total); ?>
$(document).ready(function(){

	if (tab_select[<?php echo $cmswidget; ?>] == '#tab-html-<?php echo $cmswidget; ?>') {
		title_tab_<?php echo $cmswidget; ?> = $('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').html();
		$('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').html(title_tab_<?php echo $cmswidget; ?> + ' (<?php echo $comment_total; ?>)');
	}

	<?php if ($comment_total < 1) { ?>
	$('.leavereview-<?php echo $cmswidget; ?>').hide();
	<?php } ?>

});
</script>
<?php } ?>
<?php if (isset($settings_widget['reserved']) && $settings_widget['reserved']!='') {
echo html_entity_decode($settings_widget['reserved'], ENT_QUOTES, 'UTF-8');
} ?>