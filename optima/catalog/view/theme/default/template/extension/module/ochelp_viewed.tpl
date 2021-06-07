<div class="product_viewed">
<div class="module_title"><?php echo $heading_title; ?>  
<?php if($show_link) { ?>
<a href="<?php echo $link; ?>">
<i class="fa fa-eye"></i> <?php echo $text_show_all; ?></a>
<?php } ?>
</div>
<div id="product_viewed<?php echo $module; ?>" class="row">
</div>
<style>
  .product_viewed .module_title{
    margin: 20px 0 10px 0;
    color: #444;
    font-size: 22px;
  }
  .product_viewed .module_title a{
    padding: 0 10px;
    color: #888;
    font-size: 14px;
  }
  .product_viewed .module_title a:hover{
    text-decoration: underline;
  }
  .product-thumb{
    position: relative;
  }
  .product-thumb .button_delete{
    position: absolute;
    top: 10px;
    left: 10px;
  }
</style>
<script type="text/javascript"><!--
$('#product_viewed<?php echo $module; ?>').load('index.php?route=extension/module/ochelp_viewed/getProducts', {limit: <?php echo $limit; ?>, width: <?php echo $width; ?>, height: <?php echo $height; ?>});
$('#product_viewed<?php echo $module; ?>').delegate('.button_delete', 'click', function() {
  var button = this;
    $.ajax({
      url: 'index.php?route=product/ochelp_viewed/delete',
      type: 'post',
      data: 'product_id=' + $(button).data('product-id'),
      dataType: 'json',
      success: function(json) {
        $('.alert, .text-danger').remove();

        if(json['success']){
          $('#product_viewed<?php echo $module; ?>').before('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $(button).parent().animate({opacity: 0}, 500, function(){
            $(button).parent().parent().remove();
          });
          
          $('.tooltip').hide();

          $('html, body').animate({
            scrollTop: $('#product_viewed<?php echo $module; ?>').parent().offset().top -50
          }, 600);
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });
  //-->
</script>
</div>