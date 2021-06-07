<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<div class="row">
				<div class="col-sm-12">
	      	<h1 class="text-primary"><?php echo $heading_title; ?></h1>
	      </div>


	      <div class="col-sm-6">
		      <p><?php echo $text_error; ?></p>
		      <?php
		  		if(!empty($categories_for_404)) {	?>
		  			<ul class="404-categories" style="list-style: square; color: #ccc;">
						<?php	foreach ($categories_for_404 as $category) { ?>
						<li><a href="<?= $category['href'] ?>"><?= $category['name'] ?></a></li>
						<?php }	?>
						</ul>
					<?php } ?>
		    	<p><a class="text-primary" style="text-decoration: underline; " href="<?=$continue?>"><?=$button_continue?> &rarr;</a></p>
	      </div>
		    <div class="col-sm-6">
					<img class="img-responsive img-404" src="/image/catalog/404/page_not_found.png" alt="Error 404 Image " />
		    </div>
	    </div><!-- /row-->

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
