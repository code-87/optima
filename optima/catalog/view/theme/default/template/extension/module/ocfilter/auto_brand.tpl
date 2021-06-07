<div class="sidefilter__select brandAuto select"><img alt="" src="img/filter-arrow.svg" /> <select class= "brand__auto">
<option value="0">производитель</option>
<?php foreach ($auto_brands as $auto_brand) { ?>

<option><?php echo $auto_brand; ?></option>
<?php } ?>

</select>
</div>

<div class="sidefilter__select select modelBrand"><img alt="" src="img/filter-arrow.svg" /> <select class="model model__auto">
<option value="0">модель</option>
</select>
</div>

<div class="sidefilter__select select yearBrand"><img alt="" src="img/filter-arrow.svg" /> <select class="year year__auto">
<option value="0">год</option>
</select>
</div>

<div class="sidefilter__select select modBrand"><img alt="" src="img/filter-arrow.svg" /> <select class="mod mod__auto">
<option value="0">модификация</option>
</select>
</div>

<div class="sidefilter__select select seasonBrand"><img alt="" src="img/filter-arrow.svg" /> <select>
<option value="0">сезон</option>
<option>всесезонная</option>
<option>зимняя</option>
<option>летняя</option>
</select>
</div>
<div class="filter__button"><button class="filterByAuto">Подобрать</button></div>
<div class="result" style="display:none">Нет товара по данному запросу</div>


<script>
$(function(){

 function update(){
  var x, i, j, l, ll, selElmnt, a, b, c;
x = document.getElementsByClassName("select");
l = x.length;
for (i = 0; i < l; i++) {
    selElmnt = x[i].getElementsByTagName("select")[0];
    ll = selElmnt.length;
    var a = x[i].getElementsByTagName('div')[0];
    var b = x[i].getElementsByTagName('div')[1];
    for (j = 1; j < ll; j++) {
        var jj = Math.floor(j-0-1);
        var c = b.getElementsByTagName('div')[jj];
        c.addEventListener("click", (function(e) {
            var y, i, k, s, h, sl, yl;
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


//if exist storage
let isBrandAuto = localStorage.getItem("brand"),
isModelAuto = localStorage.getItem("model"),
isYearAuto = localStorage.getItem("year"),
isModAuto = localStorage.getItem("mod");
if(isModelAuto && isBrandAuto && isYearAuto && isModAuto){
	$.ajax({
url: 'index.php?route=extension/module/ocfilter/getModel',
             type: 'get',
             data: {'brand': isBrandAuto},
            success: function(data) {
			let model = JSON.parse(data),
			selectList = document.getElementsByClassName("model");
                for (var i = 0; i < model.length; i++) {
					 add_option = "<option>"+model[i]+"</option>";
					 $(".model__auto").append(add_option);
					let divs = modelList.children(' .select__items');
					add_div = "<div>"+model[i]+"</div>";
					divs.append(add_div);
                }
             }
        });
	$.ajax({
url: 'index.php?route=extension/module/ocfilter/getYear',
             type: 'get',
             data: {'brand': isBrandAuto, 'model': isModelAuto},
            success: function(data) {
			let year = JSON.parse(data);
			selectList = document.getElementsByClassName("year");
                for (var i = 0; i < year.length; i++) {
					 add_option = "<option>"+year[i]+"</option>";
                     $(".year__auto").append(add_option);
					 let divs = yearList.children(' .select__items');
					add_div = "<div>"+year[i]+"</div>";
					divs.append(add_div);
                }
             }
        });
	$.ajax({
url: 'index.php?route=extension/module/ocfilter/getMod',
             type: 'get',
             data: {'brand': isBrandAuto, 'model': isModelAuto,'year': isYearAuto},
            success: function(data) {
			let mod = JSON.parse(data);
			selectList = document.getElementsByClassName("mod");
                for (var i = 0; i < mod.length; i++) {
					 add_option = "<option>"+mod[i]+"</option>";
                     $(".mod__auto").append(add_option);
					 let divs = modList.children(' .select__items');
					add_div = "<div>"+mod[i]+"</div>";
					divs.append(add_div);
                }
             }
        });
}
//
brandList.on('click', function(e){
 e.preventDefault();
let brand=brandList.children(' .select__selected').text();
if(isModelAuto && isBrandAuto && isYearAuto && isModAuto){
localStorage.removeItem('brand');
localStorage.removeItem('model');
localStorage.removeItem('year');
localStorage.removeItem('mod');}
// model
$.ajax({
url: 'index.php?route=extension/module/ocfilter/getModel',
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
					add_div = "<div>"+model[i]+"</div>";
					divs.append(add_div);

                }
                 update();
                 localStorage.setItem("brand", brand);
             }
        });
  });

  // year
 modelList.on('click', function(e){
 e.preventDefault();
let model =modelList.children(' .select__selected').text();
let brand=brandList.children(' .select__selected').text();
$.ajax({
url: 'index.php?route=extension/module/ocfilter/getYear',
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
					add_div = "<div>"+year[i]+"</div>";
					divs.append(add_div);
                }
				update();
				localStorage.setItem("model", model);
             }
        });
  });

  // modification
 yearList.on('click', function(e){
 e.preventDefault();
let model =modelList.children(' .select__selected').text();
let brand=brandList.children(' .select__selected').text();
let year=yearList.children(' .select__selected').text();
$.ajax({
url: 'index.php?route=extension/module/ocfilter/getMod',
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
					add_div = "<div>"+mod[i]+"</div>";
					divs.append(add_div);
                }
				update();
				localStorage.setItem("year", year);
             }
        });
  });

  //filter
filterByAuto.on('click', function(e){
	 e.preventDefault();
let  model = modelList.children(' .select__selected').text(),
brand= brandList.children(' .select__selected').text(),
year= yearList.children(' .select__selected').text(),
mod = modList.children(' .select__selected').text(),
season = seasonList.children(' .select__selected').text();
localStorage.setItem("mod", mod);
if (season == "всесезонная"){season ="vsesezonnaja";}else if(season == "зимняя"){season ="zimnjaja";}else{season ="letnjaja";}
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
var width = filteredTyre.substring(0, 3),
profile = filteredTyre.substring(4, 6),
diametr = filteredTyre.substring(8,10);
pathToFilter = 'diametr/'+diametr+'/shirina/'+width+'/profil/'+profile+'/sezon/'+season+'/';
//alert(currentLocation);
//if (currentLocation == '/shiny/'){
if (currentLocation.indexOf('/shiny/')>=0){
urlik= window.location.origin + '/shiny/'+ pathToFilter;
urlExists(urlik, function (status) {
if (status === 200) {
 window.location.href = urlik;
} else if (status === 404) {
document.getElementsByClassName("result")[0].style.display = 'block';
} else{
document.getElementsByClassName("result")[0].style.display = 'block';
}
});
}

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
console.log(et);
pathToFilter = 'diametr/'+diametrD+'/shirina-diska/'+shirina+'/et-diska/'+et+'/';
//if (currentLocation == '/diski/'){
if (currentLocation.indexOf('/diski/')>=0){
urlik= window.location.origin+ '/diski/'+ pathToFilter;
urlExists(urlik, function (status) {
if (status === 200) {
 window.location.href = urlik;
} else if (status === 404) {
document.getElementsByClassName("result")[0].style.display = 'block';
} else {
 document.getElementsByClassName("result")[0].style.display = 'block';
}
});
}
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






















