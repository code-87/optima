<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $content_top; ?>
<?php if (SC_VERSION >= 20) { ?>
<div class="breadcrumbs"><div class="wrapper"><div class="breadcrumbs__links">
<?php $i = 0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
<?php if ($count_breadcrumbs != $i) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php } else { ?><a href="<?php echo $breadcrumb['href']; ?>#"><?php } ?><?php echo $breadcrumb['text']; ?></a>
<?php } ?>

<script type="application/ld+json">
{
 "@context": "https://schema.org",
 "@type": "BreadcrumbList",
 "itemListElement": [
<?php $i = 0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
 {
  "@type": "ListItem",
  "position": <?php echo $i; ?>,
  "name": "<?php echo $breadcrumb['text']; ?>",
  "item": "<?php echo $breadcrumb['href']; ?>"
 }<?php if ($count_breadcrumbs != $i) { ?>,<?php } ?>
<?php } ?>
]}
</script>
</div></div></div>
<?php } else { ?>
	<div class="breadcrumb">
		<?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
		<?php echo $breadcrumb['separator']; ?><?php if ($count_breadcrumbs!= $i) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php } else { ?><a href="<?php echo $breadcrumb['href']; ?>#"><?php } ?><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>

<script type="application/ld+json">
{
 "@context": "https://schema.org",
 "@type": "BreadcrumbList",
 "itemListElement": [
<?php $i = 0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
 {
  "@type": "ListItem",
  "position": <?php echo $i; ?>,
  "name": "<?php echo $breadcrumb['text']; ?>",
  "item": "<?php echo $breadcrumb['href']; ?>"
 }<?php if ($count_breadcrumbs != $i) { ?>,<?php } ?>
<?php } ?>
]}
</script>
	</div>
<?php } ?>

<div class="content content-text">
<div class="wrapper">
<h1><?php echo $heading_title; ?></h1>

	    <div class="text">

			<?php if ((isset($description) && $description) || $thumb) { ?>
			<div class="blog-info">
				<?php if ((!isset($settings_blog['category_big_image_status']) && $thumb) || ($thumb && isset($settings_blog['category_big_image_status']) && $settings_blog['category_big_image_status'])) { ?>
				<div class="image blog-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
				<?php } ?>
				<?php if ($description) { ?>
				<div class="blog-description">
					<?php echo $description; ?>
				</div>
				<?php } ?>
			</div>
			<?php } ?>



<?php if ($records) { ?>
<style>
.record_columns .column_width_ {
 	width: <?php if (isset ($settings_blog['block_records_width']) && $settings_blog['block_records_width']!='' ) {
 	 echo $settings_blog['block_records_width'] . '; padding-right: 5px;';
 	} else {
 	 echo '100%; min-width: 100%;';
 	}
 	?>

}
.record_columns h2 a {text-decoration:none;}
.record_columns h2 a:hover {text-decoration:underline;}
.record_columns h2 a:active,.record_columns h2 a:focus {text-decoration:none;border-bottom:2px dotted #3D9ED4;}
</style>
<div class="record_columns">
<?php $record_count = 1; foreach ($records as $record) { ?>
<div class="content-records column_width_ <?php if (isset($record['settings_blog']['first100']) && $record['settings_blog']['first100'] && $record_count == 1) { ?>first100<?php } ?>">
<h2><a href="<?php echo $record['href']; ?>"><?php echo $record['name']; ?></a></h2>
<div class="description record_description"><?php echo $record['description']; ?></div>
</div>
<?php $record_count++; } ?>
</div>

			<?php if (isset ($settings_blog['block_records_width']) && $settings_blog['block_records_width']!='' && $settings_blog['block_records_width']!='100%') { ?>
				<div class="record-grid textalignright margintop5 floatleft">
						<a onclick="records_grid(); return false;" class="floatleft">
							<ins id="ascp_list" class="ascp_list_grid ascp_list"></ins>
						</a>
						<a onclick="records_grid('<?php echo $settings_blog['block_records_width'];?>'); return false;" class="floatleft marginleft5">
							<ins id="ascp_grid" class="ascp_list_grid ascp_grid_active"></ins>
						</a>
				</div>
			<?php } ?>

			<?php if ((isset ($settings_blog['status_order']) && $settings_blog['status_order']) ||  (isset ($settings_blog['status_pagination']) && $settings_blog['status_pagination']) || (!isset ($settings_blog['status_pagination'])) ) { ?>

			<div class="record-filter textalignright margintop5">
		       <ul class="ascp_horizont">
				<?php if ((isset ($settings_blog['status_pagination']) && $settings_blog['status_pagination']) || (!isset ($settings_blog['status_pagination'])) ) { ?>
					<li class="sc-float-right">


						<div class="sc-blog_result">
						<?php echo $text_limit; ?>
						</div>

						<div class="form-group sc-align-right">

							<select onchange="location = this.value;" class="form-control">
								<?php foreach ($limits as $limits) { ?>
								<?php if ($limits['value'] == $limit) { ?>
								<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>

                        </div>

                        <div class="divider100"></div>
						<?php if (SC_VERSION > 15) { ?>
						<div class="sc-blog_result">
						<?php echo $results; ?>
						</div>
						<?php } ?>


					</li>
                    <?php } ?>

                   <?php if (isset ($settings_blog['status_order']) && $settings_blog['status_order']) { ?>
					<li class="sc-float-right">

						<div id="sc-blog_result">
							<?php echo $text_sort; ?>
						</div>

						<div class="form-group sc-align-right">

						<select onchange="location = this.value;" class="form-control">
							<?php foreach ($sorts as $sorts) { ?>
							<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
							<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
						</div>
						<div class="divider100"></div>
						<?php if (SC_VERSION > 15) { ?>
						<div class="sc-blog_result">
						&nbsp;
						</div>
						<?php } ?>

					</li>
                   <?php } ?>
				</ul>
			</div>

			<?php if ((isset ($settings_blog['status_pagination']) && $settings_blog['status_pagination']) || (!isset ($settings_blog['status_pagination'])) ) { ?>
				<?php if (isset($settings_blog['records_more']) && $settings_blog['records_more'] && $entry_records_more!='') { ?>
					<div id="records_more"><a class="records_more button btn btn-primary"><?php echo $entry_records_more; ?></a></div>
				<?php } ?>
			<div class="pagination margintop5"><?php echo $pagination; ?></div>
			<?php } ?>

            <?php } ?>

<?php } ?>


			<?php if ((isset($settings_blog['status_continue']) && $settings_blog['status_continue']) && (isset($categories) && !$categories) && (isset($records) && !$records)) { ?>
			<div class="content"><?php echo $text_empty; ?></div>
			<div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
			</div>
			<?php } ?>


<?php if (isset($settings_blog['reserved']) && $settings_blog['reserved']!='') {
	echo $settings_blog['reserved'];
} ?>

    </div>
	
	
	</div></div>
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>