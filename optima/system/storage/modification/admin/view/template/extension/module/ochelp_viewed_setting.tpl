<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-ochelp-viewed" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
				<h1><?php echo $heading_title; ?></h1>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ochelp-viewed" class="form-horizontal">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
							<li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab-setting">
								<div class="form-group">
								<div class="col-sm-6">
									<div class="alert bg-info text-center">
										<h4><?php echo $text_history_total; ?></h4>
									</div>
								</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-status"><span data-toggle="tooltip" title="<?php echo $help_ajax; ?>"><?php echo $entry_ajax_status; ?></span></label>
									<div class="col-sm-10">
										<select name="ochelp_viewed_ajax" id="input-status" class="form-control">
											<?php if ($viewed_ajax_status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-url"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_url; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="ochelp_viewed_url" id="input-url" class="form-control" value="<?php echo $viewed_url ? $viewed_url : ''; ?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-limit"><span data-toggle="tooltip" title="<?php echo $help_limit; ?>"><?php echo $entry_limit; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="ochelp_viewed_limit" id="input-limit" class="form-control" value="<?php echo $viewed_limit ? $viewed_limit : ''; ?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-product-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="ochelp_viewed_product_limit" id="input-product-limit" class="form-control" value="<?php echo $viewed_product_limit ? $viewed_product_limit : ''; ?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-status-link"><span data-toggle="tooltip" title="<?php echo $help_link; ?>"><?php echo $entry_link_status; ?></span></label>
									<div class="col-sm-10">
										<select name="ochelp_viewed_link" id="input-status-link" class="form-control">
											<?php if ($viewed_link_status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-support">
								<div class="panel-body">
									<?php echo $help_support; ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</div>

				<script>
					$(document).on("submit","form",function(e){
						summernotes = $('.summernote');
						$.each(summernotes, function(){
							if ($(this).summernote('codeview.isActivated')) {
								$(this).summernote('codeview.deactivate'); 
							}
						})
					})
				</script>

				<script>
					$(document).on("submit","form",function(e){
						summernotes = $('.summernote');
						$.each(summernotes, function(){
							if ($(this).summernote('codeview.isActivated')) {
								$(this).summernote('codeview.deactivate'); 
							}
						})
					})
				</script>
<?php echo $footer; ?>