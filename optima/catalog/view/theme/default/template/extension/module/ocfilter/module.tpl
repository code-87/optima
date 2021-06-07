<?php if ($options || $show_price) { ?>
<div class="sidefilter" id="ocfilter">
<div class="sidefilter__tabs tabs"><a class="first active" data-tab=".item-auto">По авто</a><a class="second" data-tab=".item-size">По размеру</a></div>

<div class="sidefilter__item item item-auto">
<?php include 'auto_brand.tpl'; ?>
</div>


<div class="sidefilter__item item inactive item-size">
<?php include 'selected_filter.tpl'; ?>
<?php include 'filter_price.tpl'; ?>
<?php include 'filter_list.tpl'; ?>
</div>

</div>

<script type="text/javascript"><!--
$(function() {
//  $('body').append($('.ocfilter-mobile').remove().get(0).outerHTML);
	var options = {
  //  mobile: $('.ocfilter-mobile').is(':visible'),
    php: {
      searchButton : <?php echo $search_button; ?>,
      showPrice    : <?php echo $show_price; ?>,
	    showCounter  : <?php echo $show_counter; ?>,
			manualPrice  : <?php echo $manual_price; ?>,
      link         : '<?php echo $link; ?>',
	    path         : '<?php echo $path; ?>',
	    params       : '<?php echo $params; ?>',
	    index        : '<?php echo $index; ?>'
	  },
    text: {
	    show_all: '<?php echo $text_show_all; ?>',
	    hide    : '<?php echo $text_hide; ?>',
	    load    : '<?php echo $text_load; ?>',
			any     : '<?php echo $text_any; ?>',
	    select  : '<?php echo $button_select; ?>'
	  }
	};

//  if (options.mobile) {
//    $('.ocf-offcanvas-body').html($('#ocfilter').remove().get(0).outerHTML);
//  }

//  $('[data-toggle="offcanvas"]').on('click', function(e) {
//    $(this).toggleClass('active');
//    $('body').toggleClass('modal-open');
//    $('.ocfilter-mobile').toggleClass('active');
//  });

  setTimeout(function() {
    $('#ocfilter').ocfilter(options);
  }, 1);
});
//>
</script -->
<?php } ?>