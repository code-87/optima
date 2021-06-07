<style>	
#socnetauth2overlay {

			height:100%;
			width:100%;
			position:fixed;
			left:0;
			top:0;
			z-index:99999 !important;
			background-color:black;
			
			filter: alpha(opacity=75);
			-khtml-opacity: 0.75;
			-moz-opacity: 0.75
			opacity: 0.75;
}

#socnetauth2box
{
	background: #fff;
	z-index:999990 !important;
	border-radius: 15px;
	padding-bottom: 57px; 
	padding: 15px; 
	top: 50px; 
	left: 368px; 
	position: fixed; 
	width: 500px; 
	
}

</style>
<div id="socnetauth2overlay" style="opacity: 0.5; cursor: pointer;"></div>
<div id="socnetauth2box" class="" 
<?php if( $is_iframe ) { ?>  style="height: <?php echo $divframe_height; ?>px;" <?php } ?>
>


<?php if( $is_iframe ) { ?>
<iframe src="<?php echo $frame_url; ?>" style="border: 0px; width: 500px; height: <?php echo $frame_height; ?>px;"></iframe> 
<?php } else { ?>
<div id="socnetauth2_body">
<?php echo $noframe; ?>
</div>
<?php } ?>
<?php /* start 2612 */ ?>
<a href="javascript: closeWindow('<?php echo $lastlink; ?>');" 
<?php /* end 2612 */ ?>
	style="text-decoration: none; font-size: 30px; position: absolute; top:15px; right: 20px;">X</a>
</div>

<script>
<?php /* start 2612 */ ?>
function closeWindow(lastlink)
{
	var r = Math.random();
	$.ajax({
        url: '/index.php?route=account/socnetauth2/closeWindow&r='+r,
        dataType: 'html',
        success: function(html) {
		
			if( html == 'OK' )
			{
				$('#socnetauth2overlay').hide();
				$('#socnetauth2box').hide();
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
<?php /* end 2612 */ ?>

function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}
function possocnetauth22Window()
{
	if( !getCookie('socnetauth2_confirmdata') )
		return;
		
	if( $(window).width() > 500 )
	{
		var left = ($(window).width() - 500)/2;
	}
	else
	{
		var left = 5;
		var wid = $(window).width() - 10;
		
		$('#socnetauth2box iframe').css('width', wid+'px');
		$('#socnetauth2box').css('width', wid+'px');
	}
	
	var top =  ($(window).height() - <?php echo $frame_height; ?>)/2;
	
	$('#socnetauth2box').css("left", left+'px');
	$('#socnetauth2box').css("top", top+'px');
}

function PopupCenter() {
	// url, title, w, h
	var w = 400;
	var h = $('#socnetauth2box').height();
	
	if( !h )
		h = <?php echo $frame_height; ?>;

    // Fixes dual-screen position                         Most browsers      Firefox
	
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    //var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    
	var width = $(window).width();
	
	var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	var left = 0;
	
	if( width-10 < w )
	{
		$('#socnetauth2box').width('90%');
		$('#socnetauth2box').css("left", '2%');
	}
	else
	{
		w = 400;
		$('#socnetauth2box').width(w+'px');
			
		var systemZoom = width / window.screen.availWidth;
		left = (width - w) / 2 / systemZoom + dualScreenLeft
		
		if( left < 0 )
			left = 0;
			
		$('#socnetauth2box').css("left", left+'px');
	}
	
	if( height-10 < h )
	{
		h = height + 50;
		//$('#socnetauth2box').height(h+'px');
	}
	
	
	//alert(left);
	
	var top = (height - h) / 2;
	
	if( top < 0 )
		top = 0;
	
	// (height - h) / 2  / systemZoom + dualScreenTop


	$('#socnetauth2box').css("top", top+'px');
	
    //var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w / systemZoom + ', height=' + h / systemZoom + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    //if (window.focus) newWindow.focus();
}

window.onorientationchange = function() { 
	setTimeout(function(){ PopupCenter(); }, 2000);
};

var reportWindowSize = function()
{
	setTimeout(function(){ PopupCenter(); }, 1000);
}

window.addEventListener('resize', reportWindowSize);

PopupCenter();

function socnetauthFrameConfirmation()
{
	var r = Math.random();
	$.ajax({
        url: $('#socnetauth2_frame_confirmation').attr("action")+'&r='+r,
        type: 'post',
        data: $('#socnetauth2_frame_confirmation input[type=\'text\'], #socnetauth2_frame_confirmation input[type=\'date\'], #socnetauth2_frame_confirmation input[type=\'datetime-local\'], #socnetauth2_frame_confirmation input[type=\'time\'], #socnetauth2_frame_confirmation input[type=\'password\'], #socnetauth2_frame_confirmation input[type=\'hidden\'], #socnetauth2_frame_confirmation input[type=\'checkbox\']:checked, #socnetauth2_frame_confirmation input[type=\'radio\']:checked, #socnetauth2_frame_confirmation textarea, #socnetauth2_frame_confirmation select'),
		dataType: 'html',
        success: function(html) {
			$('#socnetauth2_body').html(html);
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}


function confirmSocnetauthForm()
{
	
	var r = Math.random();
	$.ajax({
        url: $('#socnetauth2_frame').attr("action")+'&r='+r,
        type: 'post',
        data: $('#socnetauth2_frame input[type=\'text\'], #socnetauth2_frame input[type=\'date\'], #socnetauth2_frame input[type=\'datetime-local\'], #socnetauth2_frame input[type=\'time\'], #socnetauth2_frame input[type=\'password\'], #socnetauth2_frame input[type=\'hidden\'], #socnetauth2_frame input[type=\'checkbox\']:checked, #socnetauth2_frame input[type=\'radio\']:checked, #socnetauth2_frame textarea, #socnetauth2_frame select'),
		dataType: 'html',
        success: function(html) {
			$('#socnetauth2_body').html(html);
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
</script>