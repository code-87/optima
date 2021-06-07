<?php if (!$logged) { ?>
<style>
.widget_account_icons_links
{
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 15px;
	float: left;
}

.socnetauthbox
{
	border: 1px solid #ddd;
	margin-bottom: 20px;    
	border-radius: 4px 4px 4px 4px;
}

.socnetauthbox h3
{
	margin: 0px;
	color: #888888;
	font-size: 14px;
}

.socnetauthbox .socnetauthhead
{
	border-radius: 4px 4px 0px 0px;
	background: none repeat scroll 0 0 #eeeeee;
	border-bottom: 1px solid #ddd;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	padding-right: 20px;
}

.socnetauthbox .socnetauthbody
{
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	padding-right: 20px;
}

.socnetauthform td
{
	padding-top: 5px;
}

</style>
<div  class="socnetauthbox">
<div class="socnetauthhead">
 <h3><?php echo $heading_title; ?></h3>
</div>
<div class="socnetauthbody">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<table class="socnetauthform" width=100%>
		<tr>
			<td><?php echo $entry_email; ?></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control col-sm-3" name="email" value=""></td>
		</tr>
		<tr>
			<td><?php echo $entry_password; ?></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control col-sm-3" name="password"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="<?php echo $text_login; ?>" class="btn btn-primary" />
			</td>
		</tr>
	</table>
	
<?php if( $socnetauth2_widget_format == 'kvadrat' ) { ?>
<br>
<div class="content widget_account_socnetauth_kvadrat_content">		
		<div class="widget_account_kvadrat_right">
		
		<?php if( $count_socnets <= 2  ) { ?>
		<table>
			<tr>
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[0]) ) { 
				?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[1]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
		</table>
		<?php } elseif( $count_socnets <= 4  ) {?>
		<table>
			<tr>
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[0]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[1]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
			<tr>
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[2]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[2]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[2]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[3]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[3]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[3]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
		</table>
		<?php } elseif( $count_socnets <= 6  ) {?>
		<table>
			<tr>
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[0]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[1]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>45.png"></a><?php } ?></td>
			
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[2]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[2]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[2]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
			<tr>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[3]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[3]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[3]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[4]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[4]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[4]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[5]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[5]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[5]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
		</table>
		<?php } else {?>
		<table>
			<tr>
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[0]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[0]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[0]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[1]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[1]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[1]['short']; ?>45.png"></a><?php } ?></td>
			
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[2]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[2]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[2]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[3]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[3]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[3]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
			<tr>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[4]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[4]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[4]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[5]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[5]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[5]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[6]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[6]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[6]['short']; ?>45.png"></a><?php } ?></td>
				
				<td style="padding: 5px;"><?php if( !empty($socnetauth2_socnets[7]) ) { ?><a class="socnetauth2_buttons" 
				href="<?php echo $socnetauth2_socnets[7]['link']; ?>"
				><img src="/socnetauth2/icons/<?php echo $socnetauth2_socnets[7]['short']; ?>45.png"></a><?php } ?></td>
			</tr>
		</table>
		<?php } ?>
		
		
		</div>
</div>			
<?php } ?>		  
<?php if( $socnetauth2_widget_format == 'lline' ) { ?>  
		<div class="widget_account_lline_links" style="text-align: center; padding-top: 10px;">
		
				<?php foreach( $socnetauth2_socnets as $socnet) { ?>
				<a class="socnetauth2_buttons" 
				href="<?php echo $socnet['link']; ?>"
				><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnet['short']; ?>16.png"></a>
				<?php } ?>
		</div>		  
<?php } ?>	
<?php if( $socnetauth2_widget_format == 'bline' ) { ?>  
		<div class="widget_account_bline_links" style="text-align: center; padding-top: 10px;">
				<?php foreach( $socnetauth2_socnets as $socnet) { ?>
				<a class="socnetauth2_buttons" 
				href="<?php echo $socnet['link']; ?>"
				><img src="<?php echo $socnetauth2_shop_folder; 
				?>/socnetauth2/icons/<?php echo $socnet['short']; ?>45.png"></a>
				<?php } ?>
		</div>		  
<?php } ?>	
	</form>
    <ul>
      <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
    </ul>
    
</div>

</div>
    <?php } ?>