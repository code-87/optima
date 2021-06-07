<?php echo $header; ?>
<div class="breadcrumbs">
<div class="wrapper">
<div class="breadcrumbs__links"><?php foreach ($breadcrumbs as $breadcrumb) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?></div>
</div>
</div>

<div class="content content-text">
    <div class="wrapper h600">
        <h1><?php echo $heading_title; ?></h1>
        <div class="text">
		<?php echo $text_message; ?>
        </div>
    </div>
</div>



<?php echo $footer; ?>