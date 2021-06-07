<div class="modal modaltype" style="display: none;">
<div class="modal__body">
<a class="modal__close">
<img src="img/cross.svg" alt=""></a>
<h3>По заданым параметрам товаров нет</h3><p class="modal__call-text">Воспользуйтесь расшириненным поиском</p>
</div></div>

<div class="main__filter filter">
<div class="filter__tabs tabs"><a class="active" data-tab=".item-tiers">Шины</a> <a data-tab=".item-disk">Диски</a> <a data-tab=".item-battery">Аккумуляторы</a></div>
<div class="filter__item item item-tiers">
<div class="filter__type tabs"><a class="active" data-tab=".item-size">Подбор по размеру</a> <a data-tab=".item-auto">Подбор по авто</a></div>

<div class="filter__fields item item-size">
<div class="filter__select select shinySelect widthList">
<img alt="" src="img/filter-arrow.svg" />
<select class="widthTyre">
<option value="0">ширина</option>
<?php natcasesort($tyre_widths); foreach ($tyre_widths as $tyre_width) {  if (strlen($tyre_width)>0){?>
<option><?php echo $tyre_width;} }?></option>
</select></div>
<div class="filter__select select shinySelect heightList"><img alt="" src="img/filter-arrow.svg" />
<select class="heightTyre">
<option value="0">высота</option>
<?php natcasesort($tyre_heights); foreach ($tyre_heights as $tyre_height) { if (strlen($tyre_height)>0){ ?>
<option><?php echo $tyre_height;}}?></option>
</select></div>
<div class="filter__select select shinySelect diameterList"><img alt="" src="img/filter-arrow.svg" />
<select class="diametrTyre"><option value="0">диаметр</option>
<?php natcasesort($tyre_diametrs); foreach ($tyre_diametrs as $tyre_diametr){ if (strlen($tyre_diametr)>0){ ?>
<option><?php echo $tyre_diametr;} }?></option>
</select></div>
<div class="filter__select select shinySelect seasonList"><img alt="" src="img/filter-arrow.svg" />
<select class="season"><option value="0">сезон</option>
<?php natcasesort($tyre_seasons); foreach ($tyre_seasons as $tyre_season) { if (strlen($tyre_season)>0){ ?>
<option><?php echo $tyre_season; }}?></option>
</select></div>
<div class="filter__select select shinySelect brandList"><img alt="" src="img/filter-arrow.svg" />
<select class="brandTyre"><option value="0">бренд</option>
<?php foreach ($tyre_brands as $tyre_brand) { if (strlen($tyre_brand)>0){
echo $tyre_brand; } } ?>
</select></div>
<div class="filter__select select shinySelect typeList"><img alt="" src="img/filter-arrow.svg" />
<select class="typeTyre"><option value="0">тип</option>
<?php natcasesort($tyre_seasons); foreach ($tyre_types as $tyre_type) { if (strlen($tyre_type)>0){?>
<option><?php echo $tyre_type;}} ?></option>
</select></div>
</div>

<!-- По авто -->
<div class="filter__fields item inactive item-auto">
<div class="filter__select select brandAuto"><img alt="" src="img/filter-arrow.svg" />
<select class="brandTyreAuto">
<option value="0">производитель</option>
<?php foreach ($auto_brands as $auto_brand) { ?>
<option><?php echo $auto_brand; }?></option>
</select>
</div>

<div class="filter__select select modelBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="model modelTyre"><option value="0">модель</option>
</select>
</div>
<div class="filter__select select yearBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="year  yearTyre"><option value="0">год</option>
</select>
</div>
<div class="filter__select select modBrand"><img alt="" src="img/filter-arrow.svg" />
<select class="mod modTyre"><option value="0">модификация</option>
</select>
</div>
<div class="filter__select select seasonBrand"><img alt="" src="img/filter-arrow.svg" /><select class="seasonTyre">
<option value="0">сезон</option>
<?php foreach ($tyre_seasons as $tyre_season) { if (strlen($tyre_season)>0){  ?>
<option><?php echo $tyre_season;}} ?></option>
</select>
</select>
</div>
</div>

</div>
<!-- диски-->
<div class="filter__item item inactive item-disk">
<div class="filter__type tabs"><a class="active" data-tab=".item-size">Подбор по размеру</a> <a data-tab=".item-auto">Подбор по авто</a></div>
<div class="filter__fields item item-size">
<div class="filter__select select diskiSelect diskDiameterList"><img alt="" src="img/filter-arrow.svg" />
<select class="diametrDisk"><option value="0">диаметр</option>
<?php natcasesort($disk_diametrs); foreach ($disk_diametrs as $disk_diametr) { if (strlen($disk_diametr)>0){?>
<option><?php echo $disk_diametr;}} ?></option>
</select></div>
<div class="filter__select select diskiSelect diskWidthList"><img alt="" src="img/filter-arrow.svg" />
<select class="widthDisk"><option value="0">ширина</option>
<?php natcasesort($disc_widths); foreach ($disc_widths as $disc_width) { if (strlen($disc_width)>0){?>
<option><?php echo $disc_width; } }?></option>
</select></div>
<div class="filter__select select diskiSelect diskPcdList"><img alt="" src="img/filter-arrow.svg" />
<select class="pcdDisk"><option value="0">PCD</option>
<?php natcasesort($disc_pcds); foreach ($disc_pcds as $disc_pcd) { if (strlen($disc_pcd)>0){?>
<option><?php echo $disc_pcd;} }?></option>
</select></div>
<div class="filter__select select diskiSelect diskDiaList"><img alt="" src="img/filter-arrow.svg" />
<select class="diaDisk"><option value="0">DIA</option>
<?php natcasesort($disc_dias);  foreach ($disc_dias as $disc_dia) { if (strlen($disc_dia)>0){?>
<option><?php echo $disc_dia;}} ?></option>
</select></div>
<div class="filter__select select diskiSelect diskEtList"><img alt="" src="img/filter-arrow.svg" />
<select class="etDisk"><option value="0">ET</option>
<?php natcasesort($disc_ets); foreach ($disc_ets as $disc_et) { if (strlen($disc_et)>0){?>
<option><?php echo $disc_et;} }?></option>
</select></div>
</div>

<div class="filter__fields item inactive item-auto autodisk">
<div class="filter__select select brandAutoDisk"><img alt="" src="img/filter-arrow.svg" />
<select class="diskBrand">
<option value="0">производитель</option>
<?php foreach ($auto_brands as $auto_brand) { ?>
<option><?php echo $auto_brand; }?></option>
</select>
</div>
<div class="filter__select select modelBrandDisk"><img alt="" src="img/filter-arrow.svg" />
<select class="model modelDisk"><option value="0">модель</option>
</select>
</div>
<div class="filter__select select yearBrandDisk"><img alt="" src="img/filter-arrow.svg" />
<select class="year yearDisk"><option value="0">год</option>
</select>
</div>
<div class="filter__select select modBrandDisk"><img alt="" src="img/filter-arrow.svg" />
<select class="mod modDisk"><option value="0">модификация</option>
</select>
</div>
</div>
</div>

<!-- Аккумулятор-->
<div class="filter__item item inactive item-battery">
<div class="filter__type tabs"><a class="active" data-tab=".item-size">Подбор по размеру</a></div>
<div class="filter__fields item item-size">
<div class="filter__select select accSelect capacityList"><img alt="" src="img/filter-arrow.svg" />
<select class="capacity"><option value="0">емкость (Ah)</option>
<?php natcasesort($acc_capacitys); foreach ($acc_capacitys as $acc_capacity){ if (strlen($acc_capacity)>0){ ?>
<option><?php echo $acc_capacity;}} ?></option>
</select></div>
<div class="filter__select select accSelect accBrandList"><img alt="" src="img/filter-arrow.svg" />
<select class="accBrand"><option value="0">бренд</option>
<?php foreach ($acc_brands as $acc_brand){ ?>
<?php echo $acc_brand;} ?>
</select></div>
<div class="filter__select select accSelect startList"><img alt="" src="img/filter-arrow.svg" />
<select class="startAcc"><option value="0">пусковой ток, А</option>
<?php natcasesort($acc_starts); foreach ($acc_starts as $acc_start){ if (strlen($acc_start)>0){ ?>
<option><?php echo $acc_start;}} ?></option>
</select></div>
<div class="filter__select select accSelect accTypeList"><img alt="" src="img/filter-arrow.svg" />
<select class="accType"><option value="0">тип АКБ</option>
<?php natcasesort($acc_types); foreach ($acc_types as $acc_type){ if (strlen($acc_type)>0){ ?>
<option><?php echo $acc_type; }} ?></option>
</select></div>
<div class="filter__select select accSelect polarityList"><img alt="" src="img/filter-arrow.svg" />
<select class="polarity"><option value="0">полярность</option>
<?php sort($acc_polaritys); foreach ($acc_polaritys as $acc_polarity){ if (strlen($acc_polarity)>0){ ?>
<option><?php echo $acc_polarity;}} ?></option>
</select></div>
<div class="filter__select select accSelect paramsList"><img alt="" src="img/filter-arrow.svg" />
<select class="params"><option value="0">ДхШхВ, мм</option>
<?php natcasesort($acc_params); foreach ($acc_params as $acc_param){  if (strlen($acc_param)>0){ ?>
<option><?php echo $acc_param;} }?></option>
</select></div>
</div>
</div>

<div class="filter__button"><button class="filterByBtn">Подобрать <?php model ?></button></div>
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
	//console.log(select_tabs);
	//console.log(select_types);
	if (select_types == 'item-size'){
		sendTyreSize();
} else {
	filterTyreByAuto();
}
}else if(select_tabs ==".item-disk") {
	var filterTabs = document.querySelector('.item-disk'),
	filterTabs = filterTabs.querySelector(".filter__type");
    var child = filterTabs.querySelector('.active');
   var filter__tabs = child.dataset.tab;
   var select_types = filter__tabs.substr(1);
	if (select_types == 'item-size'){
		sendDiskSize();
} else {
	filterDiskByAuto();
}
}else if(select_tabs ==".item-battery") {
	var filterTabs = document.querySelector('.item-battery'),
	filterTabs = filterTabs.querySelector(".filter__type");
    var child = filterTabs.querySelector('.active');
   var filter__tabs = child.dataset.tab;
   var select_types = filter__tabs.substr(1);
	if (select_types == 'item-size'){
		sendAkbSize();
}
}
});
});
</script>

<script>
$(function(){

 function update(){
  var x, i, j, l, ll, selElmnt, b, c;
x = document.getElementsByClassName("select");
l = x.length;
for (i = 0; i < l; i++) {
    selElmnt = x[i].getElementsByTagName("select")[0];
    ll = selElmnt.length;
    var b = x[i].getElementsByTagName('div')[1];
    for (j = 0; j < ll; j++) {
		var jj = Math.floor(j-0-1);
        var c = b.getElementsByTagName('div')[j];
        if (c) {
        c.addEventListener("click", (function(e) {
            var y, i, k, s, h, sl, yl;
            console.log(j);
            s = this.parentNode.parentNode.getElementsByTagName("select")[0];
            sl = s.length;
            h = this.parentNode.previousSibling;
            for (i = 0; i < sl; i++) {
                if (s.options[i].innerHTML == this.innerHTML) {
                    s.selectedIndex = i;
                    h.innerHTML = this.innerHTML;
                    y = this.parentNode.getElementsByClassName("same-as-selected");
                    yl = y.length;
                    for (k = 0; k < yl; k++) {
                        y[k].removeAttribute("class");
                    }
                    this.setAttribute("class", "same-as-selected");
                    break;
                }
            }
            h.click();
        }));
        }
    }
  }
}


 //
let widthList =  $(this).find(".widthList"),
heightList =  $(this).find(".heightList"),
diameterList =  $(this).find(".diameterList"),
seasoneList =  $(this).find(".seasonList"),
brandeList = $(this).find(".brandList"),
typeList = $(this).find(".typeList");

//var shinySelect = $(this).find(".shinySelect");
//shinySelect.on('click', function(e){
//setTimeout(function() {
//update();
//},2000);
//});

var shinySelect = $(this).find(".shinySelect");
shinySelect.on('click', function(e){
e.preventDefault();
let shiny = "",
divsy,
width = $(".widthTyre").next(".select__selected").text(),
height = $(".heightTyre").next(".select__selected").text(),
diameter = $(".diametrTyre").next(".select__selected").text(),
season = $(".season").next(".select__selected").text(),
brand = $(".brandTyre").next(".select__selected").text(),
brandId = $(".brandTyre").val(),
type = $(".typeTyre").next(".select__selected").text();
if (width != "ширина") {
	shiny += " width='"+width+"' AND ";
}  if  ( height != "высота"){
	shiny += "profile='"+ height+"' AND ";
}  if  (diameter != "диаметр"){
	shiny += "diameter='"+diameter+"' AND ";
}  if (season !="сезон"){
	shiny += "season='"+season+"' AND ";
}  if  (brand != "бренд"){
	shiny += "brand_id='"+brandId+"' AND ";
}  if  ( type!= "тип"){
	shiny += "type='"+type+"' AND ";
}
let sh = shiny.substr(-4);
if (sh == "AND "){
shiny = shiny.slice(0, -5);
}
console.log(shiny);
$.ajax({
url: 'index.php?route=extension/module/tyresfilter/getShiny',
             type: 'get',
             data: {'shiny': shiny},
            success: function(data) {
	let shinyFilter = JSON.parse(data);
	console.log(shinyFilter);
	let width1 = shinyFilter.width;
   var array = Object.keys(width1).map(item => width1[item]);
   let width =[...new Set(array)];
   width.sort();
   //
   let profile1 = shinyFilter.profile;
   var array = Object.keys(profile1).map(item => profile1[item]);
   let profile =[...new Set(array)];
   profile.sort();
//
let diameter1 = shinyFilter.diameter;
   var array = Object.keys(diameter1).map(item => diameter1[item]);
   let diameter =[...new Set(array)];
   diameter.sort();
   //
   let season1 = shinyFilter.season;
   var array = Object.keys(season1).map(item => season1[item]);
   let season =[...new Set(array)];
   season.sort();

   let brands = shinyFilter.brand;
   let brandIds = shinyFilter.brand_id;
   let brand =[...new Set(brands)];
   let brandId =[...new Set(brandIds)];

    let type1 = shinyFilter.type;
   var array = Object.keys(type1).map(item => type1[item]);
   let type =[...new Set(array)];
   type.sort();

           let selectList = document.getElementsByClassName("widthTyre");
			//selectList[0].innerHTML = '';
			//selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList1 = document.getElementsByClassName("heightTyre");
			//selectList1[0].innerHTML = '';
			//selectList1[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList2 = document.getElementsByClassName("diametrTyre");
			//selectList2[0].innerHTML = '';
			//selectList2[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList3 = document.getElementsByClassName("season");
			//selectList3[0].innerHTML = '';
			//selectList3[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList4 = document.getElementsByClassName("brandTyre");
		    //selectList4[0].innerHTML = '';
			//selectList4[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList5 = document.getElementsByClassName("typeTyre");
			//selectList5[0].innerHTML = '';
			//selectList5[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';


                /*

                for (var i = 0; i < width.length; i++) {
					if ((width[i]).length>0){
					 add_option = "<option>"+width[i]+"</option>";
					 $(".widthTyre").append(add_option);
					divsy = widthList.children(' .select__items');
					let add_div = "<div>"+width[i]+"</div>";
					divsy.append(add_div);
					}
				}
				for (var i = 0; i < profile.length; i++) {
					if ((profile[i]).length>0){
					 add_option = "<option>"+profile[i]+"</option>";
					 $(".heightTyre").append(add_option);
					divsy = heightList.children(' .select__items');
					add_div = "<div>"+profile[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < diameter.length; i++) {
					if ((diameter[i]).length>0){
					 add_option = "<option>"+diameter[i]+"</option>";
					 $(".diametrTyre").append(add_option);
					divsy = diameterList.children(' .select__items');
					add_div = "<div>"+diameter[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < season.length; i++) {
					if ((season[i]).length>0){
					 add_option = "<option>"+season[i]+"</option>";
					 $(".season").append(add_option);
					divsy = seasoneList.children(' .select__items');
					add_div = "<div>"+season[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < brand.length; i++) {
					if ((brand[i]).length>0){
					 add_option = "<option value="+brandId[i]+">"+brand[i]+"</option>"
					 $(".brandTyre").append(add_option);
					divsy = brandeList.children(' .select__items');
					add_div = "<div>"+brand[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < type.length; i++) {
					if ((type[i]).length>0){
					 add_option = "<option>"+type[i]+"</option>";
					 $(".typeTyre").append(add_option);
					divsy = typeList.children(' .select__items');
					add_div = "<div>"+type[i]+"</div>";
					divsy.append(add_div);
					}
                }


                */


               update();
             }
        });
  });

//disk filter
let divsy, diskWidthList =  $(this).find(".diskWidthList"),
diskDiameterList =  $(this).find(".diskDiameterList"),
diskPcdList =  $(this).find(".diskPcdList"),
diskDiaList = $(this).find(".diskDiaList"),
diskEtList = $(this).find(".diskEtList");
let diskiSelect = $(this).find(".diskiSelect");
diskiSelect.on('click', function(e){
e.preventDefault();
let diski = "",
width = $(".widthDisk").next(".select__selected").text(),
diameter = $(".diametrDisk").next(".select__selected").text(),
pcd = $(".pcdDisk").next(".select__selected").text(),
dia = $(".diaDisk").next(".select__selected").text(),
et = $(".etDisk").next(".select__selected").text();
if (width != "ширина") {
	diski += " width='"+width+"' AND ";
}  if  ( pcd != "PCD"){
	diski += "pcd='"+ pcd+"' AND ";
}  if  (diameter != "диаметр"){
	diski += "diameter='"+diameter+"' AND ";
}  if (dia !="DIA"){
	diski += "dia='"+dia+"' AND ";
}  if  (et != "ET"){
	diski += "et='"+et+"' AND ";
}
let sh = diski.substr(-4);
if (sh == "AND "){
diski = diski.slice(0, -5);
}
console.log(diski);
$.ajax({
url: 'index.php?route=extension/module/tyresfilter/getDiski',
             type: 'get',
             data: {'diski': diski},
            success: function(data) {
	let diskiFilter = JSON.parse(data);
	console.log(diskiFilter);
   let width1 = diskiFilter.width;
   var array = Object.keys(width1).map(item => width1[item]);
   let width =[...new Set(array)];
   width.sort();
//
let diameter1 = diskiFilter.diameter;
   var array = Object.keys(diameter1).map(item => diameter1[item]);
   let diameter =[...new Set(array)];
   diameter.sort();
    //
   let pcd1 = diskiFilter.pcd;
   var array = Object.keys(pcd1).map(item => pcd1[item]);
   let pcd =[...new Set(array)];
   pcd.sort((a, b) => a.localeCompare(b, navigator.languages[0] || navigator.language, {numeric: true, ignorePunctuation: true}));
   //
   let dia1 = diskiFilter.dia;
   var array = Object.keys(dia1).map(item => dia1[item]);
   let dia =[...new Set(array)];
   dia.sort();

    let et1 = diskiFilter.et;
   var array = Object.keys(et1).map(item => et1[item]);
   let et =[...new Set(array)];
   et.sort();

           let selectList = document.getElementsByClassName("widthDisk");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList1 = document.getElementsByClassName("diametrDisk");
			selectList1[0].innerHTML = '';
			selectList1[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList2 = document.getElementsByClassName("pcdDisk");
			selectList2[0].innerHTML = '';
			selectList2[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList3 = document.getElementsByClassName("diaDisk");
			selectList3[0].innerHTML = '';
			selectList3[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList5 = document.getElementsByClassName("etDisk");
			selectList5[0].innerHTML = '';
			selectList5[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';

                for (var i = 0; i < width.length; i++) {
					if ((width[i]).length>0){
					 add_option = "<option>"+width[i]+"</option>";
					 $(".widthDisk").append(add_option);
					divsy = diskWidthList.children(' .select__items');
					let add_div = "<div>"+width[i]+"</div>";
					divsy.append(add_div);
					}
				}
				for (var i = 0; i < diameter.length; i++) {
					if ((diameter[i]).length>0){
					 add_option = "<option>"+diameter[i]+"</option>";
					 $(".diametrDisk").append(add_option);
					divsy = diskDiameterList.children(' .select__items');
					add_div = "<div>"+diameter[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < pcd.length; i++) {
					if ((pcd[i]).length>0){
					 add_option = "<option>"+pcd[i]+"</option>";
					 $(".pcdDisk").append(add_option);
					divsy = diskPcdList.children(' .select__items');
					add_div = "<div>"+pcd[i]+"</div>";
					divsy.append(add_div);
					}
                }

				for (var i = 0; i < dia.length; i++) {
					if ((dia[i]).length>0){
					 add_option = "<option>"+dia[i]+"</option>";
					 $(".diaDisk").append(add_option);
					divsy = diskDiaList.children(' .select__items');
					add_div = "<div>"+dia[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < et.length; i++) {
					if ((et[i]).length>0){
					 add_option = "<option>"+et[i]+"</option>"
					 $(".etDisk").append(add_option);
					divsy = diskEtList.children(' .select__items');
					add_div = "<div>"+et[i]+"</div>";
					divsy.append(add_div);
					}
                }
               update();
             }
        });
  });

//accumulator
let capacityList =  $(this).find(".capacityList"),
accBrandList =  $(this).find(".accBrandList"),
startList =  $(this).find(".startList"),
accTypeList =  $(this).find(".accTypeList"),
polarityList = $(this).find(".polarityList"),
paramsList = $(this).find(".paramsList");
let accSelect = $(this).find(".accSelect");
accSelect.on('click', function(e){
e.preventDefault();
let acb = "",
divsy,

capacity =$(".capacity").next(".select__selected").text(),
brand = $(".accBrand").next(".select__selected").text(),
brandId = $(".accBrand").val(),
start = $(".startAcc").next(".select__selected").text(),
accType = $(".accType").next(".select__selected").text(),
polarity = $(".polarity").next(".select__selected").text(),
params = $(".params").next(".select__selected").text();

if (capacity != "емкость (Ah)") {
	acb += " capacity='"+capacity+"' AND ";
}  if  ( start != "пусковой ток, А"){
	acb += "start_current='"+ start+"' AND ";
}  if  (accType != "тип АКБ"){
	acb += "type='"+accType+"' AND ";
}  if (polarity !="полярность"){
	acb += "polarity='"+polarity+"' AND ";
}  if  (brand != "бренд"){
	acb += "brand_id='"+brandId+"' AND ";
}  if  ( params!= "ДхШхВ, мм"){
	acb += "params='"+params+"' AND ";
}
let sh = acb.substr(-4);
if (sh == "AND "){
acb = acb.slice(0, -5);
}

console.log(acb);
$.ajax({
url: 'index.php?route=extension/module/tyresfilter/getAccum',
             type: 'get',
             data: {'acc': acb},
            success: function(data) {
	let acbFilter = JSON.parse(data);
	console.log(acbFilter);
	let capacity1 = acbFilter.capacity;
   var array = Object.keys(capacity1).map(item => capacity1[item]);
   let capacity =[...new Set(array)];
   capacity.sort();
   //
   let start_current1 = acbFilter.start_current;
   var array = Object.keys(start_current1).map(item => start_current1[item]);
   let start_current =[...new Set(array)];
   start_current.sort((a, b) => a.localeCompare(b, navigator.languages[0] || navigator.language, {numeric: true, ignorePunctuation: true}));
//
let polarity1 = acbFilter.polarity;
   var array = Object.keys(polarity1).map(item => polarity1[item]);
   let polarity =[...new Set(array)];
   polarity.sort((a, b) => a.localeCompare(b, navigator.languages[0] || navigator.language, {numeric: true, ignorePunctuation: true}));
   //
   let params1 = acbFilter.params;
   var array = Object.keys(params1).map(item => params1[item]);
   let params =[...new Set(array)];
   params.sort();

   let brands = acbFilter.brand;
   let brandIds = acbFilter.brand_id;
   let brand =[...new Set(brands)];
   let brandId =[...new Set(brandIds)];

    let type1 = acbFilter.type;
   var array = Object.keys(type1).map(item => type1[item]);
   let type =[...new Set(array)];
   type.sort();

           let selectList = document.getElementsByClassName("capacity");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList1 = document.getElementsByClassName("startAcc");
			selectList1[0].innerHTML = '';
			selectList1[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList2 = document.getElementsByClassName("accType");
			selectList2[0].innerHTML = '';
			selectList2[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList3 = document.getElementsByClassName("polarity");
			selectList3[0].innerHTML = '';
			selectList3[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList4 = document.getElementsByClassName("accBrand");
		    selectList4[0].innerHTML = '';
			selectList4[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
			//
			let selectList5 = document.getElementsByClassName("params");
			selectList5[0].innerHTML = '';
			selectList5[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';

                for (var i = 0; i < start_current.length; i++) {
					if ((start_current[i]).length>0){
					 add_option = "<option>"+start_current[i]+"</option>";
					 $(".startAcc").append(add_option);
					divsy = startList.children(' .select__items');
					let add_div = "<div>"+start_current[i]+"</div>";
					divsy.append(add_div);
					}
				}

				for (var i = 0; i < capacity.length; i++) {
					if ((capacity[i]).length>0){
					 add_option = "<option>"+capacity[i]+"</option>";
					 $(".capacity").append(add_option);
					divsy = capacityList.children(' .select__items');
					add_div = "<div>"+capacity[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < polarity.length; i++) {
					if ((polarity[i]).length>0){
					 add_option = "<option>"+polarity[i]+"</option>";
					 $(".polarity").append(add_option);
					divsy = polarityList.children(' .select__items');
					add_div = "<div>"+polarity[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < params.length; i++) {
					if ((params[i]).length>0){
					 add_option = "<option>"+params[i]+"</option>";
					 $(".params").append(add_option);
					divsy = paramsList.children(' .select__items');
					add_div = "<div>"+params[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < brand.length; i++) {
					if ((brand[i]).length>0){
					 add_option = "<option value="+brandId[i]+">"+brand[i]+"</option>"
					 $(".accBrand").append(add_option);
					divsy = accBrandList.children(' .select__items');
					add_div = "<div>"+brand[i]+"</div>";
					divsy.append(add_div);
					}
                }
				for (var i = 0; i < type.length; i++) {
					if ((type[i]).length>0){
					 add_option = "<option>"+type[i]+"</option>";
					 $(".accType").append(add_option);
					divsy = accTypeList.children(' .select__items');
					add_div = "<div>"+type[i]+"</div>";
					divsy.append(add_div);
					}
                }
               update();
             }
        });
  });



var currentLocation = window.location.pathname,
pathToFilter;
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
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[0].innerHTML = 'модель';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
                for (var i = 0; i < model.length; i++) {
					 add_option = "<option>"+model[i]+"</option>";
					 $(".model").append(add_option);
					divs = modelList.children(' .select__items');
					let add_div = "<div>"+model[i]+"</div>";
					divs.append(add_div);
                }
               update();
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
			selectList = document.getElementsByClassName("year");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[0].innerHTML = 'год';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
                for (var i = 0; i < year.length; i++) {
					 add_option = "<option>"+year[i]+"</option>";
                     $(".year").append(add_option);
					 divs = yearList.children(' .select__items');
					let add_div = "<div>"+year[i]+"</div>";
					divs.append(add_div);
                }
				update();
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
			selectList = document.getElementsByClassName("mod");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[0].innerHTML = 'модификация';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
                for (var i = 0; i < mod.length; i++) {
					 add_option = "<option>"+mod[i]+"</option>";
                     $(".mod").append(add_option);
					  divs = modList.children(' .select__items');
					let add_div = "<div>"+mod[i]+"</div>";
					divs.append(add_div);
                }
				update();
             }
        });
  });


  ///Disk
let brandListDisk = $(this).find(".brandAutoDisk"),
modelListDisk =  $(this).find(".modelBrandDisk"),
yearListDisk =  $(this).find(".yearBrandDisk"),
modListDisk =  $(this).find(".modBrandDisk");
brandListDisk.on('click', function(e){
 e.preventDefault();
let brandDisk=brandListDisk.children(' .select__items').children(' .same-as-selected').text();
// model
$.ajax({
url: 'index.php?route=extension/module/tyresfilter/getModel',
             type: 'get',
             data: {'brand': brandDisk},
            success: function(data) {
			let model = JSON.parse(data),
			selectList = document.getElementsByClassName("modelDisk");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[0].innerHTML = 'модель';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
                for (var i = 0; i < model.length; i++) {
					 add_option = "<option>"+model[i]+"</option>";
					 $(".modelDisk").append(add_option);
					divs = modelListDisk.children(' .select__items');
					let add_div = "<div>"+model[i]+"</div>";
					divs.append(add_div);
                }
               update();
             }
        });
  });

  // year
 modelListDisk.on('click', function(e){
 e.preventDefault();
let modelDisk =modelListDisk.children(' .select__items').children(' .same-as-selected').text();
let brandDisk =brandListDisk.children(' .select__items').children(' .same-as-selected').text();
$.ajax({
url: 'index.php?route=extension/module/tyresfilter/getYear',
             type: 'get',
             data: {'brand': brandDisk, 'model': modelDisk},
            success: function(data) {
			let year = JSON.parse(data);
			selectList = document.getElementsByClassName("yearDisk");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[0].innerHTML = 'год';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
                for (var i = 0; i < year.length; i++) {
					 add_option = "<option>"+year[i]+"</option>";
                     $(".yearDisk").append(add_option);
					 divs = yearListDisk.children(' .select__items');
					let add_div = "<div>"+year[i]+"</div>";
					divs.append(add_div);
                }
				update();
             }
        });
  });

  // modification
 yearListDisk.on('click', function(e){
 e.preventDefault();
let modelDisk =modelListDisk.children(' .select__items').children(' .same-as-selected').text();
let brandDisk=brandListDisk.children(' .select__items').children(' .same-as-selected').text();
let yearDisk=yearListDisk.children(' .select__items').children(' .same-as-selected').text();
$.ajax({
url: 'index.php?route=extension/module/tyresfilter/getMod',
             type: 'get',
             data: {'brand': brandDisk, 'model': modelDisk,'year': yearDisk},
            success: function(data) {
			let mod = JSON.parse(data);
			selectList = document.getElementsByClassName("modDisk");
			selectList[0].innerHTML = '';
			selectList[0].parentNode.getElementsByTagName('div')[0].innerHTML = 'модификация';
			selectList[0].parentNode.getElementsByTagName('div')[1].innerHTML = '';
                for (var i = 0; i < mod.length; i++) {
					 add_option = "<option>"+mod[i]+"</option>";
                     $(".modDisk").append(add_option);
					  divs = modListDisk.children(' .select__items');
					let add_div = "<div>"+mod[i]+"</div>";
					divs.append(add_div);
                }
				update();
             }
        });
  });
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
 function filterTyreByAuto(){
let brand = $('.brandTyreAuto option:selected').text(),
model = $('.modelTyre option:selected').text(),
year = $('.yearTyre option:selected').text(),
mod = $('.modTyre option:selected').text(),
seasons = $('.seasonTyre option:selected').text();
localStorage.removeItem('brand');
localStorage.removeItem('model');
localStorage.removeItem('year');
localStorage.removeItem('mod');
localStorage.setItem("brand", brand);
localStorage.setItem("model", model);
localStorage.setItem("year", year);
localStorage.setItem("mod", mod);

$.ajax({
url: 'index.php?route=extension/module/ocfilter/getFiltered',
type: 'get',
data: {'brand': brand, 'model': model,'year': year, 'mod':mod},
success: function(data) {
let filtered = JSON.parse(data);
console.log(filtered['disk']);
filteredTyre= filtered['tyre'];
filteredDisk = filtered['disk'];
//shiny
let season="";
if (seasons !="сезон"){
if (seasons == "всесезонная"){season ="vsesezonnaja";}else if(seasons == "зимняя"){season ="zimnjaja";}else{season ="letnjaja";}}
var width = filteredTyre.toString().substring(0, 3),
profile = filteredTyre.toString().substring(4, 6),
diametr = filteredTyre.toString().substring(8,10);
if (season.length>0){
pathToFilter = 'diametr/'+diametr+'/shirina/'+width+'/profil/'+profile+'/sezon/'+season+'/';}
else{pathToFilter = 'diametr/'+diametr+'/shirina/'+width+'/profil/'+profile+'/';}
urlik= window.location.origin + '/shiny/'+ pathToFilter;
urlExists(urlik, function (status) {
if (status === 200) {
	var xhr = new XMLHttpRequest();
xhr.open('GET', urlik, true);
xhr.onload = function () {
  if (xhr.responseURL!= urlik){
	  console.log(urlik);
	  $('.modaltype').css('display', 'block');
  }else{
	  location.assign(urlik);
  }
};
xhr.send();
} else if (status === 404) {
	 $('.modaltype').css('display', 'block');
}
});

}
  });
}

 function filterDiskByAuto(){
let brand = $('.diskBrand option:selected').text();
let model = $('.modelDisk option:selected').text();
let year = $('.yearDisk option:selected').text();
let mod = $('.modDisk option:selected').text();
localStorage.removeItem('brand');
localStorage.removeItem('model');
localStorage.removeItem('year');
localStorage.removeItem('mod');
localStorage.setItem("brand", brand);
localStorage.setItem("model", model);
localStorage.setItem("year", year);
localStorage.setItem("mod", mod);
$.ajax({
url: 'index.php?route=extension/module/ocfilter/getFiltered',
type: 'get',
data: {'brand': brand, 'model': model,'year': year, 'mod':mod},
success: function(data) {
let filtered = JSON.parse(data);
filteredDisk = filtered['disk'];
var width = filteredDisk.indexOf('x'),
shirina = filteredDisk.substring(0, width);
shirina = shirina.trim();
var shirina = shirina.replace('.', '-');
var diametrD = filteredDisk.indexOf('ET');
diametrD = filteredDisk.substring(width+1, diametrD);
diametrD= diametrD.trim();
var et = filteredDisk.lastIndexOf('ET');
et = filteredDisk.substring(et);
et = et.toLowerCase();
pathToFilter = 'diametr/'+diametrD+'/shirina-diska/'+shirina+'/et-diska/'+et+'/';
urlik= window.location.origin+ '/diski/'+ pathToFilter;
urlExists(urlik, function (status) {
if (status === 200) {
	var xhr = new XMLHttpRequest();
xhr.open('GET', urlik, true);
xhr.onload = function () {
  if (xhr.responseURL!= urlik){
	  console.log(urlik);
	 $('.modaltype').css('display', 'block');
  }else{
	  location.assign(urlik);
  }
};
xhr.send();
} else if (status === 404) {
	 $('.modaltype').css('display', 'block');
}
});

}
  });
}
</script>


<script>
function sendTyreSize (){
let url = '',
width = $(".widthTyre").next(".select__selected").text();
width = width.replace(',', '-');
width = width.replace('.', '-');
let height = $(".heightTyre").next(".select__selected").text(),
diameter = $(".diametrTyre").next(".select__selected").text();
diameter = diameter.replace(',', '-');
diameter = diameter.replace('.', '-');
let season = $(".season").next(".select__selected").text(),
brand = $(".brandTyre").next(".select__selected").text(),
brandId = $(".brandTyre").val(),
type = $(".typeTyre").next(".select__selected").text();
if (season =="летняя"){ season= "letnjaja"; }
else if (season =="зимняя"){ season= "zimnjaja";
} else if(season =="всесезонная"){ season= "vsesezonnaja"; }
if  (brand != "бренд" && brandId!="0"){
	url += brandId+"/";}
if (width != "ширина") {
	url +="shirina/"+width + "/";
}  if  ( height != "высота"){
	url +="profil/"+height + "/";
}  if  (diameter != "диаметр"){
	url +="diametr/"+diameter + "/";
}  if (season !="сезон"){
	url +="sezon/"+season + "/";
}
if (type =="лековая"){
	type= "legkovaja";
}else if (type =="грузовая"){
	type= "gruzovaja";
} else if(type =="легкогрузовая"){
	type= "legkogruzovaja";
}else if(type =="сельхоз"){
	type= "selhoz";
}else if(type =="индустриальная"){
	type= "industrialnaja";
}
 if  ( type!= "тип"){
	url +="tip-shiny/"+type + "/";
}

let urlik= window.location.origin + '/shiny/'+ url;
		urlExists(urlik, function (status) {
if (status === 200) {
location.assign(urlik);
} else if (status === 404) {
	 $('.modaltype').css('display', 'block');
} else {
	 $('.modaltype').css('display', 'block');
}
});

}

function sendDiskSize() {
let url="" ;
let diametrDisk =$(".diametrDisk").next(".select__selected").text();
diametrDisk = diametrDisk.replace(',', '-');
diametrDisk = diametrDisk.replace('.', '-');
let widthDisk = $(".widthDisk").next(".select__selected").text();
widthDisk = widthDisk.replace(',', '-');
widthDisk = widthDisk.replace('.', '-');
let pcdDisk = $(".pcdDisk").next(".select__selected").text();
pcdDisk = pcdDisk.replace(',', '-');
pcdDisk = pcdDisk.replace('.', '-');
let diaDisk = $(".diaDisk").next(".select__selected").text();
diaDisk = diaDisk.replace(',', '-');
diaDisk = diaDisk.replace('.', '-');
etDisk = $(".etDisk").next(".select__selected").text();
if (diametrDisk  != "диаметр"){
	url += "diametr/"+diametrDisk+"/";}
if (widthDisk  != "ширина"){
	url +="shirina-diska/"+widthDisk + "/";}
if(pcdDisk  != "PCD"){
	url += "pcd-diska/"+pcdDisk + "/";}
if (etDisk  != "ET"){
etDisk = etDisk.toLowerCase(),
	url += "et-diska/"+etDisk + "/";}
if(diaDisk  != "DIA"){
diaDisk = diaDisk.toLowerCase();
url += "dia-diska/"+ diaDisk +"/";}
let urlik= window.location.origin + '/diski/'+ url;
	urlExists(urlik, function (status) {
if (status === 200) {
location.assign(urlik);
} else if (status === 404) {
	 $('.modaltype').css('display', 'block');
} else {
	 $('.modaltype').css('display', 'block');
}
});

}



function sendAkbSize(){
let url="" ;
let capacity =$(".capacity").next(".select__selected").text(),
brand = $(".accBrand").next(".select__selected").text(),
brandId = $(".accBrand").val(),
start = $(".startAcc").next(".select__selected").text(),
accType = $(".accType").next(".select__selected").text(),
polarity = $(".polarity").next(".select__selected").text(),
params = $(".params").next(".select__selected").text();
if  (brand != "бренд" && brandId !="0"){
url += brandId+"/";}
if (capacity != "емкость (Ah)") {
	capacity = capacity.replace(' ', '-');
	capacity = capacity.toLowerCase();
	capacity = capacity.replace('а', 'a');
	url +="emkost-akb/"+capacity + "/";
}  if  ( start != "пусковой ток, А"){
	start = start.toLowerCase();
	url +="puskovoj-tok-akb/"+start + "/";
}  if  (polarity != "полярность"){
	url +="poljarnost-akb/"+polarity + "/";
}  if (params !="ДхШхВ, мм"){
	var param = params.indexOf('x');
    let dlina = params.substring(0, param);
	let str = params.length;
	let par = params.slice(param+1, str);
	let p = par.indexOf('x');
	let shirina = par.substring(0, param);
	let vysota =  par.substring(param+1, str);
	vysota = vysota.replace('/', '-');
	url +="dlina-akb/"+dlina + "/";
	url +="shirina-akb/"+shirina + "/";
	url +="vysota-akb/"+vysota + "/";
}

let urlik= window.location.origin + '/akkumulyatory/'+ url;
	urlExists(urlik, function (status) {
if (status === 200) {
location.assign(urlik);
} else if (status === 404) {
	 $('.modaltype').css('display', 'block');
} else {
	 $('.modaltype').css('display', 'block');
}
});

}

</script>