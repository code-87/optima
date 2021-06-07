<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"> <!-- div id="content" -->
  <div class="page-header"><!-- div class="page-header" -->
    <div class="container-fluid">
      <div class="pull-right">
	  
        <a href="javascript: $('#stay_field').attr('value', '0'); $('#form').submit();" 
		data-toggle="tooltip" 
		title="<?php echo $button_save_and_go; ?>" 
		class="btn btn-primary"><i class="fa fa-save"></i></a>
		
        <a href="javascript: set_tab(); $('#stay_field').attr('value', '1'); $('#form').submit();" 
		data-toggle="tooltip"  
		title="<?php echo $button_save_and_stay; ?>" 
		class="btn btn-primary"><i class="fa fa-pencil"></i></a>
		
        <a href="<?php echo $cancel; ?>" 
		data-toggle="tooltip" 
		title="<?php echo $button_cancel; ?>" 
		class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
		 
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div><!-- div class="page-header" -->

	  <style>
	  .clist 
	  {
		border-top:  1px #ccc solid;
		border-left:  1px #ccc solid;
	  }
	  
	  .clist td
	  {
		padding: 5px;
		border-right: 1px #ccc solid;
		border-bottom: 1px #ccc solid;
	  }
	  
	  .plus
	  {
		background: green;
		text-align: center;
	  }
	  
	  .minus
	  {
		background: #F58C6C;
		text-align: center;
	  }
	  
	  .vopros
	  {
		text-align: center;
	  }
	  </style>
  <div class="container-fluid"><!-- div class="container-fluid" -->
  
    <?php if ( !empty($error_warning) ) { ?>
	
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	
    <?php } ?>
	
	<?php if( !empty($success) ) { ?>	
    <div class="alert alert-success"><i class="fa fa-info-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<?php }  ?>

	
    <div class="panel panel-default"> <!--  class="panel panel-default" -->
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body"> <!--  class="panel-body" -->
	  
	<ul class="nav nav-tabs">
	
            <li class="active" style="cursor: pointer;" 
			><a href="#tab-general" data-toggle="tab" id="link-tab-general" ><?php echo $tab_general; ?></a></li>
            <li style="cursor: pointer;" 
			><a href="#tab-design" data-toggle="tab" id="link-tab-design" ><?php echo $tab_design; ?></a></li>
           <li style="cursor: pointer;" 
			><a href="#tab-vkontakte" data-toggle="tab" id="link-tab-vkontakte" ><?php echo $tab_vkontakte; ?></a></li>
            <li style="cursor: pointer;" 
			><a href="#tab-facebook" data-toggle="tab" id="link-tab-facebook" ><?php echo $tab_facebook; ?></a></li>
            <li style="cursor: pointer;" 
			><a href="#tab-twitter" data-toggle="tab" id="link-tab-twitter" ><?php echo $tab_twitter; ?></a></li>
            <li style="cursor: pointer;" 
			><a href="#tab-odnoklassniki" data-toggle="tab" id="link-tab-odnoklassniki" ><?php echo $tab_odnoklassniki; ?></a></li>
			
			<?php /* start metka: a1 */ ?>
            <li style="cursor: pointer;" 
			><a href="#tab-gmail" data-toggle="tab" id="link-tab-gmail" ><?php echo $tab_gmail; ?></a></li>
            <li style="cursor: pointer;" 
			><a href="#tab-mailru" data-toggle="tab" id="link-tab-mailru" ><?php echo $tab_mailru; ?></a></li>
			<?php /* end metka: a1 */ ?>
			
			<?php /* start 1811 */ ?>
			 <li style="cursor: pointer;" 
			><a href="#tab-yandex" data-toggle="tab" id="link-tab-yandex" ><?php echo $tab_yandex; ?></a></li>
             <li style="cursor: pointer;" 
			><a href="#tab-steam" data-toggle="tab" id="link-tab-steam" ><?php echo $tab_steam; ?></a></li>
            <?php /* end 1811 */ ?>
			
			<?php /* start 0207 */ ?>
			  <li style="cursor: pointer;" 
			><a href="#tab-instagram" data-toggle="tab" id="link-tab-instagram" ><?php echo $tab_instagram; ?></a></li>
			<?php /* end 0207 */ ?>
           
            <li style="cursor: pointer;" 
			><a href="#tab-dobor" data-toggle="tab" id="link-tab-dobor" ><?php echo $tab_dobor; ?></a></li>
			
            <li id="link-tab-widget" 
			><a href="#tab-widget" data-toggle="tab"><?php echo $tab_widget; ?></a></li>
            <!--<li id="link-tab-popup" 
			><a href="#tab-popup" data-toggle="tab"><?php echo $tab_popup; ?></a></li>
			-->
             <li style="cursor: pointer;" 
			><a href="#tab-support" data-toggle="tab" id="link-tab-support" ><?php echo $tab_support; ?></a></li>
			
      </ul>

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"
	 class="form-horizontal"
	>
	<input type="hidden" name="stay" id="stay_field" value="1">
		<input type="hidden" id="hiddentab" name="tab" value="<?php echo $tab; ?>">
	  
		<?php /* start 1505 */ ?>
		<input type="hidden" id="hiddentab2" name="tab2" value="<?php echo $tab2; ?>">
		<?php /* end 1505 */ ?>
	  
<div class="tab-content"><!--  class="tab-content" -->
	  
		
      
	  
	  <div id="tab-general" class="tab-pane active">
	  
	  
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_version; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 9px;">
				3.14
			</div>
			
        </div>
	  
	  
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_status; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_status" class="form-control" >
                  <?php if ( $socnetauth2_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
			
        </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_protokol; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_protokol" class="form-control">
					<option value="http"
					<?php if( $socnetauth2_protokol=='http' ) { ?> selected <?php } ?>
					>http://</option>
					<option value="https"
					<?php if( $socnetauth2_protokol=='https' ) { ?> selected <?php } ?>
					>https://</option>
					<option value="detect"
					<?php if( $socnetauth2_protokol=='detect' ) { ?> selected <?php } ?>
					><?php echo $entry_protokol_detect; ?></option>
				</select>
			</div>
        </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_save_to_addr; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_save_to_addr" class="form-control">
					<option value="customer_only"
					<?php if( $socnetauth2_save_to_addr=='customer_only' ) { ?> selected <?php } ?>
					><?php echo $text_customer_only; ?></option>
					<option value="customer_addr"
					<?php if( $socnetauth2_save_to_addr=='customer_addr' ) { ?> selected <?php } ?>
					><?php echo $text_customer_addr; ?></option>
				</select>
			</div>
        </div>
		
		<?php /* start 2505 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_default_country; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_default_country" class="form-control">
					<option value="0"><?php echo $text_no_country; ?></option>
					<?php foreach ($countries as $country) { ?>
					<?php if ($country['country_id'] == $socnetauth2_default_country) { ?>
					<option value="<?php echo $country['country_id']; ?>" selected="selected"
						><?php echo $country['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
				<?php echo $entry_default_country_notice; ?>
				
			</div>
        </div>
		<?php /* end 2505 */ ?>
		
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_shop_folder; ?>
			</label>
            <div class="col-sm-10">
				<?php if( !$stores ) { ?>
					<input type="text" name="socnetauth2_shop_folder" class="form-control"  
							value="<?php echo $socnetauth2_shop_folder; ?>" />
				<?php } else { ?>
				<style>
				.text-left { padding: 5px; }
				</style>
				<table>
				<tr>
					<td class="text-left"><b><?php echo $entry_shop_folders_col_storename; ?></b></td>
					<td class="text-left"><b><?php echo $entry_shop_folders_col_storefolder; ?></b></td>
				</tr>
				<tr>
					<td class="text-left"><?php echo $config_name; ?></td>
					<td class="text-left"><input type="text" name="socnetauth2_shop_folder" class="form-control"  
							value="<?php echo $socnetauth2_shop_folder; ?>" /></td>
				</tr>
					<?php foreach( $stores as $store ) { ?> 
					<tr>
						<td class="text-left"><?php echo $store['name']; ?></td>
						<td class="text-left"><input type="text" 
						name="socnetauth2_shop_folders[<?php echo $store['store_id']; ?>]" class="form-control"  
							value="<?php echo $store['folder']; ?>" /></td>
					</tr>
					<?php } ?>
				</table>
				<?php } ?>
				
				<input type="checkbox" name="socnetauth2_shop_folder_in_img" value="1"
				id="socnetauth2_shop_folder_in_img" 
				<?php if($socnetauth2_shop_folder_in_img) { ?> checked <?php } ?>
				><label for="socnetauth2_shop_folder_in_img"
				><?php echo $entry_shop_folder_in_img; ?></label>
				<br>
				<input type="checkbox" name="socnetauth2_shop_folder_in_redirect" value="1"
				id="socnetauth2_shop_folder_in_redirect" 
				<?php if($socnetauth2_shop_folder_in_redirect) { ?> checked <?php } ?>
				><label for="socnetauth2_shop_folder_in_redirect"
				><?php echo $entry_shop_folder_in_redirect; ?></label>
				<br>
				
				<input type="checkbox" name="socnetauth2_shop_folder_in_url" value="1"
				id="socnetauth2_shop_folder_in_url" 
				<?php if($socnetauth2_shop_folder_in_url) { ?> checked <?php } ?>
				><label for="socnetauth2_shop_folder_in_url"
				><?php echo $entry_shop_folder_in_url; ?></label>
			</div>
        </div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_add_param; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_add_param" class="form-control" >
                  <?php if ( $socnetauth2_add_param ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $entry_add_param_notice; ?></div>
			</div> 
        </div>
		
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_email_auth; ?>
			</label>
            <div class="col-sm-10">
				<table width=100%>
				<tr>
					<td style="padding-right: 10px;">
						<input type="radio" name="socnetauth2_email_auth" value="none" 
					   id="socnetauth2_email_auth_none"
					   <?php if( $socnetauth2_email_auth == 'none' ) { ?> checked <?php } ?>
					   >
					 </td>
					 <td>
						<label for="socnetauth2_email_auth_none">
							<?php echo $entry_email_auth_none; ?>
					   </label>
					 </td>
				</tr>
				<tr>
					<td style="padding-right: 10px;">
						<input type="radio" name="socnetauth2_email_auth" value="confirm" 
					   id="socnetauth2_email_auth_confirm"
					   <?php if( $socnetauth2_email_auth == 'confirm' ) { ?> checked <?php } ?>
					   >
					 </td>
					 <td>
					   <label for="socnetauth2_email_auth_confirm">
						<?php echo $entry_email_auth_confirm; ?>
					   </label>
					 </td>
				</tr>
				<tr>
					<td style="padding-right: 10px;">
						<input type="radio" name="socnetauth2_email_auth" value="noconfirm" 
					   id="socnetauth2_email_auth_noconfirm"
					   <?php if( $socnetauth2_email_auth == 'noconfirm' ) { ?> checked <?php } ?>
					   >
					</td>
					<td>
					   <label for="socnetauth2_email_auth_noconfirm">
						<?php echo $entry_email_auth_noconfirm; ?>
					   </label>
					</td>
				 </tr>
				 </table>
			</div>
        </div>
		
		<?php /* start 0503 */ ?>
		
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_show_source_in_order; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_show_source_in_order" class="form-control" >
                  <?php if ( $socnetauth2_show_source_in_order ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_show_source_in_customer; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_show_source_in_customer" class="form-control" >
                  <?php if ( $socnetauth2_show_source_in_customer ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* end 0503 */ ?>
		
		<?php /* start 0902 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_addpass; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_addpass" class="form-control" >
                  <?php if ( $socnetauth2_addpass ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<p><?php echo $entry_addpass_notice; ?></p>
			</div>
        </div>
		<?php /* end 0902 */ ?>
			
			
			
			<?php /* start kin update: r1 */ ?>
			
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_vkontakte_retargeting; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 9px;">
				<a href="<?php echo $vkontakte_retargeting; ?>"><?php echo $text_download_link; ?></a>
			</div>
        </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_facebook_retargeting; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 9px;">
				<a href="<?php echo $facebook_retargeting; ?>"><?php echo $text_download_link; ?></a>
			</div>
        </div>
		
			<?php /* end kin update: r1 */ ?>
		
	<!--
		<p>
		<b><?php echo $entry_admin_header; ?></b>
		</p>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_admin_customer; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 20px;">
				<input type="checkbox" name="socnetauth2_admin_customer" value="1"
				<?php if($socnetauth2_admin_customer) { ?> checked <?php } ?>
			>
			</div>
        </div>
			
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_admin_customer_list; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 20px;">
				<input type="checkbox" name="socnetauth2_admin_customer_list" value="1"
				<?php if($socnetauth2_admin_customer_list) { ?> checked <?php } ?>
			>
			</div>
        </div>
		
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_admin_order; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 20px;">
				<input type="checkbox" name="socnetauth2_admin_order" value="1"
				<?php if($socnetauth2_admin_order) { ?> checked <?php } ?>
			>
			</div>
        </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_admin_order_list; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 20px;">
				<input type="checkbox" name="socnetauth2_admin_order_list" value="1"
				<?php if($socnetauth2_admin_order_list) { ?> checked <?php } ?>
			>
			</div>
        </div>
	-->
			
	  </div>
	  
	  
	  
	  <div id="tab-vkontakte" class="tab-pane">
	  
	  <p>Инструкция по интергации с ВКонтакте по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-vkontakte" target=_blank
		>https://softpodkluch.ru/socnetauth2-vkontakte</a>
		</p>
	  
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_vkontakte_status; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_vkontakte_status" class="form-control">
                  <?php if ( $socnetauth2_vkontakte_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_vkontakte_debug" class="form-control">
                  <?php if ( $socnetauth2_vkontakte_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		<?php /* end r3 */ ?>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_vkontakte_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_vkontakte_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_vkontakte_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_vkontakte_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_vkontakte_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_vkontakte_agent_extension').show(); } else { $('#block_vkontakte_agent_extension').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_vkontakte_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_vkontakte_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_vkontakte_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_vkontakte_agent_loginza; ?></option>
                </select>
				<div><?php echo $entry_vkontakte_agent_notice; ?></div>
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_vkontakte_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_vkontakte_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_vkontakte_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		<?php /* start 0207 */ ?>
		<div id="block_vkontakte_agent_extension"
		<?php if ( $socnetauth2_vkontakte_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="vkontakte_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_vkontakte_appid; ?></td>
              <td class="left"><?php echo $entry_vkontakte_appsecret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="vkontakte_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_vkontakte_appid"  
				value="<?php echo $socnetauth2_vkontakte_appid; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_vkontakte_appsecret"  
				value="<?php echo $socnetauth2_vkontakte_appsecret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $vkontakte_req_row = 0; ?>
          <?php foreach ($socnetauth2_vkontakte_req as $req) { ?>
          <tbody id="vkontakte_req-row<?php echo $vkontakte_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_vkontakte_req[<?php echo $vkontakte_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_vkontakte_req[<?php echo $vkontakte_req_row; 
				 ?>][appid]"  
				value="<?php echo $req['appid']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_vkontakte_req[<?php echo $vkontakte_req_row; 
				 ?>][appsecret]"  
				value="<?php echo $req['appsecret']; ?>" />
			  </td>
			  <td><a onclick="$('#vkontakte_req-row<?php echo $vkontakte_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $vkontakte_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addVkontakteReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var vkontakte_req_row = <?php echo $vkontakte_req_row; ?>;
		
		function addVkontakteReq()
		{
			html = '';
			
			html += '<tbody id="vkontakte_req-row'+vkontakte_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_vkontakte_req['+vkontakte_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_vkontakte_req['+vkontakte_req_row+'][appid]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_vkontakte_req['+vkontakte_req_row+'][appsecret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#vkontakte_req-row'+vkontakte_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#vkontakte_req tfoot').before(html);
			
			vkontakte_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
		
		
	  </div>
	  <div id="tab-facebook" class="tab-pane">
	  <p>Инструкция по интергации с Facebook по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-facebook" target=_blank
		>https://softpodkluch.ru/socnetauth2-facebook</a>
		</p>
	  
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_facebook_status; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_facebook_status" class="form-control">
                  <?php if ( $socnetauth2_facebook_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_facebook_debug" class="form-control">
                  <?php if ( $socnetauth2_facebook_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_facebook_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_facebook_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_facebook_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_facebook_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_facebook_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_facebook_agent_extension').show(); $('#block_facebook_agent_notice').show(); } else { $('#block_facebook_agent_extension').hide(); $('#block_facebook_agent_notice').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_facebook_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_facebook_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_facebook_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_facebook_agent_loginza; ?></option>
                </select>
				<div
				id="block_facebook_agent_notice"
		<?php if ( $socnetauth2_facebook_agent == 'loginza' ) { ?> 
		style="display: none;" <?php } ?>
				><?php echo $entry_facebook_agent_notice; ?></div>
			</div>
        </div>
		 
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_facebook_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_facebook_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_facebook_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
			
		<?php /* start 0207 */ ?>
		<div id="block_facebook_agent_extension"
		<?php if ( $socnetauth2_facebook_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="facebook_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_facebook_appid; ?></td>
              <td class="left"><?php echo $entry_facebook_appsecret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="facebook_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_facebook_appid"  
				value="<?php echo $socnetauth2_facebook_appid; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_facebook_appsecret"  
				value="<?php echo $socnetauth2_facebook_appsecret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $facebook_req_row = 0; ?>
          <?php foreach ($socnetauth2_facebook_req as $req) { ?>
          <tbody id="facebook_req-row<?php echo $facebook_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_facebook_req[<?php echo $facebook_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_facebook_req[<?php echo $facebook_req_row; 
				 ?>][appid]"  
				value="<?php echo $req['appid']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_facebook_req[<?php echo $facebook_req_row; 
				 ?>][appsecret]"  
				value="<?php echo $req['appsecret']; ?>" />
			  </td>
			  <td><a onclick="$('#facebook_req-row<?php echo $facebook_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $facebook_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addfacebookReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var facebook_req_row = <?php echo $facebook_req_row; ?>;
		
		function addfacebookReq()
		{
			html = '';
			
			html += '<tbody id="facebook_req-row'+facebook_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_facebook_req['+facebook_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_facebook_req['+facebook_req_row+'][appid]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_facebook_req['+facebook_req_row+'][appsecret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#facebook_req-row'+facebook_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#facebook_req tfoot').before(html);
			
			facebook_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
	  </div>
	  <div id="tab-twitter" class="tab-pane">
	  <p>Инструкция по интергации с Twitter по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-twitter" target=_blank
		>https://softpodkluch.ru/socnetauth2-twitter</a>
		</p>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_twitter_status; ?>
			</label>
            <div class="col-sm-10">
				
				<select name="socnetauth2_twitter_status" class="form-control">
                  <?php if ( $socnetauth2_twitter_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_twitter_debug" class="form-control">
                  <?php if ( $socnetauth2_twitter_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_twitter_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_twitter_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_twitter_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_twitter_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_twitter_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_twitter_agent_extension').show(); $('#block_twitter_agent_notice').show(); } else { $('#block_twitter_agent_extension').hide(); $('#block_twitter_agent_notice').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_twitter_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_twitter_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_twitter_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_twitter_agent_loginza; ?></option>
                </select>
				<div
				id="block_twitter_agent_notice"
		<?php if ( $socnetauth2_twitter_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
				><?php echo $entry_twitter_agent_notice; ?></div>
			</div>
        </div>
		 
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_twitter_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_twitter_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_twitter_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		
		<?php /* start 0207 */ ?>
		<div id="block_twitter_agent_extension"
		<?php if ( $socnetauth2_twitter_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="twitter_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_twitter_consumer_key; ?></td>
              <td class="left"><?php echo $entry_twitter_consumer_secret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="twitter_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_twitter_consumer_key"  
				value="<?php echo $socnetauth2_twitter_consumer_key; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_twitter_consumer_secret"  
				value="<?php echo $socnetauth2_twitter_consumer_secret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $twitter_req_row = 0; ?>
          <?php foreach ($socnetauth2_twitter_req as $req) { ?>
          <tbody id="twitter_req-row<?php echo $twitter_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_twitter_req[<?php echo $twitter_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_twitter_req[<?php echo $twitter_req_row; 
				 ?>][consumer_key]"  
				value="<?php echo $req['consumer_key']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_twitter_req[<?php echo $twitter_req_row; 
				 ?>][consumer_secret]"  
				value="<?php echo $req['consumer_secret']; ?>" />
			  </td>
			  <td><a onclick="$('#twitter_req-row<?php echo $twitter_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $twitter_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addtwitterReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var twitter_req_row = <?php echo $twitter_req_row; ?>;
		
		function addtwitterReq()
		{
			html = '';
			
			html += '<tbody id="twitter_req-row'+twitter_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_twitter_req['+twitter_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_twitter_req['+twitter_req_row+'][consumer_key]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_twitter_req['+twitter_req_row+'][consumer_secret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#twitter_req-row'+twitter_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#twitter_req tfoot').before(html);
			
			twitter_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
		
		
	  </div>
	  <div id="tab-odnoklassniki" class="tab-pane">
	  <p>Инструкция по интергации с Одноклассники по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-odnoklassniki" target=_blank
		>https://softpodkluch.ru/socnetauth2-odnoklassniki</a>
		</p>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_odnoklassniki_status; ?>
			</label>
            <div class="col-sm-10">
			
				<select name="socnetauth2_odnoklassniki_status" class="form-control">
                  <?php if ( $socnetauth2_odnoklassniki_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_odnoklassniki_debug" class="form-control">
                  <?php if ( $socnetauth2_odnoklassniki_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_odnoklassniki_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_odnoklassniki_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_odnoklassniki_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_odnoklassniki_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_odnoklassniki_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_odnoklassniki_agent_extension').show(); $('#block_odnoklassniki_agent_notice').show(); } else { $('#block_odnoklassniki_agent_extension').hide(); $('#block_odnoklassniki_agent_notice').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_odnoklassniki_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_odnoklassniki_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_odnoklassniki_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_odnoklassniki_agent_loginza; ?></option>
                </select>
				<div
				id="block_odnoklassniki_agent_notice"
		<?php if ( $socnetauth2_odnoklassniki_agent == 'loginza' ) { ?> 
		style="display: none;" <?php } ?>
				><?php echo $entry_odnoklassniki_agent_notice; ?></div>
			</div>
        </div>
		 
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_odnoklassniki_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_odnoklassniki_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_odnoklassniki_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		<?php /* start 0207 */ ?>
		<div id="block_odnoklassniki_agent_extension"
		<?php if ( $socnetauth2_odnoklassniki_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="odnoklassniki_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_odnoklassniki_application_id; ?></td>
              <td class="left"><?php echo $entry_odnoklassniki_public_key; ?></td>
              <td class="left"><?php echo $entry_odnoklassniki_secret_key; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="odnoklassniki_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_odnoklassniki_application_id"  
				value="<?php echo $socnetauth2_odnoklassniki_application_id; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_odnoklassniki_public_key"  
				value="<?php echo $socnetauth2_odnoklassniki_public_key; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_odnoklassniki_secret_key"  
				value="<?php echo $socnetauth2_odnoklassniki_secret_key; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $odnoklassniki_req_row = 0; ?>
          <?php foreach ($socnetauth2_odnoklassniki_req as $req) { ?>
          <tbody id="odnoklassniki_req-row<?php echo $odnoklassniki_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_odnoklassniki_req[<?php echo $odnoklassniki_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_odnoklassniki_req[<?php echo $odnoklassniki_req_row; 
				 ?>][application_id]"  
				value="<?php echo $req['application_id']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_odnoklassniki_req[<?php echo $odnoklassniki_req_row; 
				 ?>][public_key]"  
				value="<?php echo $req['public_key']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_odnoklassniki_req[<?php echo $odnoklassniki_req_row; 
				 ?>][secret_key]"  
				value="<?php echo $req['secret_key']; ?>" />
			  </td>
			  <td><a onclick="$('#odnoklassniki_req-row<?php echo $odnoklassniki_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $odnoklassniki_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addodnoklassnikiReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var odnoklassniki_req_row = <?php echo $odnoklassniki_req_row; ?>;
		
		function addodnoklassnikiReq()
		{
			html = '';
			
			html += '<tbody id="odnoklassniki_req-row'+odnoklassniki_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_odnoklassniki_req['+odnoklassniki_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_odnoklassniki_req['+odnoklassniki_req_row+'][application_id]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_odnoklassniki_req['+odnoklassniki_req_row+'][public_key]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_odnoklassniki_req['+odnoklassniki_req_row+'][secret_key]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#odnoklassniki_req-row'+odnoklassniki_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#odnoklassniki_req tfoot').before(html);
			
			odnoklassniki_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
	  </div>
	  
	  
	  
	  <?php /* start metka: a1 */ ?>
	  <div id="tab-gmail" class="tab-pane">
	  <p>Инструкция по интергации с Gmail.com по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-gmail" target=_blank
		>https://softpodkluch.ru/socnetauth2-gmail</a>
		</p>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_gmail_status; ?>
			</label>
            <div class="col-sm-10">
			  <select name="socnetauth2_gmail_status" class="form-control">
                  <?php if ( $socnetauth2_gmail_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_gmail_debug" class="form-control">
                  <?php if ( $socnetauth2_gmail_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		<?php /* end r3 */ ?>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_gmail_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_gmail_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_gmail_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_gmail_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_gmail_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_gmail_agent_extension').show(); } else { $('#block_gmail_agent_extension').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_gmail_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_gmail_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_gmail_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_gmail_agent_loginza; ?></option>
                </select>
				<div><?php echo $entry_gmail_agent_notice; ?></div>
			</div>
        </div> 
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_gmail_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_gmail_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_gmail_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		<?php /* start 0207 */ ?>
		<div id="block_gmail_agent_extension"
		<?php if ( $socnetauth2_gmail_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="gmail_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_gmail_client_id; ?></td>
              <td class="left"><?php echo $entry_gmail_client_secret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="gmail_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_gmail_client_id"  
				value="<?php echo $socnetauth2_gmail_client_id; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_gmail_client_secret"  
				value="<?php echo $socnetauth2_gmail_client_secret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $gmail_req_row = 0; ?>
          <?php foreach ($socnetauth2_gmail_req as $req) { ?>
          <tbody id="gmail_req-row<?php echo $gmail_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_gmail_req[<?php echo $gmail_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_gmail_req[<?php echo $gmail_req_row; 
				 ?>][client_id]"  
				value="<?php echo $req['client_id']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_gmail_req[<?php echo $gmail_req_row; 
				 ?>][client_secret]"  
				value="<?php echo $req['client_secret']; ?>" />
			  </td>
			  <td><a onclick="$('#gmail_req-row<?php echo $gmail_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $gmail_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addgmailReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var gmail_req_row = <?php echo $gmail_req_row; ?>;
		
		function addgmailReq()
		{
			html = '';
			
			html += '<tbody id="gmail_req-row'+gmail_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_gmail_req['+gmail_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_gmail_req['+gmail_req_row+'][client_id]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_gmail_req['+gmail_req_row+'][client_secret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#gmail_req-row'+gmail_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#gmail_req tfoot').before(html);
			
			gmail_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
	  </div>
	  
	  
	  <div id="tab-mailru" class="tab-pane">
	  <p>Инструкция по интергации с Mail.ru по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-mailru" target=_blank
		>https://softpodkluch.ru/socnetauth2-mailru</a>
		</p>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_mailru_status; ?>
			</label>
            <div class="col-sm-10">
			  <select name="socnetauth2_mailru_status" class="form-control">
                  <?php if ( $socnetauth2_mailru_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_mailru_debug" class="form-control">
                  <?php if ( $socnetauth2_mailru_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		<?php /* end r3 */ ?>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_mailru_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_mailru_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_mailru_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_mailru_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_mailru_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_mailru_agent_extension').show(); } else { $('#block_mailru_agent_extension').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_mailru_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_mailru_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_mailru_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_mailru_agent_loginza; ?></option>
                </select>
				<div><?php echo $entry_mailru_agent_notice; ?></div>
			</div>
        </div>
		 
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_mailru_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_mailru_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_mailru_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		<?php /* start 0207 */ ?>
		<div id="block_mailru_agent_extension"
		<?php if ( $socnetauth2_mailru_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="mailru_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_mailru_id; ?></td>
              <td class="left"><?php echo $entry_mailru_private; ?></td>
              <td class="left"><?php echo $entry_mailru_secret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="mailru_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_mailru_id"  
				value="<?php echo $socnetauth2_mailru_id; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_mailru_private"  
				value="<?php echo $socnetauth2_mailru_private; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_mailru_secret"  
				value="<?php echo $socnetauth2_mailru_secret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $mailru_req_row = 0; ?>
          <?php foreach ($socnetauth2_mailru_req as $req) { ?>
          <tbody id="mailru_req-row<?php echo $mailru_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_mailru_req[<?php echo $mailru_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_mailru_req[<?php echo $mailru_req_row; 
				 ?>][mailru_id]"  
				value="<?php echo $req['mailru_id']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_mailru_req[<?php echo $mailru_req_row; 
				 ?>][mailru_private]"  
				value="<?php echo $req['mailru_private']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_mailru_req[<?php echo $mailru_req_row; 
				 ?>][mailru_secret]"  
				value="<?php echo $req['mailru_secret']; ?>" />
			  </td>
			  <td><a onclick="$('#mailru_req-row<?php echo $mailru_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $mailru_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addmailruReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var mailru_req_row = <?php echo $mailru_req_row; ?>;
		
		function addmailruReq()
		{
			html = '';
			
			html += '<tbody id="mailru_req-row'+mailru_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_mailru_req['+mailru_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_mailru_req['+mailru_req_row+'][mailru_id]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_mailru_req['+mailru_req_row+'][mailru_private]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_mailru_req['+mailru_req_row+'][mailru_secret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#mailru_req-row'+mailru_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#mailru_req tfoot').before(html);
			
			mailru_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
		
		
	  </div>
	  <?php /* end metka: a1 */ ?>
	  
	<?php /* start 1811 */ ?>
	  <div id="tab-yandex" class="tab-pane">
	  <p>Инструкция по интергации с Яндексом по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-yandex" target=_blank
		>https://softpodkluch.ru/socnetauth2-yandex</a>
		</p>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_yandex_status; ?>
			</label>
            <div class="col-sm-10">
			  <select name="socnetauth2_yandex_status" class="form-control">
                  <?php if ( $socnetauth2_yandex_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_yandex_debug" class="form-control">
                  <?php if ( $socnetauth2_yandex_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_yandex_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_yandex_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_yandex_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_yandex_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_yandex_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('.block_yandex_agent_extension').show(); } else { $('.block_yandex_agent_extension').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_yandex_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_yandex_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_yandex_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_yandex_agent_loginza; ?></option>
                </select>
				<div><?php echo $entry_yandex_agent_notice; ?></div>
			</div>
        </div>
		
		<div class="block_yandex_agent_extension"
		<?php if ( $socnetauth2_yandex_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		>
		<?php /* end 1405 */ ?> 
	    <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_yandex_rights; ?>
			</label>
            <div class="col-sm-10">
			   <div><input type="checkbox" name="socnetauth2_yandex_rights_email"
			   value="1" <?php if( $socnetauth2_yandex_rights_email ) { ?> checked <?php } ?> 
			   id="socnetauth2_yandex_rights_email"
			   ><label for="socnetauth2_yandex_rights_email"
			   ><?php echo $entry_yandex_rights_email; ?></label></div>
			   
			   <div><input type="checkbox" name="socnetauth2_yandex_rights_info"
			   value="1" <?php if( $socnetauth2_yandex_rights_info ) { ?> checked <?php } ?> 
			   id="socnetauth2_yandex_rights_info"
			   ><label for="socnetauth2_yandex_rights_info"
			   ><?php echo $entry_yandex_rights_info; ?></label></div>
			</div>
        </div>
		
		<?php /* start 1405 */ ?>
		</div>
		<?php /* end 1405 */ ?>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_yandex_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_yandex_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_yandex_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		
		<?php /* start 0207 */ ?>
		<div class="block_yandex_agent_extension"
		<?php if ( $socnetauth2_yandex_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="yandex_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_yandex_client_id; ?></td>
              <td class="left"><?php echo $entry_yandex_client_secret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="yandex_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_yandex_client_id"  
				value="<?php echo $socnetauth2_yandex_client_id; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_yandex_client_secret"  
				value="<?php echo $socnetauth2_yandex_client_secret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $yandex_req_row = 0; ?>
          <?php foreach ($socnetauth2_yandex_req as $req) { ?>
          <tbody id="yandex_req-row<?php echo $yandex_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_yandex_req[<?php echo $yandex_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_yandex_req[<?php echo $yandex_req_row; 
				 ?>][client_id]"  
				value="<?php echo $req['client_id']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_yandex_req[<?php echo $yandex_req_row; 
				 ?>][client_secret]"  
				value="<?php echo $req['client_secret']; ?>" />
			  </td>
			  <td><a onclick="$('#yandex_req-row<?php echo $yandex_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $yandex_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addyandexReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var yandex_req_row = <?php echo $yandex_req_row; ?>;
		
		function addyandexReq()
		{
			html = '';
			
			html += '<tbody id="yandex_req-row'+yandex_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_yandex_req['+yandex_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_yandex_req['+yandex_req_row+'][client_id]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_yandex_req['+yandex_req_row+'][client_secret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#yandex_req-row'+yandex_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#yandex_req tfoot').before(html);
			
			yandex_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
		
	  </div>
	

	  <div id="tab-steam" class="tab-pane">
	  <p>Инструкция по интергации со Steam по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-steam" target=_blank
		>https://softpodkluch.ru/socnetauth2-steam</a>
		</p>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_steam_status; ?>
			</label>
            <div class="col-sm-10">
			  <select name="socnetauth2_steam_status" class="form-control">
                  <?php if ( $socnetauth2_steam_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_steam_debug" class="form-control">
                  <?php if ( $socnetauth2_steam_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_steam_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_steam_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_steam_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
		<?php /* start 1405 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_steam_agent; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_steam_agent" class="form-control"
				onchange="if( this.value == 'extension' ) { $('#block_steam_agent_extension').show(); } else { $('#block_steam_agent_extension').hide(); }"
				>
					<option value="extension" 
					  <?php if ( $socnetauth2_steam_agent == 'extension' ) { ?>
						selected="extension"
					  <?php } ?>
					><?php echo $entry_steam_agent_extension; ?></option>
					<option value="loginza" 
					  <?php if ( $socnetauth2_steam_agent == 'loginza' ) { ?>
						selected="loginza"
					  <?php } ?>
					><?php echo $entry_steam_agent_loginza; ?></option>
                </select>
				<div><?php echo $entry_steam_agent_notice; ?></div>
			</div>
        </div> 
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_steam_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_steam_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_steam_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		
		<?php /* start 0207 */ ?>
		<div id="block_steam_agent_extension"
		<?php if ( $socnetauth2_steam_agent == 'loginza' ) { ?> style="display: none;" <?php } ?>
		> 
		
		<table id="steam_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_steam_api_key; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="steam_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_steam_api_key"  
				value="<?php echo $socnetauth2_steam_api_key; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $steam_req_row = 0; ?>
          <?php foreach ($socnetauth2_steam_req as $req) { ?>
          <tbody id="steam_req-row<?php echo $steam_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_steam_req[<?php echo $steam_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_steam_req[<?php echo $steam_req_row; 
				 ?>][api_key]"  
				value="<?php echo $req['api_key']; ?>" />
			  </td>
			  <td><a onclick="$('#steam_req-row<?php echo $steam_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $steam_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="2"></td>
              <td class="left"><a onclick="addsteamReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var steam_req_row = <?php echo $steam_req_row; ?>;
		
		function addsteamReq()
		{
			html = '';
			
			html += '<tbody id="steam_req-row'+steam_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_steam_req['+steam_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_steam_req['+steam_req_row+'][api_key]"  />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#steam_req-row'+steam_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			$('#steam_req tfoot').before(html);
			
			steam_req_row++;
		}
		</script>
		</div>
		<?php /* end 0207 */ ?>
		
	  </div>
	
	
	<?php /* start 0207 */ ?>
	  <div id="tab-instagram" class="tab-pane">
	  <input type="hidden" name="socnetauth2_instagram_agent" 
	  value="extension">
	  <p>Инструкция по интергации с instagram.com по ссылке:<br>
		<a href="https://softpodkluch.ru/socnetauth2-instagram" target=_blank
		>https://softpodkluch.ru/socnetauth2-instagram</a>
		</p>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_instagram_status; ?>
			</label>
            <div class="col-sm-10">
			  <select name="socnetauth2_instagram_status" class="form-control">
                  <?php if ( $socnetauth2_instagram_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
        </div>
		<?php /* start r3 */ ?>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_debug; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_instagram_debug" class="form-control">
                  <?php if ( $socnetauth2_instagram_debug ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				<div><?php echo $text_debug_notice; ?></div>
			</div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_socnet_title; ?>
			</label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text"  class="form-control" 
						name="socnetauth2_instagram_title[<?php echo $language['language_id']; ?>]" 
						value="<?php if( !empty($socnetauth2_instagram_title[ $language['language_id'] ]) ) 
						echo $socnetauth2_instagram_title[ $language['language_id'] ]; ?>" >&nbsp;<img 
						src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>
		</div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_instagram_customer_group_id; ?>
			</label>
            <div class="col-sm-10">
				<select name="socnetauth2_instagram_customer_group_id" class="form-control" >
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $socnetauth2_instagram_customer_group_id) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
			</div>
        </div>
		
		<?php /* start 0207 */ ?>
		<div id="block_instagram_agent_extension"
		> 
		
		<table id="instagram_req" class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left"><?php echo $col_domain; ?></td>
              <td class="left"><?php echo $entry_instagram_client_id; ?></td>
              <td class="left"><?php echo $entry_instagram_client_secret; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="instagram_req-row">
            <tr>
              <td class="left">
				  <?php echo $text_default_domain; ?>
			  </td>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_instagram_client_id"  
				value="<?php echo $socnetauth2_instagram_client_id; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_instagram_client_secret"  
				value="<?php echo $socnetauth2_instagram_client_secret; ?>" />
			  </td>
			  <td></td>
			</tr>
          <?php $instagram_req_row = 0; ?>
          <?php foreach ($socnetauth2_instagram_req as $req) { ?>
          <tbody id="instagram_req-row<?php echo $instagram_req_row; ?>">
            <tr>
              <td class="left">
				<input type="text" class="form-control" name="socnetauth2_instagram_req[<?php echo $instagram_req_row; 
				 ?>][domain]"  
				value="<?php echo $req['domain']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_instagram_req[<?php echo $instagram_req_row; 
				 ?>][client_id]"  
				value="<?php echo $req['client_id']; ?>" />
			  </td>
              <td class="left">
				<input type="text" class="form-control" 
				name="socnetauth2_instagram_req[<?php echo $instagram_req_row; 
				 ?>][client_secret]"  
				value="<?php echo $req['client_secret']; ?>" />
			  </td>
			  <td><a onclick="$('#instagram_req-row<?php echo $instagram_req_row; 
				 ?>').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>
			</tr> 
          </tbody>
          <?php $instagram_req_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addinstagramReq();" class="btn btn-primary"
			  ><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
		<script>
		var instagram_req_row = <?php echo $instagram_req_row; ?>;
		
		function addinstagramReq()
		{
			html = '';
			
			html += '<tbody id="instagram_req-row'+instagram_req_row+'">';
			html += '<tr>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" name="socnetauth2_instagram_req['+instagram_req_row+'][domain]"   />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += ' name="socnetauth2_instagram_req['+instagram_req_row+'][client_id]"  />';
			html += '</td>';
			html += '<td class="left">';
			html += '<input type="text" class="form-control" ';
			html += 'name="socnetauth2_instagram_req['+instagram_req_row+'][client_secret]"   />';
			html += '</td>';
			html += '<td class="left"><a onclick="$(\'#instagram_req-row'+instagram_req_row+'\').remove();" class="btn btn-primary"><?php echo $button_remove; ?></a></td>';
			html += '</tr> ';
			html += '</tbody>';
			
			
			$('#instagram_req tfoot').before(html);
			
			instagram_req_row++;
		}
		</script>
		</div>
	  </div>
	  
	<?php /* end 1811 */ ?>
	  
	  <div id="tab-dobor" class="tab-pane">
	  
        <p><b><?php echo $entry_confirm_data; ?></b></p>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_dobortype; ?>
			</label>
            <div class="col-sm-10">
			
				<select  class="form-control" name="socnetauth2_dobortype">
					<option value="one"
						<?php if( $socnetauth2_dobortype == 'one' ) { ?> selected <?php } ?>
					><?php   echo $entry_dobortype_one; ?></option>
					<option value="every"
						<?php if( $socnetauth2_dobortype == 'every' ) { ?> selected <?php } ?>
					><?php echo $entry_dobortype_every; ?></option>
				</select>
			</div>
        </div>
		
		<?php /* start 1409 */ ?>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_is_close_disabled; ?>
			</label>
            <div class="col-sm-10" style="padding: 20px;">
				<input type="checkbox" class="form-control" 
				name="socnetauth2_is_close_disabled"  
				value="1" 
				<?php if( !empty($socnetauth2_is_close_disabled) ) { ?> checked <?php } ?>
				/>
			</div>
        </div>
		<?php /* end 1409 */ ?>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_firstname; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_firstname_status">
                  <?php if ( $socnetauth2_confirm_firstname_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_firstname_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                </select>
				<input type="checkbox" name="socnetauth2_confirm_firstname_required" value="1"
				id="socnetauth2_confirm_firstname_required"
				<?php if( $socnetauth2_confirm_firstname_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_firstname_required"><?php echo $text_required;?></label>
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_firstname_hideifhas" value="1"
				id="socnetauth2_confirm_firstname_hideifhas"
				<?php if( $socnetauth2_confirm_firstname_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_firstname_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_lastname; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_lastname_status">
                <?php if ( $socnetauth2_confirm_lastname_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_lastname_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_lastname_required" value="1"
				id="socnetauth2_confirm_lastname_required"
				<?php if( $socnetauth2_confirm_lastname_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_lastname_required"><?php echo $text_required;?></label>
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_lastname_hideifhas" value="1"
				id="socnetauth2_confirm_lastname_hideifhas"
				<?php if( $socnetauth2_confirm_lastname_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_lastname_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_email; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_email_status">
                <?php if ( $socnetauth2_confirm_email_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_email_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                </select>
				<input type="checkbox" name="socnetauth2_confirm_email_required" value="1"
				id="socnetauth2_confirm_email_required"
				<?php if( $socnetauth2_confirm_email_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_email_required"><?php echo $text_required;?></label>
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_email_hideifhas" value="1"
				id="socnetauth2_confirm_email_hideifhas"
				<?php if( $socnetauth2_confirm_email_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_email_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_phone; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_telephone_status">
                 <?php if ( $socnetauth2_confirm_telephone_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_telephone_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_telephone_required" value="1"
				id="socnetauth2_confirm_telephone_required"
				<?php if( $socnetauth2_confirm_telephone_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_telephone_required"><?php echo $text_required;?></label>
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_telephone_hideifhas" value="1"
				id="socnetauth2_confirm_telephone_hideifhas"
				<?php if( $socnetauth2_confirm_telephone_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_telephone_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<?php /* start 1409 */ ?>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_telephone_mask; ?>
			</label>
            <div class="col-sm-10">
				<input type="text"  class="form-control"
				name="socnetauth2_telephone_mask" 
				value="<?php echo $socnetauth2_telephone_mask; ?>" >
				<div><?php echo $entry_telephone_mask_notice; ?></div>
			</div>
        </div>
		<?php /* end 1409 */ ?>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_company; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_company_status">
                 <?php if ( $socnetauth2_confirm_company_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_company_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_company_required" value="1"
				id="socnetauth2_confirm_company_required"
				<?php if( $socnetauth2_confirm_company_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_company_required"><?php echo $text_required;?></label>
				
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_company_hideifhas" value="1"
				id="socnetauth2_confirm_company_hideifhas"
				<?php if( $socnetauth2_confirm_company_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_company_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_postcode; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_postcode_status">
                 <?php if ( $socnetauth2_confirm_postcode_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_postcode_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_postcode_required" value="1"
				id="socnetauth2_confirm_postcode_required"
				<?php if( $socnetauth2_confirm_postcode_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_postcode_required"><?php echo $text_required;?></label> 
				
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_postcode_hideifhas" value="1"
				id="socnetauth2_confirm_postcode_hideifhas"
				<?php if( $socnetauth2_confirm_postcode_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_postcode_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_country; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_country_status">
                 <?php if ( $socnetauth2_confirm_country_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_country_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_country_required" value="1"
				id="socnetauth2_confirm_country_required"
				<?php if( $socnetauth2_confirm_country_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_country_required"><?php echo $text_required;?></label>
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_country_hideifhas" value="1"
				id="socnetauth2_confirm_country_hideifhas"
				<?php if( $socnetauth2_confirm_country_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_country_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_zone; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_zone_status">
                 <?php if ( $socnetauth2_confirm_zone_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_zone_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_zone_required" value="1"
				id="socnetauth2_confirm_zone_required"
				<?php if( $socnetauth2_confirm_zone_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_zone_required"><?php echo $text_required;?></label>
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_zone_hideifhas" value="1"
				id="socnetauth2_confirm_zone_hideifhas"
				<?php if( $socnetauth2_confirm_zone_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_zone_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_city; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_city_status">
                 <?php if ( $socnetauth2_confirm_city_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_city_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_city_required" value="1"
				id="socnetauth2_confirm_city_required"
				<?php if( $socnetauth2_confirm_city_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_city_required"><?php echo $text_required;?></label>
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_city_hideifhas" value="1"
				id="socnetauth2_confirm_city_hideifhas"
				<?php if( $socnetauth2_confirm_city_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_city_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_address_1; ?>
			</label>
            <div class="col-sm-10">
			<select  class="form-control" name="socnetauth2_confirm_address_1_status">
                 <?php if ( $socnetauth2_confirm_address_1_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $socnetauth2_confirm_address_1_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_address_1_required" value="1"
				id="socnetauth2_confirm_address_1_required"
				<?php if( $socnetauth2_confirm_address_1_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_address_1_required"><?php echo $text_required;?></label>
				
				
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_address_1_hideifhas" value="1"
				id="socnetauth2_confirm_address_1_hideifhas"
				<?php if( $socnetauth2_confirm_address_1_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_address_1_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		
		<?php /* start 0102 */ ?>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_group; ?>
			</label>
            <div class="col-sm-10">
				<select  class="form-control" name="socnetauth2_confirm_group_status">
                 <?php if ( $socnetauth2_confirm_group_status == 1  ) { ?>
					<option value="0"><?php echo $text_disabled; ?></option>
					<option value="1" selected="selected" ><?php echo $text_enabled; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
					<option value="1"><?php echo $text_enabled; ?></option>
				  
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_group_required" value="1"
				id="socnetauth2_confirm_group_required"
				<?php if( $socnetauth2_confirm_group_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_group_required"><?php echo $text_required;?></label>
				<?php /* start 1007 */ ?>
				<input type="checkbox" name="socnetauth2_confirm_group_hideifhas" value="1"
				id="socnetauth2_confirm_group_hideifhas"
				<?php if( $socnetauth2_confirm_group_hideifhas ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_group_hideifhas"><?php echo $text_hideifhas;?></label>
				<?php /* end 1007 */ ?>
				
			</div>
        </div>
		<?php /* end 0102 */ ?>
		
		<?php /* start 1303 */ ?>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_agree; ?>
			</label>
            <div class="col-sm-10">
				<select  class="form-control" name="socnetauth2_confirm_agree_status">
					<option value="0"><?php echo $entry_agree_no; ?></option>
					
                 <?php foreach( $informations as $inf  ) { ?>
					<option value="<?php echo $inf['information_id']; ?>" 
					<?php if( $inf['information_id'] == $socnetauth2_confirm_agree_status ) { 
					?> selected="selected" <?php } ?>
					><?php echo $inf['title']; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_agree_required" value="1"
				id="socnetauth2_confirm_agree_required"
				<?php if( $socnetauth2_confirm_agree_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_agree_required"><?php echo $text_required;?></label>
			</div>
        </div>
		<?php /* end 1303 */ ?>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_agree2; ?>
			</label>
            <div class="col-sm-10">
				<select  class="form-control" name="socnetauth2_confirm_agree2_status">
					<option value="0"><?php echo $entry_agree_no; ?></option>
					
                 <?php foreach( $informations as $inf  ) { ?>
					<option value="<?php echo $inf['information_id']; ?>" 
					<?php if( $inf['information_id'] == $socnetauth2_confirm_agree2_status ) { 
					?> selected="selected" <?php } ?>
					><?php echo $inf['title']; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_agree2_required" value="1"
				id="socnetauth2_confirm_agree2_required"
				<?php if( $socnetauth2_confirm_agree2_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_agree2_required"><?php echo $text_required;?></label>
			</div>
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_agree3; ?>
			</label>
            <div class="col-sm-10">
				<select  class="form-control" name="socnetauth2_confirm_agree3_status">
					<option value="0"><?php echo $entry_agree_no; ?></option>
					
                 <?php foreach( $informations as $inf  ) { ?>
					<option value="<?php echo $inf['information_id']; ?>" 
					<?php if( $inf['information_id'] == $socnetauth2_confirm_agree3_status ) { 
					?> selected="selected" <?php } ?>
					><?php echo $inf['title']; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="socnetauth2_confirm_agree3_required" value="1"
				id="socnetauth2_confirm_agree3_required"
				<?php if( $socnetauth2_confirm_agree3_required ) { ?>
				checked
				<?php } ?>
				><label for="socnetauth2_confirm_agree3_required"><?php echo $text_required;?></label>
			</div>
        </div>
		<?php /* start 2505 */ ?>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_newsletter; ?>
			</label>
            <div class="col-sm-10">
				<select  class="form-control" name="socnetauth2_confirm_newsletter">
                 <?php if ( $socnetauth2_confirm_newsletter == 1  ) { ?>
					<option value="0"><?php echo $text_disabled; ?></option>
					<option value="1" selected="selected" ><?php echo $text_enabled; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
					<option value="1"><?php echo $text_enabled; ?></option>
				  
				  <?php } ?>
                 </select>
			</div>
        </div>
		<?php /* end 1303 */ ?>
	  </div>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  <div id="tab-widget" class="tab-pane">
	  
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_name; ?>
			</label>
            <div class="col-sm-10">
			
	  		<?php foreach ($languages as $language) { ?>
			<p>
			<input type="text"  class="form-control"  name="socnetauth2_widget_name[<?php echo $language['language_id']; ?>]" value="<?php if( !empty($socnetauth2_widget_name[ $language['language_id'] ]) ) echo $socnetauth2_widget_name[ $language['language_id'] ]; ?>" >&nbsp;<img 
			src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
			</p>
			<?php } ?>
			</div>
        </div>
		
	  </div>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  
	  <div id="tab-popup" class="tab-pane">
	  <?php /*
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_mobile_control; ?>
			</label>
            <div class="col-sm-10"><select name="socnetauth2_mobile_control" class="form-control" >
                  <?php if ( $socnetauth2_mobile_control ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>			
        </div>
	  
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_status; ?>
			</label>
            <div class="col-sm-10">
				<select  class="form-control" name="socnetauth2_popup_status" class="form-control">
                  <?php if ($socnetauth2_popup_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_popup_name; ?>
			</label>
            <div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
				<p>
					<input type="text" class="form-control"  name="socnetauth2_popup_name[<?php echo $language['language_id']; ?>]" value="<?php if( !empty($socnetauth2_popup_name[ $language['language_id'] ]) ) echo $socnetauth2_popup_name[ $language['language_id'] ]; ?>" >&nbsp;<img 
					src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
				</p>
				<?php } ?>
			</div>
        </div>
		*/ ?>
	  </div>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  
	  
	  
	  <?php /* start 1505 */ ?>
	  <div id="tab-design" class="tab-pane">
		<div class="row">
		
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked">
					<li <?php if( $tab2 == 'general' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('general'); $('.design_options').hide(); $('#tab-design-general').show();" data-toggle="tab" 
						aria-expanded="true"> <?php echo $tab_design_general; ?></a>
					</li>
					<li <?php if( $tab2 == 'account' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('account'); $('.design_options').hide(); $('#tab-design-account').show();" data-toggle="tab" 
						aria-expanded="true"> <?php echo $tab_design_account; ?></a>
					</li>
					<li <?php if( $tab2 == 'checkout' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('checkout'); $('.design_options').hide(); $('#tab-design-checkout').show();" data-toggle="tab" 
						aria-expanded="true"> <?php echo $tab_design_checkout; ?></a>
					</li>
					<li <?php if( $tab2 == 'reg' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('reg'); $('.design_options').hide(); $('#tab-design-reg').show();"
						data-toggle="tab" 
						aria-expanded="true"><?php echo $tab_design_reg; ?></a>
					</li>
					<li <?php if( $tab2 == 'icons' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('icons'); $('.design_options').hide(); $('#tab-design-icons').show();"
						data-toggle="tab" 
						aria-expanded="true"><?php echo $tab_design_icons; ?></a>
					</li>
					
					<li <?php if( $tab2 == 'widget' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('widget'); $('.design_options').hide(); $('#tab-design-widget').show();"
						data-toggle="tab" 
						aria-expanded="true"><?php echo $tab_design_widget; ?></a>
					</li>
					
					<li <?php if( $tab2 == 'popup' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('popup'); $('.design_options').hide(); $('#tab-design-popup').show();"
						data-toggle="tab" 
						aria-expanded="true"><?php echo $tab_design_popup; ?></a>
					</li>
					<li <?php if( $tab2 == 'confirm' ) { ?>class="active" <?php } ?> style="cursor: pointer;">
						<a onclick="$('#hiddentab2').val('confirm'); $('.design_options').hide(); $('#tab-design-confirm').show();"
						data-toggle="tab" 
						aria-expanded="true"><?php echo $tab_design_confirm; ?></a>
					</li>
					
					
				</ul>
			</div>
			<div class="col-sm-10">
			
				<div id="tab-design-general" class="design_options"
				 <?php if( $tab2 != 'general' ) { ?> style="display: none;" <?php } ?>
				>
					<h2><?php echo $tab_design_general; ?></h2>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_notice; ?>
						</label>
						<div class="col-sm-10">
							<?php echo $entry_design_notice_text; ?>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_general_css; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=10
							name="socnetauth2_design_general_css"
							><?php echo $socnetauth2_design_general_css; ?></textarea>
						</div>
					</div>
				</div>
			
				<div id="tab-design-account" class="design_options"
				 <?php if( $tab2 != 'account' ) { ?> style="display: none;" <?php } ?>>
					<h2><?php echo $tab_design_account; ?></h2>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_status; ?>
						</label>
						<div class="col-sm-10">
							<select name="socnetauth2_design_account_status" class="form-control" >
							  <?php if ( $socnetauth2_design_account_status ) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0" ><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_html; ?>
						</label>
						<div class="col-sm-7">
							<textarea class="form-control" rows=3
							name="socnetauth2_design_account_html"
							><?php echo $socnetauth2_design_account_html; ?></textarea>
						</div>
						<label class="col-sm-3">
							<?php echo $entry_design_html_tags; ?>
						</label>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_css; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=3
							name="socnetauth2_design_account_css"
							><?php echo $socnetauth2_design_account_css; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_header; ?>
						</label>
						<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
							<p>
								<input type="text"  class="form-control" 
								name="socnetauth2_design_account_header[<?php echo $language['language_id']; ?>]" 
								value="<?php if( !empty($socnetauth2_design_account_header[ $language['language_id'] ]) ) 
									echo $socnetauth2_design_account_header[ $language['language_id'] ]; ?>" >&nbsp;<img 
								src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
							</p>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_format; ?>
						</label>
						<div class="col-sm-10">
							<table class="format_table" cellpadding=0 cellspacing=0 width=100%>
							<tr>
								<td width=33%><input type="radio" name="socnetauth2_account_format" value="kvadrat"
								<?php if( $socnetauth2_account_format == 'kvadrat' ) { 
								?> checked <?php } ?> 
								id="socnetauth2_account_format_kvadrat"
								><label for="socnetauth2_account_format_kvadrat"
								><?php echo $text_format_kvadrat; ?></label></td>
								
								<td width=33%><input type="radio" name="socnetauth2_account_format" value="bline"
								<?php if( $socnetauth2_account_format == 'bline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_account_format_bline"
								><label for="socnetauth2_account_format_bline"><?php echo $text_format_bline; ?></label></td>
								
								<td><input type="radio" name="socnetauth2_account_format" value="lline"
								<?php if( $socnetauth2_account_format == 'lline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_account_format_lline"
								><label for="socnetauth2_account_format_lline"
								><?php echo $text_format_lline; ?></label></td>
							</tr>
							<tr>
								<td valign=top><img src="view/image/socnetauth2/kvadrat.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/bline.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/lline.png" style="border: 1px #ededed solid;"></td>
							</tr>
							<tr>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
									
								</td>
								<td valign=top><br>
								<b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_header"&gt;{header}&lt;/div&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
								</td>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div&gt;
&lt;div class="sna_header" style="float: left; padding-right: 15px;"&gt;{header} &lt;/div&gt;<br>
&lt;div class="sna_icons" style="float: left; padding-top: 7px;"&gt;{icons}&lt;/div&gt;<br>
&lt;br style="clear: both;"&gt;
&lt;/div&gt;</td>
							</tr>
							</table>
						</div>
					</div>
					
					
				</div>
				<div id="tab-design-checkout" class="design_options"
				 <?php if( $tab2 != 'checkout' ) { ?> style="display: none;" <?php } ?>>
					
					<h2><?php echo $tab_design_checkout; ?></h2>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_status; ?>
						</label>
						<div class="col-sm-10">
							<select name="socnetauth2_design_checkout_status" class="form-control" >
							  <?php if ( $socnetauth2_design_checkout_status ) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0" ><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_html; ?>
						</label>
						<div class="col-sm-7">
							<textarea class="form-control" rows=3
							name="socnetauth2_design_checkout_html"
							><?php echo $socnetauth2_design_checkout_html; ?></textarea>
						</div>
						<label class="col-sm-3">
							<?php echo $entry_design_html_tags; ?>
						</label>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_css; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=3
							name="socnetauth2_design_checkout_css"
							><?php echo $socnetauth2_design_checkout_css; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_header; ?>
						</label>
						<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
							<p>
								<input type="text"  class="form-control" 
								name="socnetauth2_design_checkout_header[<?php echo $language['language_id']; ?>]" 
								value="<?php if( !empty($socnetauth2_design_checkout_header[ $language['language_id'] ]) ) 
									echo $socnetauth2_design_checkout_header[ $language['language_id'] ]; ?>" >&nbsp;<img 
								src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
							</p>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_format; ?>
						</label>
						<div class="col-sm-10">
							
							<table class="format_table" cellpadding=0 cellspacing=0 width=100%>
							<tr>
								<td width=33%><input type="radio" name="socnetauth2_checkout_format" value="kvadrat"
								<?php if( $socnetauth2_checkout_format == 'kvadrat' ) { 
								?> checked <?php } ?> 
								id="socnetauth2_checkout_format_kvadrat"
								><label for="socnetauth2_checkout_format_kvadrat"
								><?php echo $text_format_kvadrat; ?></label></td>
								
								<td width=33%><input type="radio" name="socnetauth2_checkout_format" value="bline"
								<?php if( $socnetauth2_checkout_format == 'bline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_checkout_format_bline"
								><label for="socnetauth2_checkout_format_bline"><?php echo $text_format_bline; ?></label></td>
								
								<td><input type="radio" name="socnetauth2_checkout_format" value="lline"
								<?php if( $socnetauth2_checkout_format == 'lline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_checkout_format_lline"
								><label for="socnetauth2_checkout_format_lline"
								><?php echo $text_format_lline; ?></label></td>
							</tr>
							<tr>
								<td valign=top><img src="view/image/socnetauth2/kvadrat.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/bline.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/lline.png" style="border: 1px #ededed solid;"></td>
							</tr>
							<tr>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
									
								</td>
								<td valign=top><br>
								<b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_header"&gt;{header}&lt;/div&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
								</td>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div&gt;
&lt;div class="sna_header" style="float: left; padding-right: 15px;"&gt;{header} &lt;/div&gt;<br>
&lt;div class="sna_icons" style="float: left; padding-top: 7px;"&gt;{icons}&lt;/div&gt;<br>
&lt;br style="clear: both;"&gt;
&lt;/div&gt;</td>
							</tr>
							</table>
						</div>
					</div>
					
					
				</div>
				<div id="tab-design-reg" class="design_options"
				 <?php if( $tab2 != 'reg' ) { ?> style="display: none;" <?php } ?>>
					<h2><?php echo $tab_design_reg; ?></h2>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_status; ?>
						</label>
						<div class="col-sm-10">
							<select name="socnetauth2_design_reg_status" class="form-control" >
							  <?php if ( $socnetauth2_design_reg_status ) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0" ><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_html; ?>
						</label>
						<div class="col-sm-7">
							<textarea class="form-control" rows=3
							name="socnetauth2_design_reg_html"
							><?php echo $socnetauth2_design_reg_html; ?></textarea>
						</div>
						<label class="col-sm-3">
							<?php echo $entry_design_html_tags; ?>
						</label>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_css; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=3
							name="socnetauth2_design_reg_css"
							><?php echo $socnetauth2_design_reg_css; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_header; ?>
						</label>
						<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
							<p>
								<input type="text"  class="form-control" 
								name="socnetauth2_design_reg_header[<?php echo $language['language_id']; ?>]" 
								value="<?php if( !empty($socnetauth2_design_reg_header[ $language['language_id'] ]) ) 
									echo $socnetauth2_design_reg_header[ $language['language_id'] ]; ?>" >&nbsp;<img 
								src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
							</p>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_format; ?>
						</label>
						<div class="col-sm-10">
							
							<table class="format_table" cellpadding=0 cellspacing=0 width=100%>
							<tr>
								<td width=33%><input type="radio" name="socnetauth2_reg_format" value="kvadrat"
								<?php if( $socnetauth2_reg_format == 'kvadrat' ) { 
								?> checked <?php } ?> 
								id="socnetauth2_reg_format_kvadrat"
								><label for="socnetauth2_reg_format_kvadrat"
								><?php echo $text_format_kvadrat; ?></label></td>
								
								<td width=33%><input type="radio" name="socnetauth2_reg_format" value="bline"
								<?php if( $socnetauth2_reg_format == 'bline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_reg_format_bline"
								><label for="socnetauth2_reg_format_bline"><?php echo $text_format_bline; ?></label></td>
								
								<td><input type="radio" name="socnetauth2_reg_format" value="lline"
								<?php if( $socnetauth2_reg_format == 'lline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_reg_format_lline"
								><label for="socnetauth2_reg_format_lline"
								><?php echo $text_format_lline; ?></label></td>
							</tr>
							<tr>
								<td valign=top><img src="view/image/socnetauth2/kvadrat.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/bline.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/lline.png" style="border: 1px #ededed solid;"></td>
							</tr>
							<tr>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
									
								</td>
								<td valign=top><br>
								<b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_header"&gt;{header}&lt;/div&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
								</td>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div&gt;
&lt;div class="sna_header" style="float: left; padding-right: 15px;"&gt;{header} &lt;/div&gt;<br>
&lt;div class="sna_icons" style="float: left; padding-top: 7px;"&gt;{icons}&lt;/div&gt;<br>
&lt;br style="clear: both;"&gt;
&lt;/div&gt;</td>
							</tr>
							</table>
						</div>
					</div>
					
				</div>
				<div id="tab-design-icons" class="design_options"
				 <?php if( $tab2 != 'icons' ) { ?> style="display: none;" <?php } ?>>
					<h2><?php echo $tab_design_icons; ?></h2>
					<div><?php echo $text_count_icons; ?> <select id="count_icons"
					onchange="$('.count_icons_blocks').hide(); $('#count_icons_block'+this.value).show();"
					>
					<?php for($i=1; $i<10; $i++) { ?>
						<option value="<?php echo $i; ?>"
						<?php if( $i == $count_icons ) { ?> selected <?php } ?>
						><?php echo $i; ?></option>
					<?php } ?>
					</select> <?php echo $text_current_count_icons; ?><?php echo $count_icons; ?></div><br>
					<div><?php echo $text_count_icons_notice; ?></div>
					
					<?php for($i=1; $i<10; $i++) { ?>
					<div id="count_icons_block<?php echo $i; ?>" class="count_icons_blocks"
					<?php if( $i!=$count_icons ) { ?> style="display: none;" <?php } ?>
					>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_bline_html[$i]; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=<?php echo $i+6; ?>
							name="socnetauth2_bline_html[<?php echo $i ?>]"
							><?php echo $socnetauth2_bline_html[$i]; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_lline_html[$i]; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=<?php echo $i+6; ?>
							name="socnetauth2_lline_html[<?php echo $i ?>]"
							><?php echo $socnetauth2_lline_html[$i]; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_kvadrat_html[$i]; ?>
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows=<?php echo $i+6; ?>
							name="socnetauth2_kvadrat_html[<?php echo $i ?>]"
							><?php echo $socnetauth2_kvadrat_html[$i]; ?></textarea>
						</div>
					</div>
					</div>
					
					<?php } ?>
				</div>
				
				<div id="tab-design-widget" class="design_options"
					<?php if( $tab2 != 'widget' ) { ?> style="display: none;" <?php } ?>>
					<h2><?php echo $tab_design_widget; ?></h2>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_widget_notice; ?>
						</label>
						<div class="col-sm-10">
							<?php echo $entry_widget_notice_text; ?> 
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_status; ?>
						</label>
						<div class="col-sm-10">
							<select name="socnetauth2_design_widget_status" class="form-control" >
							  <?php if ( $socnetauth2_design_widget_status ) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0" ><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_widget_after; ?>
						</label>
						<div class="col-sm-10">
							<select  class="form-control" name="socnetauth2_widget_after">
								<option value="hide"
								<?php if( $socnetauth2_widget_after=='hide' ) { ?> selected <?php } ?>
								><?php echo $text_widget_after_hide; ?></option>
								<option value="show"
								<?php if( $socnetauth2_widget_after=='show' ) { ?> selected <?php } ?>
								><?php echo $text_widget_after_show; ?></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_widget_name; ?>
						</label>
						<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
							<p>
								<input type="text"  class="form-control" 
								name="socnetauth2_widget_name[<?php echo $language['language_id']; ?>]" 
								value="<?php if( !empty($socnetauth2_widget_name[ $language['language_id'] ]) ) 
									echo $socnetauth2_widget_name[ $language['language_id'] ]; ?>" >&nbsp;<img 
								src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
							</p>
							<?php } ?>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_design_widget_format; ?>
						</label>
						<div class="col-sm-10">
							
							<table class="format_table" cellpadding=0 cellspacing=0 width=100%>
							<tr>
								<td width=33%><input type="radio" name="socnetauth2_widget_format" value="kvadrat"
								<?php if( $socnetauth2_widget_format == 'kvadrat' ) { 
								?> checked <?php } ?> 
								id="socnetauth2_widget_format_kvadrat"
								><label for="socnetauth2_widget_format_kvadrat"
								><?php echo $text_format_kvadrat; ?></label></td>
								
								<td width=33%><input type="radio" name="socnetauth2_widget_format" value="bline"
								<?php if( $socnetauth2_widget_format == 'bline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_widget_format_bline"
								><label for="socnetauth2_widget_format_bline"><?php echo $text_format_bline; ?></label></td>
								
								<td><input type="radio" name="socnetauth2_widget_format" value="lline"
								<?php if( $socnetauth2_widget_format == 'lline' ) { 
								?> checked <?php } ?>
								id="socnetauth2_widget_format_lline"
								><label for="socnetauth2_widget_format_lline"
								><?php echo $text_format_lline; ?></label></td>
							</tr>
							<tr>
								<td valign=top><img src="view/image/socnetauth2/kvadrat.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/bline.png" style="border: 1px #ededed solid;"></td>
								<td valign=top><img src="view/image/socnetauth2/lline.png" style="border: 1px #ededed solid;"></td>
							</tr>
							<tr>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
									
								</td>
								<td valign=top><br>
								<b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div class="sna_header"&gt;{header}&lt;/div&gt;<br>
&lt;div class="sna_icons"&gt;{icons}&lt;/div&gt;
								</td>
								<td valign=top><br><b><?php echo $text_recomendation_code; ?></b><br>
								&lt;style&gt;{style}&lt;/style&gt;<br>
&lt;div&gt;
&lt;div class="sna_header" style="float: left; padding-right: 15px;"&gt;{header} &lt;/div&gt;<br>
&lt;div class="sna_icons" style="float: left; padding-top: 7px;"&gt;{icons}&lt;/div&gt;<br>
&lt;br style="clear: both;"&gt;
&lt;/div&gt;</td>
							</tr>
							</table>
						</div>
					</div>
					
				</div>
				
				<div id="tab-design-popup" class="design_options"
					<?php if( $tab2 != 'popup' ) { ?> style="display: none;" <?php } ?>>
					<h2><?php echo $tab_design_popup; ?></h2>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_popup_notice; ?>
						</label>
						<div class="col-sm-10">
							<?php echo $entry_popup_notice_text; ?> 
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_mobile_control; ?>
						</label>
						<div class="col-sm-10">
							<select name="socnetauth2_mobile_control" class="form-control" >
							  <?php if ( $socnetauth2_mobile_control ) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0" ><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select>
						</div>
					</div>
				</div>
				<div id="tab-design-confirm" class="design_options"
					<?php if( $tab2 != 'confirm' ) { ?> style="display: none;" <?php } ?>>
					<h2><?php echo $tab_design_confirm; ?></h2>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-access-secret">
							<?php echo $entry_is_noiframe; ?>
						</label>
						<div class="col-sm-10">
							<select name="socnetauth2_is_noiframe" class="form-control" >
							  <?php if ( $socnetauth2_is_noiframe ) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0" ><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select>
							<div><?php echo $entry_is_noiframe_notice; ?></div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	  </div>
	  <?php /* end 1505 */ ?>
	  
	  
	  
	  <div id="tab-support" class="tab-pane">
	  
			<p><?php echo $text_frame; ?></p>
			<iframe width=100% height=700 src="https://softpodkluch.ru/faq/socnetauth2.html" border=0 frameborder="0" style="border: 1px #ccc solid;"></iframe>
			<?php echo $text_contact; ?>
	  </div>
      </form> 
    </div>
  </div>
</div>
	  
	<script>
		function set_tab()
		{
			if( $('#link-tab-general').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-general';
			}
			
			if( $('#link-tab-vkontakte').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-vkontakte';
			}
			
			if( $('#link-tab-facebook').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-facebook';
			}
			
			if( $('#link-tab-twitter').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-twitter';
			}
			
			if( $('#link-tab-odnoklassniki').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-odnoklassniki';
			}
			
			if( $('#link-tab-dobor').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-dobor';
			}
			
			if( $('#link-tab-widget').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-widget';
			}
			
			if( $('#link-tab-popup').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-popup';
			}
			
			if( $('#link-tab-design').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-design';
			}
			
			if( $('#link-tab-support').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-support';
			}
			
			/* start metka: a1 */
			if( $('#link-tab-gmail').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-gmail';
			}
			
			if( $('#link-tab-mailru').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-mailru';
			}
			/* end metka: a1 */
			
			/* start 1811 */
			if( $('#link-tab-steam').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-steam';
			}
			if( $('#link-tab-yandex').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-yandex';
			}
			/* end 1811 */
			
			/* start 0207 */
			if( $('#link-tab-instagram').attr('aria-expanded') == 'true' )
			{
				document.getElementById('hiddentab').value = 'link-tab-instagram';
			}
			/* end 0207 */ 
		}
		
		$('#<?php echo $tab; ?>').click();
		
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