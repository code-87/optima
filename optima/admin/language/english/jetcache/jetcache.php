<?php
include('version.php');

$_['jetcache_model_code'] = 'jetcache';
$_['order_jetcache'] = '10';
$_['jetcache_model_settings'] = $_['jetcache_model'] . ' ' .$_['jetcache_version'];
$_['heading_title'] = $_['jetcache_model_settings'];
$_['heading_title'] = '<span style="color: #16A9DE; font-size: 16px; font-weight: 400;"><a href="https://opencartadmin.com" target="_blank" data-toggle="tooltip" title="" data-original-title="opencartadmin.com"><i class="fa fa-dot-circle-o" style="font-size:16px; margin-right: 6px;"></i></a>' . $_['heading_title'] . '</span>';
if (!defined('SC_VERSION')) define('SC_VERSION', (int)substr(str_replace('.','',VERSION), 0,2));

if (SC_VERSION > 22) {
	if (file_exists(DIR_APPLICATION. 'controller/module/jetcache.php')) {
		@unlink(DIR_APPLICATION. 'controller/module/jetcache.php');
	}
}
if (SC_VERSION < 22) {
	if (file_exists(DIR_APPLICATION. 'controller/extension/module/jetcache.php')) {
		@unlink(DIR_APPLICATION. 'controller/extension/module/jetcache.php');
	}
	$files_extension_module = glob(DIR_APPLICATION. 'controller/extension/module/*.*');
	if (!$files_extension_module && is_dir(DIR_APPLICATION. 'controller/extension/module')) {
    	rmdir(DIR_APPLICATION. 'controller/extension/module');
	}
}

$_['heading_dev'] = 'Module developer <a href="mailto:admin@opencartadmin.com" target= "_blank" >opencartadmin.com</a><br> &copy; 2011-'.date ('Y').'All Rights Reserved.';
$_['entry_tab_options'] = 'Settings';
$_['entry_id'] = 'ID';

$_['text_status'] = 'Status';
$_['text_mod_add_jetcache'] = $_['jetcache_model'].'modifier set<br>';

$_['entry_url_jetcache'] = 'Module settings page';

$_['tab_options'] = 'Settings';
$_['tab_pages'] = 'Pages';
$_['tab_cont'] = 'Controllers';
$_['tab_access'] = 'Access';
$_['tab_exceptions'] = 'Exceptions';
$_['tab_query'] = 'Queries';
$_['tab_model'] = 'Models';
$_['tab_minify'] = 'Minification';
$_['tab_minify_html'] = 'HTML';
$_['tab_minify_css'] = 'CSS';
$_['tab_minify_js'] = 'JS';
$_['tab_doc'] = 'Documentation';
$_['tab_logs'] = 'Logs';
$_['tab_main'] = 'Home';
$_['tab_clear'] = 'Clear cache';
$_['tab_lazy'] = 'Images';

$_['entry_lazy_status'] = 'Delayed loading of images <br>"Lazy Loading Images"';
$_['entry_lazy_status_help'] = 'Replacement Rules <br>
Format: <br>
"Token for replace" | "Token to which we replace" <br>
<br>delimiter "carriage transfer" (PHP_EOL),<br>between tokens | ';

$_['entry_minify_html'] = 'HTML Minification';
$_['entry_minify_html_status_help'] = 'HTML minification status';

$_['entry_minify_html_ex_route'] = 'Exceptions route';
$_['entry_minify_html_ex_route_help'] = 'Parameters <br>separated by "carriage" <br><br><span class="jc-help"># - turns off </span>';

$_['entry_lazy_ex_route'] = 'Exceptions route';
$_['entry_lazy_ex_route_help'] = 'Parameters <br>separated by "carriage" <br><br><span class="jc-help"># - turns off </span>';


$_['entry_minify_css'] = 'CSS Minification';
$_['entry_minify_css_status_help'] = 'CSS minification status';

$_['entry_minify_js'] = 'Minify JS';
$_['entry_minify_js_status_help'] = 'Minification Status JS';


$_['entry_lazy_status'] = $_['entry_lazy_status_help'] = 'Lazy Loading Images';

$_['entry_db_status'] = 'Cache to DB';
$_['entry_pages_db_status_help'] = 'Cache <br> pages in DB';
$_['entry_cont_db_status_help'] = 'Cache <br> controllers in DB';
$_['entry_model_db_status_help'] = 'Cache methods of <br> models in DB';

$_['entry_add_rule'] = 'Add';
$_['entry_ex_route'] = 'Route';
$_['entry_ex_routes'] = 'Routes Exceptions';

$_['entry_pages_status_help'] = 'Pages will be <br>cached in the file cache<br>if caching is not enabled in the database';
$_['entry_ex_routes_help'] = 'route Exceptions';

$_['entry_pages_forsage'] = 'Forcing';
$_['entry_pages_forsage_help'] = 'When you enable this feature, you will force the page to be cached as soon as possible';


$_['entry_ex_pages'] = 'URI Exceptions';
$_['entry_ex_page'] = 'URI';
$_['entry_ex_page_accord'] = 'Appropriate';
$_['entry_ex_pages_help'] = 'REQUEST_URI exceptions';

$_['entry_cont_status_help'] = 'Status controller caching';
$_['entry_add_conts_help'] = 'Controller <br>need to cache';
$_['entry_add_conts'] = 'Controllers';
$_['entry_add_cont'] = 'Controller';

$_['entry_cache_mobile_detect'] = 'Definition mobile device';
$_['entry_jetcache_info_status'] = 'Dashboard <span class="jetcache-table-help-href">?</span>';

$_['entry_jetcache_info_demo_status'] = '<br>demo mode<br>(show all)';

$_['entry_model_status_help'] = 'Enable/disable<br>method caching in models';
$_['entry_model_product_status'] = 'Model catalog/product';
$_['entry_model_gettotalproducts_status'] = 'Method getTotalProducts';
$_['entry_model_gettotalproducts_status_help'] = 'Cache method <br> - count products <br>categories';

$_['entry_seocms_jetcache_alter'] = 'Alternative method <br>to write to cache file';
$_['entry_seocms_jetcache_gzip_level'] = 'Compression data (gzip) in cache <br> (0-do not compress, <br> 0-faster, but takes <br>more disk space)';
$_['text_gettotalproducts_uri_status'] = 'URL Dependency';

$_['entry_ex_session'] = 'Excluded session parameters';
$_['entry_ex_session_help'] = '<br>split <br>translation of "carriage" <br>PHP_EOL';

$_['entry_session_log'] = 'Logging <br>the session variables <br>in the log file';
$_['entry_cache_max_hache_folders_level'] = 'Folder level in cache';
$_['entry_no_getpost'] = 'Do not respond to <br> GET and SESSION';


$_['entry_query_status_help'] = 'request caching Status <br>it makes sense to cache requests, <br> if there are slow requests greater than 0.01 c';
$_['entry_query_db_status_help'] = 'Caching of queries in DB <br>Simple query of cache from DB <br>will be faster than complex and slow';
$_['entry_query_log_settings'] = 'Configuration log request';
$_['entry_query_log_status'] = 'Status request file log';
$_['entry_query_log_maxtime'] = 'Time from which to log the query <br><span class="jc-help">(seconds, fractional through a point), <br>example: 0.1  - 0.1 seconds, this is 100 ms</span>';
$_['entry_query_log_file'] = 'File, slow query log, <br> file name in opencart file log folder';
$_['entry_query_model_title'] = 'Queries that are cached for classes and their methods';
$_['entry_query_model_help'] = 'Queries that will be cached from models and methods <br>model class, for example: ModelCatalogProduct <br>model method, for example: getTotalProducts <br>If the method field is empty, all model methods will be cached';
$_['entry_query_model'] = 'Class';
$_['entry_query_method'] = 'Method';

$_['button_buildcache'] = 'Create cache';
$_['button_buildcache_abort'] = 'Cancel';
$_['message_buildcache_aborted'] = '<span style= "color: red;">Canceled</span>';
$_['message_buildcache_complete'] = '<span style= "color: green;">Succeeded</span>';
$_['message_buildcache_processing'] = '<span style= "color: #16A9DE;">Processed</span>';
$_['message_buildcache_processing_complete'] = ' <span style="color: #16A9DE;">Executed</span>';
$_['entry_jetcache_builcache_gen'] = 'Generate cache';


$_['label_buildcache_with_products'] = 'with goods';
$_['label_buildcache_with_lang'] = 'all languages';

$_['label_buildcache_with_products_title_info'] = 'with goods';
$_['label_buildcache_with_lang_title_info'] = 'all languages';


$_['label_buildcache_with_products_data_content'] = 'Generate cache with product pages <br> If a large number of products can take a long time';
$_['label_buildcache_with_lang_data_content'] = 'Generate cache for pages in all languages. <br>If one language or you are not using language prefixes (sub-domains) for each language to note is not necessary';

$_['entry_minify_html'] = 'HTML Minification';
$_['entry_minify_html_status_help'] = 'Status HTML minification';

$_['entry_minify_css'] = 'CSS Minification';
$_['entry_minify_css_status_help'] = 'Status CSS minification';

$_['entry_minify_js'] = 'JS Minification';
$_['entry_minify_js_status_help'] = 'Status JS minification';

$_['text_jetcache_success'] = 'Successful';

$_['entry_log_file_unlink'] = 'Delete file';
$_['entry_log_file_view'] = 'View file';
$_['unlink_success'] = 'Successful';
$_['unlink_unsuccess'] = 'Failed. File not found';
$_['access_denided'] = 'Access denied';


$_['ocmod_jetcache_name'] = $_['jetcache_model'];
$_['ocmod_jetcache_name_15'] = $_['jetcache_model'].' 15';
$_['ocmod_jetcache_db_name'] = $_['jetcache_model'].' DB';

$_['ocmod_jetcache_mod'] = $_['jetcache_model_code'];
$_['ocmod_jetcache_mod_15'] = $_['jetcache_model_code'].'_15';
$_['ocmod_jetcache_db_mod'] = $_['jetcache_model_code'].'_db';

$_['ocmod_jetcache_author'] = 'opencartadmin.com';
$_['ocmod_jetcache_link'] = 'https://opencartadmin.com';
$_['jetcache_ocas'] = 'https://opencartadmin.com/index.php?route=record/ver';

$_['ocmod_jetcache_html'] = $_['ocmod_jetcache_name'].'modifier successfully installed<br>';
$_['ocmod_jetcache_db_html'] = $_['ocmod_jetcache_db_name'].'modifier successfully installed<br>';

$_['entry_install_update'] = 'Install/update';
$_['url_create_text'] = '<div style= "text-align: center; text-decoration: none;">Install and update<br>modifiers,<br> module data (performed when installing and updating the module)</div>';

$_['text_refresh_ocmod_successfully'] = '<span style="color: green">Modifiers updated successfully</span>';
$_['text_refresh_ocmod_success'] = 'Modifiers updated successfully';

$_['text_refresh_ocmod_error'] = '<span style="color: red;">error updating modifiers</span>';

$_['entry_model_help'] = '<br>Model classes and methods for caching';
$_['entry_onefile'] = 'To a single file';
$_['entry_model_status'] = 'Model caching';
$_['entry_model_title'] = 'Model classes and methods for caching';
$_['entry_no_vars'] = 'Do not respond to:<br> 1. GET parameters<br> 2. SESSION parameters<br> 3. URL address<br> 4. ROUTE';

$_['entry_ex_get'] = 'GET parameters Excluded';
$_['entry_ex_get_help'] = '<br>split <br>translation of "carriage" <br>PHP_EOL';

$_['entry_lastmod_status'] = 'Status of last-Modified header';
$_['entry_lastmod_help'] = 'Last-Modified: '.gmdate('D, d M Y H:i:s \G\M\T').',filemtime(кеш файла)<br>HTTP/1.1 304 Not Modified <br><br>In .htaccess add rule after<br>RewriteRule ^([^?]*) index.php?_route_=$1 [L,QSA]<br><br><span style="color: green;">RewriteRule ^(.*)$ $1 [E=HTTP_IF_MODIFIED_SINCE:%{HTTP:If-Modified-Since}]</span><br>or<br><span style="color: green;">RewriteRule .* - [E=HTTP_IF_MODIFIED_SINCE:%{HTTP:If-Modified-Since}]<br>RewriteRule .* - [E=HTTP_IF_NONE_MATCH:%{HTTP:If-None-Match}]</span>';

$_['entry_cachecontrol_status'] = 'Cache-Control header Status';
$_['entry_cachecontrol_help'] = 'Cache-Control:public, max-age=31536000';

$_['entry_expires_status'] = 'Status Expires header';
$_['entry_expires_help'] = 'Expires:'. gmdate ('D, d M Y h:i:s \G\M\T', time () + 604800);

$_['ocmod_file_agoo_catalog_product_unlink_successfully'] = 'Old version file <br>/catalog/model/agoo/catalog/product.php<br> successfully removed<br> <br>';

$_['entry_widget_status'] = " Status";
$_['entry_cache_expire'] = 'Lifetime of module <br> cache file (in seconds)';
$_['entry_cache_max_files'] = 'Maximum number of files <br> in the module cache folder';
$_['entry_cache_maxfile_length'] = 'Maximum size of <br>module file cache (in bytes)';
$_['entry_cache_auto_clear'] = 'Automatic cleaning of <br>total cache (in hours)';
$_['entry_tab_settings_cache'] = 'Cache and modifiers';
$_['entry_jetcache_ocmod_refresh'] = 'Update cache <br> <span class="sc-color-clearcache">modifiers</span>';
$_['text_url_ocmod_refresh'] = 'Update';
$_['text_ocmod_refresh_success']= 'Succeeded';
$_['text_ocmod_refresh_fail'] = 'Could not update';
$_['entry_jetcache_cache_remove'] = 'Delete cache <br> <span class="sc-color-clearcache">files</span>';
$_['text_url_cache_remove'] = 'Delete cache';
$_['text_cache_remove_success'] = 'Completed successfully';
$_['text_cache_remove_fail'] = 'Could not remove';
$_['text_jetcache_about'] = '<odule';
$_['entry_jetcache_cache_image_remove'] = 'Delete cache <br> <span class="sc-color-clearcache">images</span>';
$_['text_url_cache_image_remove'] = 'Delete cache';
$_['text_cache_image_remove_success'] = 'Completed successfully';
$_['text_cache_image_remove_fail'] = 'Could not remove';
$_['entry_store'] = 'Stores:';
$_['text_default_store'] = 'Main store';
$_['text_loading_main'] = '<div style=&#92;\'color: #008000;&#92;\'>Loading...<img src=&#92;\'../image/jetcache/jetcache-loading.gif&#92;\'></div>';
$_['text_faq']='';
$_['text_separator']=' > ';

$_['entry_add_category'] = 'Clear cache (complete)<br>when you add, modify, remove categories';
$_['entry_add_category_help'] = 'When enabled, the setting will be made complete cache cleanup';
$_['label_add_category'] = 'Clear the cache when you add, modify, remove categories';
$_['label_add_category_content'] = 'When enabled, the setting will be made complete cache cleanup';

$_['entry_add_product'] = 'Clear cache (complete)<br>in addition, removal of the product';
$_['entry_add_product_help'] = 'When enabled, the setting will be made complete cache cleanup';
$_['label_add_product'] = 'Clear the cache when you add, delete product';
$_['label_add_product_content'] = 'When enabled, the setting will be made complete cache cleanup';

$_['entry_edit_product'] = 'Clear cache (complete)<br>if you change the product';
$_['entry_edit_product_help'] = 'When enabled, the setting will be made complete cache cleanup';
$_['label_edit_product'] = 'Clear cache when product changes';
$_['label_edit_product_content'] = 'When enabled, the setting will be made complete cache cleanup';

$_['entry_edit_product_id'] = 'Clearing the cache (bound) <br>if you change the product';
$_['label_edit_product_id'] = 'Related cleaning the cache when you change the product';


$_['entry_query_log_status_title'] = 'Status&nbsp;log&nbsp;file&nbsp;request';
$_['entry_query_log_status_content'] = 'Remember to disable after analysis of the queries<br><span style="color: red;">Attention! Status of requests (tab Requests) must be enabled</span>';

$_['entry_jetcache_menu_status'] = 'Status <i class="fa fa-dot-circle-o"></i> JC in menu';
$_['entry_jetcache_menu_order'] = 'Order of <i class="fa fa-dot-circle-o"></i> JC in the menu, after menu item number:';

$_['text_status_on'] = 'enabled';
$_['text_status_off'] = 'off';

$_['text_js_status_on'] = '<i class="fa fa-dot-circle-o"></i> JC <span style="margin-left: 6px; color: #eeffee;"> '.$_['text_status_on'] .' <i class="fa fa-lightbulb-o" aria-hidden="true"></i></span>';
$_['text_js_status_off'] = '<i class="fa fa-dot-circle-o"></i> JC <span style="margin-left: 6px; color: #fccccc;"> '.$_['text_status_off'] .' <i class="fa fa-lightbulb-o" aria-hidden="true"></i></span>';

$_['text_ocmod_refresh'] = 'Update&nbsp;modifiers';

$_['text_close'] = 'Close';

$_['entry_session_log_file'] = 'File, session log,<br>file name in the opencart file log folder';

$_['entry_session_log_settings'] = 'Session log setting';
$_['entry_session_log_settings_help'] = 'When enabled, you can log <br>session variables and set them as exceptions when needed';
$_['entry_query_log_settings_help'] = 'When enabled, you can analyze <br> requests and, if necessary, enter them in the settings<br> Note the status of requests should be enabled';

$_['entry_model_original_status_help'] = 'Use the original model method of the Loader class';
$_['label_edit_product_id_content'] = "When enabled, cache of only the associated cache files with the product <br><span style='color: red;'>Attention will be cleared! A bit slower when writing to the cache. From the cache as quickly</span>";
$_['entry_edit_product_id_help'] = $_['label_edit_product_id_content'];

$_['entry_cont_log_settings'] = 'Controller Log Settings';
$_['entry_cont_log_settings_help'] = 'When enabled, you can log the speed of controller execution';
$_['entry_cont_log_status'] = 'Status log controllers';
$_['entry_cont_log_maxtime'] = 'The time from which to log the controller <br><span class = "jc-help"> (seconds, fractional through the point), <br>example: 0.1 - 0.1 seconds, this is 100 ms </span> ';
$_['entry_cont_log_file'] = 'Log file, speed for executing controllers, <br> file name in the folder opencart';
$_['entry_cont_log_settings_help'] = 'When enabled, you can analyze <br> speed of controllers execution';
$_['entry_cont_log_status_title'] = 'Status&nbsp;log&nbsp;file&nbsp;controllers';
$_['entry_cont_log_status_content'] = 'When enabled, you can analyze <br> the speed of execution of controllers, <br> to enter them into controller caching';

$_['tab_image_options'] = 'Settings';
$_['tab_image_ex'] = 'Exceptions';
$_['entry_image_status'] = 'Image Optimization Status';
$_['entry_image_ex'] = 'Exceptions';
$_['entry_image_status_help'] = 'When the status is turned on, image optimization will be performed';
$_['entry_image_ex_help'] = 'Exceptions';

$_['tab_image_options'] = 'Settings';
$_['tab_image_ex'] = 'Exceptions';
$_['entry_image_status'] = 'Image Optimization Status';
$_['entry_image_ex'] = 'Exceptions';
$_['entry_image_status_help'] = 'When the status is turned on, image optimization will be performed';
$_['entry_image_ex_help'] = 'Exceptions';

$_['entry_image_status_error_text'] = 'The system does not meet the requirements for optimization';

$_['entry_image_status_error'] = 'System Status';
$_['entry_webp'] = 'Optimizing images using the webp algorithm';
$_['entry_mozjpeg'] = 'Optimizing JPEG using the mozjpeg algorithm';
$_['entry_optipng'] = 'Optimizing PNG using the optipng algorithm';
$_['entry_image_status_error_must_text'] = 'System Requirements: <br> <br> <div style = "text-align: left! important;">
Linux platform (OC) <br>
Enabled php exec on server side <br>
Execution rights (0755) for webp, mozjpeg and optipng files <br>
Ability to run webp, mozjpeg and optipng
</div> ';

$_['entry_image_webp_status'] = 'Image optimization status using the webp algorithm';
$_['entry_image_webp_lossess'] = 'Lossless optimization <br> <div class = "jetcache-table-help"> -lossless switch </div>';
$_['entry_webp_must'] = 'Requirements: <br> Execution rights (0755) for webp files <br> Ability to run webp';
$_['entry_webp_text'] = 'webp';

$_['entry_image_webp_command'] = 'Options command line';
$_['entry_image_webp_relative_url'] = 'Relative URL images';


$_['entry_image_mozjpeg_status'] = 'JPEG image optimization status using the mozjpeg algorithm';
$_['entry_image_mozjpeg_optimize'] = 'Maximum optimization (slow) <br> <div class = "jetcache-table-help"> -optimize switch </div>';
$_['entry_image_mozjpeg_progressive'] = 'Progressive JPEG algorithm <br> <div class = "jetcache-table-help"> -progressive key </div>';
$_['entry_mozjpeg_must'] = 'Requirements: <br> Execution rights (0755) for mozjpeg files <br> Ability to run mozjpeg';
$_['entry_mozjpeg_text'] = 'mozjpeg';


$_['entry_image_optipng_status'] = 'PNG image optimization by optipng';
$_['entry_optipng_must'] = 'Requirements: <br> Execution rights (0755) for optipng files <br> Opportunity to run optipng';

$_['entry_optipng_optimize_level'] = 'optimization level optipng <br> <div class = "jetcache-table-help"> -oX switch, where is about - abbr. from optimization, X - compression level (1-7), where 7 - maximum, but slow, 1 - fast, but minimal </div> ';
$_['entry_optipng_text'] = 'optipng';


$_['entry_features_system'] = 'System features (test)';

$_['entry_system_linux_status'] = 'Linux platform (OS)';
$_['entry_system_exec_status'] = 'Enabled php exec function';

$_['entry_system_webp_perms'] = 'Execute webp (0755)';
$_['entry_system_webp_exec'] = 'Ability to run webp optimization';

$_['entry_system_mozjpeg_perms'] = 'Execute mozjpeg (0755)';
$_['entry_system_mozjpeg_exec'] = 'Ability to run mozjpeg optimization';
$_['entry_system_optipng_perms'] = 'Execute optipng (0755)';
$_['entry_system_optipng_exec'] = 'Opportunity to perform optimization optipng';

$_['entry_system_image_webp_original'] = 'Original image';
$_['entry_system_image_webp_lossess'] = 'Optimized image using the webp algorithm';
$_['entry_system_image_mozjpeg_original'] = 'Original JPEG image';
$_['entry_system_image_mozjpeg_optimized'] = 'Optimized JPEG image using the mozjpeg algorithm';
$_['entry_system_image_optipng_original'] = 'Original PNG image';
$_['entry_system_image_optipng_optimized'] = 'Optimized PNG image using the optipng algorithm';

$_['entry_system_yes'] = '<span class = "jetcache-green"> Meet the requirements </span>';
$_['entry_system_no'] = '<span class = "jetcache-red"> Does not match </span>';
$_['text_system_byte'] = '<span class = ""> bytes </span>';

$_['entry_header_categories_status'] = 'Caching menu categories in header';
$_['entry_header_categories_status_help'] = 'Caching standard calculation of product categories <br>for the menu in the controller header.php';

$_['entry_tab_cont_categories'] = 'Categories';
$_['entry_tab_cont_ajax'] = 'Ajax';

$_['entry_cont_ajax_status'] = 'Status ajax controller loading';
$_['entry_cont_ajax_status_help'] = 'Ajax controller loading';

$_['entry_cont_ajax_route'] = 'Route controllers ajax loading';
$_['entry_cont_ajax_route_help'] = 'Route controllers ajax loading<br>Parameters <br>separated by "carriage" translation<br><span class="jc-help"># - disables</span>';

$_['entry_cont_ajax_header'] = 'Replacing &lt;head&gt; ... &lt;/head&gt; loaded from ajax ';
$_['entry_cont_ajax_header_help'] = 'Enable only when the ajax controllers <br>have a call $this->document->...<br>';

$_['ocmod_jetcache_cat_name'] = $_['jetcache_model'].' Categories';
$_['ocmod_jetcache_cat_mod'] = $_['jetcache_model_code'].'_cat';
$_['ocmod_jetcache_cat_html'] = $_['ocmod_jetcache_cat_name'].' succesfull installed<br>';

$_['ocmod_jetcache_image_name'] = $_['jetcache_model'].' Image';
$_['ocmod_jetcache_image_mod'] = $_['jetcache_model_code'].'_image';
$_['ocmod_jetcache_image_html'] = $_['ocmod_jetcache_image_name'].' succesfull installed<br>';


$_['entry_ex_session_black_status'] = 'Session parameters (status of the "blacklist" algorithm)';
$_['entry_ex_session_black_status_help'] = 'Session parameters (status of the "blacklist" algorithm)';
$_['entry_ex_session_black'] = 'Session parameters ("blacklist")';
$_['entry_ex_session_black_help'] = 'What cache session parameters to respond to. <br>Parameters <br>separated by "carriage" <br><br><span class="jc-help"># - turns off </span>';
$_['ocmod_jetcache_menu_name'] = 'JC menu';

$_['entry_ex_cookie'] = 'Cookie parameters ("blacklist")';
$_['entry_ex_cookie_help'] = 'What cache cookie parameters to respond to. <br>Parameters <br>separated by "carriage" <br><br><span class="jc-help"># - turns off </span>';

$_['entry_cont_ajax_delay'] = 'Ajax delay (ms)';
$_['entry_cont_ajax_delay_help'] = 'Ajax delay <br>in ms (1 s = 1000 ms)';

$_['text_cont_ajax_route'] = 'Controller Route';
$_['text_cont_ajax_status'] = 'Status';
$_['text_cont_ajax_scripts'] = 'Scripts Status';
$_['text_cont_ajax_delay'] = 'Delay';
$_['text_cont_ajax_md5'] = 'Hash (md5) of settings';
$_['text_cont_ajax_action'] = 'Action';
$_['entry_cart_interval'] = 'Interval session for cart<br>(minutes)';
$_['entry_jetcache_index_status'] = 'Start timer in index.php';


$_['entry_no_vars_cont'] = 'Do not respond to: <br> 1. GET: Respond <br> only to parameters <br>2. GET parameters <br> 3. SESSION parameters <br> 4. URL Address <br>5. ROUTE ';

$_['entry_action'] = 'Action';

$_['entry_ex_key'] = 'Clearing the entire cache via the associated parameter <br> clearing the cache opencart $ this-> cache-> delete (\'parameter\');';
$_['text_ex_key'] = 'The parameters <br> are separated by the translation of the "carriage" <br><span class="jc-help"># - turns off </span>';

$_['entry_show_pro_settings'] = 'Show PRO settings';
$_['entry_hide_pro_settings'] = 'Hide PRO settings';

$_['entry_image_webp_command'] = 'Command line options';
$_['entry_image_mozjpeg_command'] = 'Command line options';
$_['entry_image_jpegoptim_command'] = 'Command line options';
$_['entry_image_optipng_command'] = 'Command line options';

$_['entry_image_jpegoptim_status'] = 'JPEG image optimization status by jpegoptim algorithm';
$_['entry_image_jpegoptim_optimize'] = 'Forced optimization <br> <div class="jetcache-table-help"> key --force </div>';
$_['entry_image_jpegoptim_progressive'] = 'JPEG Progressive Algorithm <br> <div class="jetcache-table-help"> --all-progressive key </div>';
$_['entry_jpegoptim_must'] = 'Requirements: <br> Execute permissions (0755) for jpegoptim files <br> Ability to run jpegoptim';
$_['entry_jpegoptim_text'] = 'jpegoptim';
$_['entry_system_jpegoptim_perms'] = 'Execution Permissions jpegoptim <span class="jc-help">(0755)</span>';
$_['entry_system_jpegoptim_exec'] = 'Ability to perform jpegoptim optimization';
$_['entry_image_jpegoptim_strip'] = 'Delete EXIF and comments <br> <div class="jetcache-table-help"> key --strip-all --strip-iptc </div>';

$_['entry_system_proc_open'] = 'Enabled php function proc_open';

$_['entry_minify_html'] = 'Minification HTML';
$_['entry_minify_html_status_help'] = 'Status minification HTML';
$_['entry_minify_html_ex_route'] = 'Exception route';
$_['entry_minify_html_ex_route_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_lazy_ex_route'] = 'Exception route';
$_['entry_lazy_ex_route_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_ex_route'] = 'Exception route';
$_['entry_minify_ex_route_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css'] = 'Minification CSS';
$_['entry_minify_css_status_help'] = 'Status minification CSS';
$_['entry_minify_css_ex_route'] = 'Exception route';
$_['entry_minify_css_ex_route_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css_compress_status'] = 'Compression CSS';
$_['entry_minify_css_compress_status_help'] = 'The status of compression CSS';
$_['entry_minify_css_footer'] = 'Transfer CSS down';
$_['entry_minify_css_footer_help'] = 'The status of the transfer CSS down';
$_['entry_minify_css_ex_css_footer'] = 'Exclude from transfer CSS down';
$_['entry_minify_css_ex_css_footer_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css_combine_status'] = 'Unification CSS files';
$_['entry_minify_css_combine_status_help'] = 'The status of the Association CSS files<br>Code binding in the head';
$_['entry_minify_css_combine_footer'] = 'Transfer service fileCSS down';
$_['entry_minify_css_combine_footer_help'] = 'The status of the migration service of the fileCSS down';
$_['entry_minify_css_combine_preload'] = 'Deferred loading service file CSS';
$_['entry_minify_css_combine_preload_help'] = 'Status pending download the service file CSS';
$_['entry_minify_css_preload'] = 'Pending download CSS';
$_['entry_minify_css_combine_preload_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css_ex_combine'] = 'Exclusion from the Association CSS';
$_['entry_minify_css_ex_combine_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css_in_inline'] = 'FileCSS inline in HTML';
$_['entry_minify_css_in_inline_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css_combine_inline'] = 'Transfer inline style in service file CSS';
$_['entry_minify_css_combine_inline_help'] = 'The status of the transfer inline style in service file CSS';
$_['entry_minify_css_compress_type'] = 'Aggressive algorithm compression CSS';
$_['entry_minify_css_compress_type_help'] = 'Status aggressive algorithm compression CSS';
$_['entry_minify_css_ex_combine_inline'] = 'Exception code inline style of Association CSS';
$_['entry_minify_css_ex_combine_inline_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_css_inline_footer'] = 'Transfer inline style CSS down';
$_['entry_minify_css_inline_footer_help'] = 'The status of the transfer inline style CSS down';
$_['entry_minify_js'] = 'Minification JS';
$_['entry_minify_js_status_help'] = 'Status minification JS';
$_['entry_minify_js_ex_route'] = 'Exception route';
$_['entry_minify_js_ex_route_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_compress_status'] = 'Compression JS';
$_['entry_minify_js_compress_status_help'] = 'The status of compression JS';
$_['entry_minify_js_ex_compress'] = 'Exclude from compression';
$_['entry_minify_js_ex_compress_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_footer'] = 'Transfer JS down';
$_['entry_minify_js_footer_help'] = 'The status of the transfer JS down';
$_['entry_minify_js_first'] = 'JS sooner CSS';
$_['entry_minify_js_first_help'] = 'Status JS before CSS';
$_['entry_minify_js_ex_js_footer'] = 'Exclude from transfer JS down';
$_['entry_minify_js_ex_js_footer_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_combine_status'] = 'Unification JS files';
$_['entry_minify_js_combine_status_help'] = 'The status of the Association JS files<br>Code binding in the head';
$_['entry_minify_js_combine_footer'] = 'Transfer service fileJS down';
$_['entry_minify_js_combine_footer_help'] = 'The status of the migration service of the fileJS down';
$_['entry_minify_js_ex_combine'] = 'Exclusion from the Association JS';
$_['entry_minify_js_ex_combine_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_in_inline'] = 'File. JS inline in HTML';
$_['entry_minify_js_in_inline_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_combine_inline'] = 'Transfer inline JS in service file JS';
$_['entry_minify_js_combine_inline_help'] = 'The status of the transfer inline JS in service file JS';
$_['entry_minify_js_ex_combine_inline'] = 'Exception inline JS code of the Association JS';
$_['entry_minify_js_ex_combine_inline_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_inline_footer'] = 'Transfer inline JS down';
$_['entry_minify_js_inline_footer_help'] = 'The status of the transfer inline JS down';
$_['entry_minify_js_ex_inline_footer'] = 'Exclude from transfer inline JS down';
$_['entry_minify_js_ex_inline_footer_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_preload'] = 'Pending download JS';
$_['entry_minify_js_combine_preload_help'] = 'Settings a <br>separated the <br>transfer "carriage" <br / ><span class="jc-help"># - off</span>';
$_['entry_minify_js_compress_type'] = 'Aggressive algorithm compression JS';
$_['entry_minify_js_compress_type_help'] = 'Status aggressive algorithm compression JS';
$_['entry_minify_css_preload_help'] = 'The parameters <br> are separated by the translation of the "carriage" <br> <span class="jc-help"> # - turns off </span>';
$_['entry_minify_js_preload_help'] = 'The parameters <br> are separated by the translation of the "carriage" <br> <span class="jc-help"> # - turns off </span>';

$_['text_jc_doc_faq'] = 'FAQ: Why is there no complete description of all the settings? <br>
<br>
Caching modules are the most complicated modules in opencart (these are not the simplest modules where you know all the data and tasks)
<br>
In the caches, the incoming data (which controllers will be, etc.) are not known, as well as the outgoing data are not known. <br>
It is impossible to describe hundreds of thousands of themes, modules, their methods, models (and their methods too), libraries and their "intricacies" <br>
Hundreds of billions of combinations of settings. <br>
How to describe, tell me? ;) So I don’t know how physically can describe hundreds of billions of settings options. <br>
Therefore, there are default settings in the demo store. Repeat them - they work everywhere <br>
It is better to order tuning from specialists so that the module works at full capacity. <br>
They will analyze the log files of the work of controllers, models, queries <br> and configure the module according to the bottlenecks found <br>
Regards, Jet Cache Developer
';
$_['entry_cont_log_crop'] = 'Crop parameters in log';
$_['entry_minify_js_preload_desktop'] = 'Delayed loading for desktop version';
$_['entry_minify_js_preload_desktop_rudes'] = 'Delayed loading status for desktop version';

$_['text_loading_main_without'] = '<div style="color: #008000">Loading...<i class="fa fa-refresh fa-spin"></i></div>';

$_['entry_minify_js_preload_desktop_help'] = 'Lazy loading status for desktop version';
$_['entry_minify_js_inline_compress_status'] = 'Inline js compression';
$_['entry_minify_js_inline_compress_status_help'] = 'Inline JS Compression Status';
$_['entry_minify_css_inline_compress_status'] = 'Inline CSS Compression';
$_['entry_minify_css_inline_compress_status_help'] = 'Inline CSS Compression Status';

$_['entry_minify_js_preload_desktop_help'] = 'Lazy loading status for desktop version';
$_['entry_minify_js_inline_compress_status'] = 'Compress inline JS';
$_['entry_minify_js_inline_compress_status_help'] = 'Compression status inline JS';
$_['entry_minify_css_inline_compress_status'] = 'Compress inline CSS';
$_['entry_minify_css_inline_compress_status_help'] = 'Inline CSS Compression Status';

$_['tab_service'] = 'Service';
$_['entry_jc_backup'] = 'Settings <br><span style="color: green;">save</span>';
$_['entry_jc_restore'] = 'Settings <br><span style="color: green;">restore</span>';

$_['text_jc_url_backup'] = 'Save';
$_['text_jc_url_restore'] = 'Restore';

$_['text_jc_backup_success'] = '<span style="color: green;">Settings saved</span>';
$_['text_jc_restore_success'] = '<span style="color: green">Settings restored</span>';

$_['text_jc_backup_fail'] = 'Failed to save settings';
$_['text_jc_restore_fail'] = 'Failed to restore settings';

$_['text_jc_backup_access'] = '<span style="color: red;">You do not have permissions</span>';
$_['text_jc_restore_access'] = '<span style="color: red;">You do not have permissions</span>';

$_['text_jc_settings_no_format'] = '<span style="color: red;">Wrong settings format</span>';
$_['text_jc_json_error'] = '<span style="color: red;">JSON decoding error</span>';
$_['text_jc_error_filetype'] = '<span style="color: red;">Wrong file type</span>';

$_['entry_minify_js_afterload_time_desktop'] = 'Automatic time <br> loading scripts after the DOM for desktop';
$_['entry_minify_js_afterload_time_mobile'] = 'Automatic time <br> loading scripts after the DOM for mobile';
$_['entry_minify_js_afterload_time_desktop_help'] = 'In milliseconds, 1000 ms = 1 second';
$_['entry_minify_js_afterload_time_mobile_help'] = 'In milliseconds, 1000 ms = 1 second';

$_['entry_image_webp_mozjpeg'] = 'Compress resizes with module algorithms before webp';