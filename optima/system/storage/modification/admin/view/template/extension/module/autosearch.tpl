<?php echo $header; ?>
<style type="text/css">
.toggle,.toggle:after,.toggle:before{-webkit-transition:all .2s cubic-bezier(.445,.05,.55,.95);transition:all .2s cubic-bezier(.445,.05,.55,.95)}.addpad{padding-top:0;padding-bottom:0}.toggleWrapper{position:absolute;top:50%;overflow:hidden}.toggleWrapper input{position:absolute;left:-99em}.toggle{cursor:pointer;display:inline-block;position:relative;width:120px;height:30px;background:#ccc;border-radius:5px}.toggle:after,.toggle:before{position:absolute;line-height:30px;font-size:14px;z-index:2}.toggle:before{content:"OFF";left:20px;color:#ccc}.toggle:after{content:"ON";right:20px;color:#fff}.toggle__handler{display:inline-block;position:relative;z-index:1;background:#fff;width:65px;height:24px;border-radius:3px;top:3px;left:3px;-webkit-transition:all .2s cubic-bezier(.445,.05,.55,.95);transition:all .2s cubic-bezier(.445,.05,.55,.95);-webkit-transform:translateX(0);transform:translateX(0)}input:checked+.toggle{background:#66B317}input:checked+.toggle:before{color:#fff}input:checked+.toggle:after{color:#66B317}input:checked+.toggle .toggle__handler{width:54px;-webkit-transform:translateX(60px);transform:translateX(60px);border-color:#fff}.form-horizontal .nav>li>a{outline:0}.form-horizontal .nav-tabs>li.active>a{border-top:2px solid #39B3D7!important}
</style>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<span style="padding-right:20px;">
		<a href="https://opencartforum.com/profile/688391-alexdw/?do=content&type=downloads_file" target="_blank" data-toggle="tooltip" title="Другие дополнения" class="btn btn-info"><i class="fa fa-download"></i> Другие дополнения</a></span>
        <button type="submit" form="form-latest" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1>AutoSearch 2x 1.23</h1>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-latest" class="form-horizontal">

          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $text_settings; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $entry_code; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">

          <div class="form-group">
            <label class="col-sm-2 col-xs-4 control-label"><?php echo $entry_status; ?></label>
            <div class="col-sm-4 col-xs-2">
			<div class="toggleWrapper">
                <?php if ($autosearch_status) { ?>
				<input type="checkbox" id="input-status" name="autosearch_status" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-status" name="autosearch_status" value="1" />
                <?php } ?>
			<label class="toggle" for="input-status"><span class="toggle__handler"></span>
			</label>
			</div>
			</div>
		  </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-symbol"><?php echo $entry_symbol; ?></label>
            <div class="col-sm-4">
              <input type="text" name="autosearch_symbol" value="<?php echo (isset($autosearch_symbol) ? $autosearch_symbol: '3') ; ?>" id="input-symbol" class="form-control" />
            </div>
			<label class="col-sm-2 control-label" for="input-codepage"><?php echo $entry_codepage; ?></label>
			<div class="col-sm-4">
              <select name="autosearch_codepage" id="input-codepage" class="form-control">
                <?php if ($autosearch_codepage == 0) { ?>
                 <option value="0" selected="selected"><?php echo $text_code_variant1; ?></option>
                 <option value="1"><?php echo $text_code_variant2; ?></option>
				 <option value="2"><?php echo $text_code_variant3; ?></option>
                <?php } else if ($autosearch_codepage == 1) { ?>
                 <option value="0"><?php echo $text_code_variant1; ?></option>
                 <option value="1" selected="selected"><?php echo $text_code_variant2; ?></option>
				 <option value="2"><?php echo $text_code_variant3; ?></option>
                <?php } else if ($autosearch_codepage == 2) { ?>
                 <option value="0"><?php echo $text_code_variant1; ?></option>
                 <option value="1"><?php echo $text_code_variant2; ?></option>
				 <option value="2" selected="selected"><?php echo $text_code_variant3; ?></option>
				<?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-size"><?php echo $entry_size; ?></label>
            <div class="col-sm-4"><div class="input-group"><span class="input-group-addon">px</span>
              <input type="text" name="autosearch_size" value="<?php echo (isset($autosearch_size) ? $autosearch_size: '250') ; ?>" id="input-size" class="form-control" />
            </div></div>
          </div>

          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-product" data-toggle="tab"><?php echo $text_products; ?></a></li>
            <li><a href="#tab-category" data-toggle="tab"><?php echo $text_categories; ?></a></li>
			<li><a href="#tab-brand" data-toggle="tab"><?php echo $text_brands; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-product">

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-4">
              <input type="text" name="autosearch_limit" value="<?php echo (isset($autosearch_limit) ? $autosearch_limit: '5') ; ?>" id="input-limit" class="form-control" />
            </div>
          </div>

          <fieldset>
          <legend><?php echo $text_search; ?></legend>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_model; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_model) { ?>
				<input type="checkbox" id="input-model" name="autosearch_model" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-model" name="autosearch_model" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-model"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_tag; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_tag) { ?>
				<input type="checkbox" id="input-tag" name="autosearch_tag" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-tag" name="autosearch_tag" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-tag"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">		
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_sku; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_sku) { ?>
				<input type="checkbox" id="input-sku" name="autosearch_sku" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-sku" name="autosearch_sku" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-sku"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_upc; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_upc) { ?>
				<input type="checkbox" id="input-upc" name="autosearch_upc" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-upc" name="autosearch_upc" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-upc"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">		
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_ean; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_ean) { ?>
				<input type="checkbox" id="input-ean" name="autosearch_ean" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-ean" name="autosearch_ean" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-ean"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_jan; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_jan) { ?>
				<input type="checkbox" id="input-jan" name="autosearch_jan" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-jan" name="autosearch_jan" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-jan"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_isbn; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_isbn) { ?>
				<input type="checkbox" id="input-isbn" name="autosearch_isbn" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-isbn" name="autosearch_isbn" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-isbn"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_mpn; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_mpn) { ?>
				<input type="checkbox" id="input-mpn" name="autosearch_mpn" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-mpn" name="autosearch_mpn" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-mpn"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_location; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_location) { ?>
				<input type="checkbox" id="input-location" name="autosearch_location" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-location" name="autosearch_location" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-location"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_attr; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_attr) { ?>
				<input type="checkbox" id="input-attr" name="autosearch_attr" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-attr" name="autosearch_attr" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-attr"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

          </fieldset>

          <fieldset>
          <legend><?php echo $text_show; ?></legend>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_show; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_show) { ?>
				<input type="checkbox" id="input-show" name="autosearch_show" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-show" name="autosearch_show" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-show"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 control-label" for="input-asr_image"><?php echo $entry_asr_image; ?></label>
            <div class="col-sm-8"><div class="input-group"><span class="input-group-addon">px</span>
              <input type="text" name="autosearch_asr_image" value="<?php echo (isset($autosearch_asr_image) ? $autosearch_asr_image: '45') ; ?>" id="input-asr_image" class="form-control" />
            </div></div>
		</div>
		</div>
</div>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_show_model; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_show_model) { ?>
				<input type="checkbox" id="input-show_model" name="autosearch_show_model" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-show_model" name="autosearch_show_model" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-show_model"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_show_quantity; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_show_quantity) { ?>
				<input type="checkbox" id="input-show_quantity" name="autosearch_show_quantity" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-show_quantity" name="autosearch_show_quantity" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-show_quantity"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_show_price; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_show_price) { ?>
				<input type="checkbox" id="input-show_price" name="autosearch_show_price" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-show_price" name="autosearch_show_price" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-show_price"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_viewall; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_viewall) { ?>
				<input type="checkbox" id="input-viewall" name="autosearch_viewall" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-viewall" name="autosearch_viewall" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-viewall"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

          <div class="form-group">
			<label class="col-sm-2 control-label" for="input-field"><?php echo $entry_field; ?></label>
			<div class="col-sm-4">
              <select name="autosearch_field" id="input-field" class="form-control">
                  <?php foreach ($fields as $field) { ?>
                  <?php if ($field == $autosearch_field) { ?>
                  <option value="<?php echo $field; ?>" selected="selected"><?php echo $field; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $field; ?>"><?php echo $field; ?></option>
                  <?php } ?>
                  <?php } ?>
              </select>
            </div>

			<label class="col-sm-2 control-label" for="input-sort"><?php echo $entry_sort; ?></label>
			<div class="col-sm-4">
              <select name="autosearch_sort" id="input-sort" class="form-control">
                <?php if ($autosearch_sort) { ?>
                <option value="1" selected="selected"><?php echo $text_sort_name; ?></option>
                <option value="0"><?php echo $text_sort_date; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_sort_name; ?></option>
                <option value="0" selected="selected"><?php echo $text_sort_date; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_proname; ?></label>
            <div class="col-sm-4">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="autosearch_proname[title<?php echo $language['language_id']; ?>]" value="<?php echo isset($autosearch_proname['title'.$language['language_id']]) ? $autosearch_proname['title'.$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_proname; ?>" class="form-control" />
              </div>
              <?php } ?>
			</div>

			<label class="col-sm-2 control-label"><?php echo $entry_vallname; ?></label>
            <div class="col-sm-4">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="autosearch_vallname[title<?php echo $language['language_id']; ?>]" value="<?php echo isset($autosearch_vallname['title'.$language['language_id']]) ? $autosearch_vallname['title'.$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_vallname; ?>" class="form-control" />
              </div>
              <?php } ?>
			</div>
		  </div>
          </fieldset>

  			</div>
            <div class="tab-pane" id="tab-category">

<div class="form-group addpad">		
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_cat; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_cat) { ?>
				<input type="checkbox" id="input-cat" name="autosearch_cat" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-cat" name="autosearch_cat" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-cat"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 control-label" for="input-catlimit"><?php echo $entry_catlimit; ?></label>
            <div class="col-sm-8">
              <input type="text" name="autosearch_catlimit" value="<?php echo (isset($autosearch_catlimit) ? $autosearch_catlimit: '5') ; ?>" id="input-catlimit" class="form-control" />
            </div>
		</div>
		</div>
</div>

          <div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_catname; ?></label>
            <div class="col-sm-4">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="autosearch_catname[title<?php echo $language['language_id']; ?>]" value="<?php echo isset($autosearch_catname['title'.$language['language_id']]) ? $autosearch_catname['title'.$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_catname; ?>" class="form-control" />
              </div>
              <?php } ?>
			</div>
		  </div>

  			</div>
            <div class="tab-pane" id="tab-brand">

<div class="form-group addpad">		
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_man; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($autosearch_man) { ?>
				<input type="checkbox" id="input-man" name="autosearch_man" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-man" name="autosearch_man" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-man"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 control-label" for="input-manlimit"><?php echo $entry_manlimit; ?></label>
            <div class="col-sm-8">
              <input type="text" name="autosearch_manlimit" value="<?php echo (isset($autosearch_manlimit) ? $autosearch_manlimit: '5') ; ?>" id="input-manlimit" class="form-control" />
            </div>
		</div>
		</div>
</div>

          <div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_manname; ?></label>
            <div class="col-sm-4">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="autosearch_manname[title<?php echo $language['language_id']; ?>]" value="<?php echo isset($autosearch_manname['title'.$language['language_id']]) ? $autosearch_manname['title'.$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_manname; ?>" class="form-control" />
              </div>
              <?php } ?>
			</div>
		  </div>

			</div>
			</div>

			</div>

            <div class="tab-pane" id="tab-data">
          <div class="form-group">
			<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_code; ?></label>
			<div class="col-sm-10">
				<input type="text" name="autosearch_code" value="<?php echo $autosearch_code; ?>" placeholder="<?php echo $entry_code; ?>" id="input-code" class="form-control" />
            </div>
          </div>
          <div class="form-group">
			<label class="col-sm-12" ><?php echo $text_server; ?> <?php echo $server." - ".$is; ?></label>
			<label class="col-sm-12" ><?php echo $text_host; ?> <?php echo $host." - ".$ih; ?></label>
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