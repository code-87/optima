<?php echo $header; ?>
<div class="breadcrumbs">
<div class="wrapper">
<div class="breadcrumbs__links"><?php foreach ($breadcrumbs as $breadcrumb) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?></div>
</div>
</div>
<div class="content content-text">
<div class="wrapper h600">
<h1><?php echo $heading_title; ?></h1>
<div class=" text text440">	
<?php if ($error_warning) { ?><div class="alert alert-danger"><img src="img/info-alert.svg" alt=""> <?php echo $error_warning; ?></div><?php } ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<div class="order__input">
<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
</div>
<div class="order__input">
<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
</div>
<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
<div class="profile__button">
<button type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary">Войти</button></div>
<?php if ($redirect) { ?>
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
<?php } ?>
</form>
</div>
</div>
</div>
</div>
<?php echo $footer; ?>