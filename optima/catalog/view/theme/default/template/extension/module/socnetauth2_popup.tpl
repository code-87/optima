<?php if( $show_socauth2_popup ) { ?>
<div>
<style>
#socAuthOverlay {
    background: none repeat scroll 0 0 #fff;
    height: 100%;
    position: fixed;
    width: 100%; 
	left: 0;
    overflow: hidden;
    top: 0;
    z-index: 99;
}

#socAuthPopUp {
    background: none repeat scroll 0 0 #fff;
    border: 1px solid #DFDFDF;
	box-shadow: 0px 0px 10px #DFDFDF;
    z-index: 99999999;
	
	position: fixed;
	width: 517px;
	
	-moz-border-radius: 15px;
	border-radius: 15px;
	padding-top: 28px;
}

#socAuthPopUp table td {
	padding: 10px;
}

#socAuthPopUp .header
{
	text-align: center;
	padding: 0px;
	font-size: 30px;
	line-height: 28px;
}

#socAuthPopUp .skipp
{
	padding-top: 18px;

}

#socAuthPopUp .skiplink
{
	color: #000;
	text-decoration: none;
	font-size: 25px;
}

a.socnetauth_buttons:hover img
{
	opacity: 0.8;
}

</style>
<div id="socAuthOverlay" style="display: none; opacity: 0.9;"></div>
<div id="socAuthPopUp" style="display: none;">
<p class="header"><?php echo $heading_title; ?></p>
<p style="height: 4px;"></p>

<?php if( $count_socnets <= 4 ) { ?>
<table width=100%>
	<tr>
		<td width=4%></td>
<?php foreach( $socnetauth2_socnets as $socnet ) { ?>
		<td width=30% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnet['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnet['short']; ?>.png"></a></td>
<?php } ?>
		<td width=4%></td>
	</tr>
</table>
<?php } elseif( $count_socnets <= 6 ) { ?>

<table width=100%>
	<tr>
		<td width=4%></td>
		
		<td width=30% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>.png"></a></td>
		
		<td width=30% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>.png"></a></td>
		
		<td width=30% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[2]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[2]['short']; ?>.png"></a></td>
		
		
		<td width=4%></td>
	</tr>
	<tr>
		<td width=4%></td>
		
		<td width=30% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[3]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[3]['short']; ?>.png"></a></td>
		
		<td width=30% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[4]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[4]['short']; ?>.png"></a></td>
		
		
		<td width=30% align=center>
		<?php if( !empty($socnetauth2_socnets[5]['link']) ) {
			?><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[5]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[5]['short']; ?>.png"></a
				><?php } ?></td>
		
		<td width=4%></td>
	</tr>
</table>

<?php /* start 2912 */ ?>
<?php } elseif( $count_socnets == 9 ) { ?>

<table width=100%>
	<tr>
		<td width=4%></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>.png"></a></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>.png"></a></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[2]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[2]['short']; ?>.png"></a></td>
		
		
		<td width=4%></td>
	</tr>
	<tr>
		<td width=4%></td>
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[3]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[3]['short']; ?>.png"></a></td>
		
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[4]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[4]['short']; ?>.png"></a></td>
		
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[5]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[5]['short']; ?>.png"></a></td>
		
		<td width=4%></td>
	</tr>
	<tr>
		<td width=4%></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[6]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[6]['short']; ?>.png"></a></td>
		
		
		<td width=23% align=center><?php if( !empty($socnetauth2_socnets[7]['link']) ) { 
		?><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[7]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
		?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[7]['short']; ?>.png"></a><?php 
		} ?></td>
		
		<td width=23% align=center><?php if( !empty($socnetauth2_socnets[8]['link']) ) { 
		?><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[8]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
		?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[8]['short']; ?>.png"></a><?php 
		} ?></td>
		
		
		
		<td width=4%></td>
	</tr>
</table>


<?php /* end 2912 */ ?>
<?php } else { ?>

<table width=100%>
	<tr>
		<td width=4%></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>.png"></a></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>.png"></a></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[2]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[2]['short']; ?>.png"></a></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[3]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[3]['short']; ?>.png"></a></td>
		
		
		<td width=4%></td>
	</tr>
	<tr>
		<td width=4%></td>
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[4]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[4]['short']; ?>.png"></a></td>
		
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[5]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[5]['short']; ?>.png"></a></td>
		
		
		<td width=23% align=center><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[6]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[6]['short']; ?>.png"></a></td>
		
		
		<td width=23% align=center><?php if( !empty($socnetauth2_socnets[7]['link']) ) { 
		?><a class="socnetauth_buttons" onclick="closeSocAuthPopUp();"  
		href="<?php echo $socnetauth2_socnets[7]['link']; ?>"
		><img src="<?php echo $socnetauth2_shop_folder; 
		?>/socnetauth2/icons/<?php echo $socnetauth2_socnets[7]['short']; ?>.png"></a><?php 
		} ?></td>
		
		
		<td width=4%></td>
	</tr>
</table>

<?php } ?>
<p align=center class="skipp"><i><a href="javascript: closeSocAuthPopUp();" class="skiplink"><?php echo $text_skip; ?></a></i></p>
</div>
<script>
function show_socauth_popup()
{
	<?php if( $socnetauth2_mobile_control ) { ?>
	if( $(window).width()<520 ) return;
	<?php } ?>
	
	var otstup1 = ($(window).width() - 517)/2;
	var otstup2 = ($(window).height() - 420)/2;
	
	if( $(window).width() < 520  )
	{
		document.getElementById('socAuthPopUp').style.left    = '0px';
		document.getElementById('socAuthPopUp').style.width = $(window).width()+'px';
	}
	else
	{
		document.getElementById('socAuthPopUp').style.left    = otstup1+'px';
	}
	document.getElementById('socAuthPopUp').style.top     = otstup2+'px';
	document.getElementById('socAuthPopUp').style.display = 'block';
	document.getElementById('socAuthOverlay').style.display = 'block';
}

function closeSocAuthPopUp()
{
	document.getElementById('socAuthPopUp').style.display = 'none';
	document.getElementById('socAuthOverlay').style.display = 'none';
	setCookie('show_socauth2_popup','1');
}

function setCookie( c_name, value, exdays )
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
}


show_socauth_popup();
</script>
</div>
<?php } ?>