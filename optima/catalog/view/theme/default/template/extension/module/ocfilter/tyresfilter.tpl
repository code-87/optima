<div class="main__filter filter">
<div class="filter__tabs tabs"><a class="active" data-tab=".item-tiers">Шины</a> <a data-tab=".item-disk">Диски</a> <a data-tab=".item-battery">Аккумуляторы</a></div>
<div class="filter__item item item-tiers">
<div class="filter__type tabs"><a class="active" data-tab=".item-size">Подбор по размеру</a> <a data-tab=".item-auto">Подбор по авто</a></div>

<div class="filter__fields item item-size">
<div class="filter__select select">
<img alt="" src="img/filter-arrow.svg" />
<select class="width">
<option value="0">ширина</option>
<?php foreach ($tyre_widths as $tyre_width) { ?>
<option><?php echo $tyre_width; ?></option>
<?php } ?>
</select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" />
<select class="height">
<option value="0">высота</option>
<?php foreach ($tyre_heights as $tyre_height) { ?>
<option><?php echo $tyre_height; ?></option>
<?php } ?>
</select>
</div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" />
<select class="diametr"><option value="0">диаметр</option>
<?php foreach ($tyre_diametrs as $tyre_diametr) { ?>
<option><?php echo $tyre_diametr; ?></option>
<?php } ?>
</select>
</div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" />
<select class="season"><option value="0">сезон</option>
<?php foreach ($tyre_seasons as $tyre_season) { ?>
<option><?php echo $tyre_season; ?></option>
<?php } ?>
</select>
</div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" />
<select class="brand"><option value="0">бренд</option>
<?php foreach ($tyre_brands as $tyre_brand) { ?>
<option><?php echo $tyre_brand; ?></option>
<?php } ?>
</select>
</div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" />
<select class="type"><option value="0">легковая</option>
<?php echo $type; ?>
</select>
</div>
</div>

<!-- По авто -->
<div class="filter__fields item inactive item-auto">
<div class="filter__select select brandAuto"><img alt="" src="img/filter-arrow.svg" />
<select>
<option value="0">производитель</option> 
<?php foreach ($auto_brands as $auto_brand) { ?>
<option><?php echo $auto_brand; ?></option>
<?php } ?>
</select>
</div>

<div class="filter__select select modelBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="model"><option value="0">модель</option>
</select>
</div>
<div class="filter__select select yearBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="year"><option value="0">год</option>
</select>
</div>
<div class="filter__select select modBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="mod"><option value="0">модификация</option>
</select>
</div>
<div class="filter__select select seasonBrand"><img alt="" src="img/filter-arrow.svg" /><select>
<option value="0">сезон</option>
<?php foreach ($tyre_seasons as $tyre_season) { ?>
<option><?php echo $tyre_season; ?></option>
<?php } ?>
</select>
</select>
</div>
</div>


<script>
$(function(){	
var filterByBtn = $(this).find(".filterByBtn");
filterByBtn.on('click', function(e){
 e.preventDefault();
var parent = document.querySelector('.filter__tabs');
var child = parent.querySelector('.active');
var select_tabs = child.dataset.tab;
if (select_tabs ==".item-tiers"){
	var filterTabs = document.querySelector('.item-tiers'),
	filterTabs = filterTabs.querySelector(".filter__type");
     var child = filterTabs.querySelector('.active');
   var filter__tabs = child.dataset.tab;
    var select_types = filter__tabs.substr(1);
	console.log(select_tabs);
	console.log(select_types);
}else if(select_tabs ==".item-disk") {
	var filterTabs = document.querySelector('.item-disk'),
	filterTabs = filterTabs.querySelector(".filter__type");
    var child = filterTabs.querySelector('.active');
   var filter__tabs = child.dataset.tab;
   var select_types = filter__tabs.substr(1);
	console.log(select_tabs);
	console.log(select_types);
	if (select_types == 'item-size'){
		sendDiskSize();
} else {
}
}else{
	console.log(select_tabs);
	
}
});
});
</script>



<script>
$(function(){	
var currentLocation = window.location.pathname,
pathToFilter,
searchShiny = findWord('shiny', currentLocation),
searchDiski = findWord('diski', currentLocation);
if (searchDiski == true){
document.getElementsByClassName("seasonBrand")[0].style.display = 'none';
}
let brandList = $(this).find(".brandAuto"),
modelList =  $(this).find(".modelBrand"),
yearList =  $(this).find(".yearBrand"),
modList =  $(this).find(".modBrand"),
seasonList =  $(this).find(".seasonBrand"),
filterByAuto = $(this).find(".filterByAuto"),
divs;
brandList.on('click', function(e){  
 e.preventDefault();
let brand=brandList.children(' .select__items').children(' .same-as-selected').text();
// model
$.ajax({ 
url: 'index.php?route=extension/module/tyresfilter/getModel',
             type: 'get',  
             data: {'brand': brand},
            success: function(data) {	
			let model = JSON.parse(data),
			selectList = document.getElementsByClassName("model");
                for (var i = 0; i < model.length; i++) {              
					 add_option = "<option>"+model[i]+"</option>";
					 $(".model").append(add_option);
					divs = modelList.children(' .select__items');
					add_div = "<div>"+model[i]+"</div>";
					divs.append(add_div);	
                }  
             } 
        }); 
  });
  
  // year
 modelList.on('click', function(e){  
 e.preventDefault();
let model =modelList.children(' .select__items').children(' .same-as-selected').text();
let brand=brandList.children(' .select__items').children(' .same-as-selected').text();
$.ajax({ 
url: 'index.php?route=extension/module/tyresfilter/getYear',
             type: 'get',  
             data: {'brand': brand, 'model': model},
            success: function(data) {	
			let year = JSON.parse(data);
			//console.log(year); 
			selectList = document.getElementsByClassName("year");
                for (var i = 0; i < year.length; i++) {              
					 add_option = "<option>"+year[i]+"</option>";
                     $(".year").append(add_option);
                }
             } 
        }); 
  });
  
  // modification
 yearList.on('click', function(e){  
 e.preventDefault();
let model =modelList.children(' .select__items').children(' .same-as-selected').text();
let brand=brandList.children(' .select__items').children(' .same-as-selected').text();
let year=yearList.children(' .select__items').children(' .same-as-selected').text();
$.ajax({ 
url: 'index.php?route=extension/module/tyresfilter/getMod',
             type: 'get',  
             data: {'brand': brand, 'model': model,'year': year},
            success: function(data) {	
			let mod = JSON.parse(data);
			//console.log(typeof mod); 
			selectList = document.getElementsByClassName("mod");
                for (var i = 0; i < mod.length; i++) {              
					 add_option = "<option>"+mod[i]+"</option>";
                     $(".mod").append(add_option);
                }
             } 
        }); 
  });
  
  //filter

});

function findWord(word, str) {
  return RegExp('\\b'+ word +'\\b').test(str)
}

function urlExists(url, cb) {
    jQuery.ajax({
        url: url,
        dataType: 'text',
        type: 'GET',
        complete: function (xhr) {
            if (typeof cb === 'function')
                cb.apply(this, [xhr.status]);
        }
    });
}


</script>

<script>
function sendTyreSize (){
        e.preventDefault();
		let widthId = $(".width").val(),
		width = $('.width option:selected').text(),
		heightId = $(".height").val(),
		height = $('.height option:selected').text(),
		diametrId = $(".diametr").val(),
		diametr = $('.diametr option:selected').text(),
		seasonId = $(".season").val();
		let season = $('.season option:selected').text(),
		brandId = $(".brand").val(),
		brand = $('.brand option:selected').text();
        

}

function sendDiskSize() {
		let url= "";
		let diametrDisk = $('.diametrDisk option:selected').text(),
		diametrDiskValue = $(".diametrDisk").val(),
		widthDisk = $('.widthDisk option:selected').text(),
		widthDiskValue = $(".widthDisk").val(),
		pcdDisk = $('.pcdDisk option:selected').text(),
		pcdDiskValue = $(".pcdDisk").val(),
        diaDisk = $('.diaDisk option:selected').text(),
		diaDiskValue = $(".diaDisk").val(),
		etDisk = $('.etDisk option:selected').text();
		etDiskValue = $(".etDisk").val(),
		etDisk = etDisk.toLowerCase();
		diaDisk = diaDisk.toLowerCase();
		if (!diametrDisk.length && diametrDiskValue !=0){
			url += "diametr/"+diametrDisk;
		} else if (!widthDisk.length && widthDiskValue !=0){
			url+= "shirina-diska/"+widthDisk;
		} else if(!pcdDisk.length){
			url+= "pcd-diska/"+pcdDisk;
		} else if (!etDisk.length){
			url+= "et-diska/"+etDisk;
		} else if(!diaDisk.length){
			url+= "dia-diska/"+widthDisk;
		}
		console.log(url);
		 let urlik= window.location.origin + '/diski/'+ url;
//return url;
}


</script>




</div>
<!-- диски-->
<div class="filter__item item inactive item-disk">
<div class="filter__type tabs"><a class="active" data-tab=".item-size">Подбор по размеру</a> <a data-tab=".item-auto">Подбор по авто</a></div>
<div class="filter__fields item item-size">
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /><select class="diametrDisk"><option value="0">диаметр</option>
<?php foreach ($disk_diametrs as $disk_diametr) { ?>
<option><?php echo $disk_diametr; ?></option>
<?php } ?>
</select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select class="widthDisk"><option value="0">ширина</option>
<?php foreach ($disc_widths as $disc_width) { ?>
<option><?php echo $disc_width; ?></option>
<?php } ?>
</select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select class="pcdDisk"><option value="0">PCD</option>
<?php foreach ($disc_pcds as $disc_pcd) { ?>
<option><?php echo $disc_pcd; ?></option>
<?php } ?>
</select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select class="diaDisk"><option value="0">DIA</option>
<?php foreach ($disc_dias as $disc_dia) { ?>
<option><?php echo $disc_dia; ?></option>
<?php } ?>
</select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select class="etDisk"><option value="0">ET</option>
<?php foreach ($disc_ets as $disc_et) { ?>
<option><?php echo $disc_et; ?></option>
<?php } ?>
</select></div>
</div>

<div class="filter__fields item inactive item-auto">
<div class="filter__select select brandAuto"><img alt="" src="img/filter-arrow.svg" />
<select>
<option value="0">производитель</option> 
<?php foreach ($auto_brands as $auto_brand) { ?>

<option><?php echo $auto_brand; ?></option>
<?php } ?>

</select>
</div>
<div class="filter__select select modelBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="model"><option value="0">модель</option>
</select>
</div>
<div class="filter__select select yearBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="year"><option value="0">год</option>
</select>
</div>
<div class="filter__select select modBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="mod"><option value="0">модификация</option>
</select>
</div>
</div>
</div>

<!-- Аккумулятор-->
<div class="filter__item item inactive item-battery">
<div class="filter__type tabs"><a class="active" data-tab=".item-size">Подбор по размеру</a></div>
<div class="filter__fields item item-size">
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select><option value="0">емкость (Ah)</option></select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select><option value="0">бренд</option></select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select><option value="0">пусковой ток, А</option></select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select><option value="0">тип АКБ</option></select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select><option value="0">полярность</option></select></div>
<div class="filter__select select"><img alt="" src="img/filter-arrow.svg" /> <select><option value="0">ДхШхВ, мм</option></select></div>
</div>
</div>

<div class="filter__button"><button class="filterByBtn">Подобрать</button></div>
</div>