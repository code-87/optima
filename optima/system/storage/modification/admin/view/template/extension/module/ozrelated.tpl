<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-ozrelated" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ozrelated" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name">Имя</label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="Имя" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title">Заголовок</label>
            <div class="col-sm-10">
              <input type="text" name="title" value="<?php echo $title; ?>" placeholder="Заголовок" id="input-title" class="form-control" />
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-source">Критерий отбора</label>
            <div class="col-sm-5">
              <select name="source" class="form-control" id="input-source">
                <option value="*"       <?php if ($source == '*') { ?>       selected="selected" <?php } ?> >Без фильтрации</option>
                <option value="tags"    <?php if ($source == 'tags') { ?>    selected="selected" <?php } ?> >По тегам</option>
                <option value="vendor"  <?php if ($source == 'vendor') { ?>  selected="selected" <?php } ?> >По производителю</option>
                <option value="keyword" <?php if ($source == 'keyword') { ?> selected="selected" <?php } ?> >По ключевым словам</option>
                <option value="model"   <?php if ($source == 'model') { ?>   selected="selected" <?php } ?> >По модели</option>
              </select>
            </div>
            <div class="col-sm-5">
              <input type="checkbox" style="display:inline-block;" name="itself" value="1" <?php if (isset($itself)&&$itself == 1) { ?> checked="checked" <?php } ?> id="input-itself" class="form-control" />    Исключать себя
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order">Сортировка</label>
            <div class="col-sm-5">
              <select name="order" id="input-order" class="form-control">
                <option value="pd.name"    <?php if ($order == 'pd.name') { ?>  selected="selected" <?php } ?> >По алфавиту</option>
                <option value="p.model"    <?php if ($order == 'p.model') { ?>  selected="selected" <?php } ?> >По модели</option>
                <option value="p.price"    <?php if ($order == 'p.price') { ?>  selected="selected" <?php } ?> >По цене</option>
              </select>
            </div>
            <div class="col-sm-5">
              <input type="checkbox" style="display:inline-block;" name="sort" value="1" <?php if (isset($sort)&&$sort == 1) { ?> checked="checked" <?php } ?> id="input-sort" class="form-control" />    По возрастанию
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-category">Категория</label>
            <div class="col-sm-10">
              <input type="checkbox" style="display:inline-block;" name="category" value="1" <?php if (isset($category)&&$category == 1) { ?> checked="checked" <?php } ?> id="input-category" class="form-control" />    Только родительская категория
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_from_current_id; ?></label>
            <div class="col-sm-10">
              <input type="checkbox" style="display:inline-block;" name="from_current_id" value="1" <?php if (isset($from_current_id)&&$from_current_id == 1) { ?> checked="checked" <?php } ?> class="form-control" />    Начиная с текущего ID (с возрастанием ID)
              <br />
              <input type="checkbox" style="display:inline-block;" name="from_current_id_fill" value="1" <?php if (isset($from_current_id_fill)&&$from_current_id_fill == 1) { ?> checked="checked" <?php } ?> class="form-control" />    Закольцовка (использлвать младшие ID при нехватке старших)
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width">Ширина</label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="Ширина" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height">Высота</label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="Высота" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-simple">Отображение</label>
            <div class="col-sm-10">
              <input type="checkbox" style="display:inline-block;" name="simple" value="1" <?php if (isset($simple)&&$simple == 1) { ?> checked="checked" <?php } ?> id="input-simple" class="form-control" />    Только имя
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
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