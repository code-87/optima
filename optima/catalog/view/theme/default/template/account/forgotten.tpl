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
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
<div class="order__input">
<label>Восстановление пароля — введите ваш электронный адрес (e-mail)</label>
<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" />
</div>  
<div class="profile__button"><button type="submit" value="<?php echo $button_continue; ?>">Восстановить</button></div>
</form>
</div>
</div>
</div>
<?php echo $footer; ?>