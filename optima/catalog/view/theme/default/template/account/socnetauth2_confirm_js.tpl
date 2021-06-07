<div id="socnetauth2_confirm_block" style="display: none"></div>
<script>

$(document).ready(function() {
	var r = Math.random();
    $.ajax({
        url: '/index.php?route=account/socnetauth2/getConfirmCode&r='+r,
        dataType: 'html',
		data: {
			'lastlink': '<?php echo $lastlink; ?>',
			'lastroute': '<?php echo $lastroute; ?>'
		},
        success: function(html) {
		
			if( html )
			{
				$('#socnetauth2_confirm_block').html(html);
				$('#socnetauth2_confirm_block').show();
			}
			else
			{ 
				$('#socnetauth2_confirm_block').hide();
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
</script>