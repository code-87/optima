/*! project-name v0.0.1 | (c) 2020 YOUR NAME | MIT License | http://link-to-your-git-repo.com */
$('.header__viewed, .header__your').hover(
    (function(){$(this).find('.header__navigation').show()}),
    (function(){$(this).find('.header__navigation').hide()})
);
$( ".nav-mobile__eye" ).click((function() {
    $(this).parent().parent().find('.nav-mobile__eye-nav').show();
}));
$( ".order__summ button" ).click((function() {
    $('.order__info').toggle();
}));
$( ".nav-mobile__lk" ).click((function() {
    $(this).parent().parent().find('.nav-mobile__lk-nav').show();
}));
$( ".nav-mobile__burger" ).click((function() {
    $(this).parent().parent().find('.nav-mobile__menu').show();
}));
$( ".nav__burger" ).click((function() {
    $(this).parent().find('.nav-mobile__menu').show();
}));
//$( ".reviews__text .reviews__button" ).click((function() {
//    $(this).parent().parent().find('.reviews__form').show();
//    $(this).parent().hide();
//}));



$(document).ready(function(){
let brandList = $(this).find(".brand__auto"),
modelList =  $(this).find(".model__auto"),
yearList =  $(this).find(".year__auto"),
modList =  $(this).find(".mod__auto");
let brand=brandList.next(' .select__selected'),
model =modelList.next(' .select__selected'),
year=yearList.next(' .select__selected'),
mod=modList.next(' .select__selected');
let isBrandAuto = localStorage.getItem("brand"),
isModelAuto = localStorage.getItem("model"),
isYearAuto = localStorage.getItem("year"),
isModAuto = localStorage.getItem("mod");
if(isBrandAuto){
$('.brand__auto option[value="0"]').remove();
brand.html(isBrandAuto);
}
if(isModelAuto){
$('.model__auto option[value="0"]').remove();
model.html(isModelAuto);
}
if(isYearAuto){
$('.year__auto option[value="0"]').remove();
year.html(isYearAuto);
}
if(isModAuto){
$('.mod__auto option[value="0"]').remove();
mod.html(isModAuto);
}
});














$(document).ready(function() {

    $(".reviews__button").click(function() {
        $(".reviews__text").css({"display":"none"});
        $(".reviews__form").css({"display":"block"});
    });

});

$( ".reviews__more" ).click((function() {
    $(this).parent().find('.inactive').removeClass('inactive');
    $(this).hide();
}));
$( ".product__text-more a" ).click((function() {
    $(this).parent().parent().find('.product__text-holder').css('max-height','initial');
    $(this).parent().hide();
}));
//$( ".call-cart" ).click((function() {
//    $('.modal-cart').show();
//}));
$( ".call-phone" ).click((function() {
$('.modal-call').show();
}));
$( ".modal__close" ).click((function() {
   $('.modal').hide();
}));
$( ".tabs a" ).click((function() {
    $(this).parent().find('a').removeClass('active');
    $(this).addClass('active');
    $(this).parent().parent().find('> .item').addClass('inactive');
    $(this).parent().parent().find($(this).attr('data-tab')).removeClass('inactive');
}));

jQuery((function($){
    $(document).mouseup((function (e){ // событие клика по веб-документу
        var div = $(".nav-mobile__eye-nav, .nav-mobile__lk-nav, .nav-mobile__menu"); // тут указываем ID элемента
        if (!div.is(e.target) // если клик был не по нашему блоку
            && div.has(e.target).length === 0) { // и не по его дочерним элементам
            div.hide(); // скрываем его
        }
    }));
}));
/*Custom select*/
var x, i, j, l, ll, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("select");
l = x.length;
for (i = 0; i < l; i++) {
    selElmnt = x[i].getElementsByTagName("select")[0];
    ll = selElmnt.length;
    /*for each element, create a new DIV that will act as the selected item:*/
    a = document.createElement("DIV");
    a.setAttribute("class", "select__selected");
    a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
    x[i].appendChild(a);
    /*for each element, create a new DIV that will contain the option list:*/
    b = document.createElement("DIV");
    b.setAttribute("class", "select__items select__hide");
    for (j = 1; j < ll; j++) {
        /*for each option in the original select element,
        create a new DIV that will act as an option item:*/
        c = document.createElement("DIV");
        c.innerHTML = selElmnt.options[j].innerHTML;
        c.addEventListener("click", (function(e) {
            /*when an item is clicked, update the original select box,
            and the selected item:*/
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
        b.appendChild(c);
    }
    x[i].appendChild(b);
    a.addEventListener("click", (function(e) {
        /*when the select box is clicked, close any other select boxes,
        and open/close the current select box:*/
        e.stopPropagation();
        closeAllSelect(this);
        this.nextSibling.classList.toggle("select__hide");
    }));
}
function closeAllSelect(elmnt) {
    /*a function that will close all select boxes in the document,
    except the current select box:*/
    var x, y, i, xl, yl, arrNo = [];
    x = document.getElementsByClassName("select__items");
    y = document.getElementsByClassName("select__selected");
    xl = x.length;
    yl = y.length;
    for (i = 0; i < yl; i++) {
        if (elmnt == y[i]) {
            arrNo.push(i)
        } else {
            y[i].classList.remove("select-arrow-active");
        }
    }
    for (i = 0; i < xl; i++) {
        if (arrNo.indexOf(i)) {
            x[i].classList.add("select__hide");
        }
    }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
//<![CDATA[
function doLiveSearch( ev, keywords ) {
	if( ev.keyCode == 38 || ev.keyCode == 40 ) {
		return false;
	}
	$('#autosearch_search_results').remove();
	updown = -1;
	if( keywords == '' || keywords.length < 2 ) {
		return false;
	}
	keywords = encodeURI(keywords);
	$.ajax({url: $('base').attr('href') + 'index.php?route=extension/module/autosearch/ajax_asr&keyword=' + keywords, dataType: 'json', success: function(result) {
	if( (result['pro']&&result['pro'].length) || (result['cat']&&result['cat'].length) || (result['man']&&result['man'].length) ) {
	var eDiv = document.createElement('div');
	eDiv.id = 'autosearch_search_results';
			var eListElem;
			var eLink;
			var eImage;

	cat = result['cat'];
	man = result['man'];
	set = result['set'];
	result = result['pro'];
	if (cat.length > 0) {

			eListElem = document.createElement('div');
			eListElem.className = 'asr';
				var textNode = document.createTextNode(set['catname']);
			eListElem.appendChild(textNode);
			eDiv.appendChild(eListElem);
var eList = document.createElement('ul');
		for( var c in cat ) {
			eListElem = document.createElement('li');
			eLink = document.createElement('a');
	var el_span = document.createElement('name');
    var textNode = document.createTextNode(cat[c].name);
    eLink.appendChild(el_span);
    el_span.appendChild(textNode);
				if( typeof(cat[c].href) != 'undefined' ) {
					eLink.href = cat[c].href;
				}
				else {
					eLink.href = $('base').attr('href') + 'index.php?route=product/category&path=' + cat[c].product_id;
				}
			eListElem.appendChild(eLink);
			eList.appendChild(eListElem);
		}
	eDiv.appendChild(eList);
	}
	if (man.length > 0) {

			var eListElemc = document.createElement('div');
			eListElemc.className = 'asr';
				var textNode = document.createTextNode(set['manname']);
			eListElemc.appendChild(textNode);
			eDiv.appendChild(eListElemc);
var eList = document.createElement('ul');
		for( var m in man ) {
			eListElem = document.createElement('li');
			eLink = document.createElement('a');
	var el_span = document.createElement('name');
    var textNode = document.createTextNode(man[m].name);
    eLink.appendChild(el_span);
    el_span.appendChild(textNode);
				if( typeof(man[m].href) != 'undefined' ) {
					eLink.href = man[m].href;
				}
				else {
					eLink.href = $('base').attr('href') + 'index.php?route=product/manufacturer/info&manufacturer_id=' + man[m].product_id;
				}
			eListElem.appendChild(eLink);
			eList.appendChild(eListElem);
		}
	eDiv.appendChild(eList);
	}

	if( result.length > 0 ) {

		if( cat.length > 0 || man.length > 0 ) {
			eListElem = document.createElement('div');
			eListElem.className = 'asr';
			var textNode = document.createTextNode(set['proname']);
			eListElem.appendChild(textNode);
			eDiv.appendChild(eListElem);
		}
var eList = document.createElement('ul');
			for( var i in result ) {
				eListElem = document.createElement('li');
				eLink = document.createElement('a');
			if( (result[i].thumb) != '' )
			{
				var eIm = document.createElement('div');
				eIm.className = 'divasr';
				eImage = document.createElement('img');
				eImage.src = result[i].thumb;
				eIm.appendChild(eImage);
				eLink.appendChild(eIm);

			}

var eDim = document.createElement('div');
eDim.className = 'div2asr';
var el_span = document.createElement('name');
    var textNode = document.createTextNode(result[i].name);
    eDim.appendChild(el_span);
    el_span.appendChild(textNode);
	eLink.appendChild(eDim);
			if( (result[i].model) != '' )
			{
var el_span = document.createElement('model');
    var textNode = document.createTextNode(result[i].model);
    eDim.appendChild(el_span);
    el_span.appendChild(textNode);
	eLink.appendChild(eDim);
			}
				if( typeof(result[i].href) != 'undefined' ) {
					eLink.href = result[i].href;
				}
				else {
					eLink.href = $('base').attr('href') + 'index.php?route=product/product&product_id=' + result[i].product_id + '&keyword=' + keywords;
				}
				eListElem.appendChild(eLink);
			if( (result[i].price) != '' )
			{
var br = document.createElement("br");
eDim.appendChild(br);

	if( (result[i].special) != '' )
		{
var el_span = document.createElement('special-price');
    var textNode = document.createTextNode(result[i].special);
    eDim.appendChild(el_span);
    el_span.appendChild(textNode);
	eLink.appendChild(eDim);
		}

var el_span = document.createElement('price');
    var textNode = document.createTextNode(result[i].price);
    eDim.appendChild(el_span);
    el_span.appendChild(textNode);
	eLink.appendChild(eDim);
			}

			if( (result[i].stock) != '' )
			{

var br = document.createElement("br");
eDim.appendChild(br);
eDim.appendChild( document.createTextNode(result[i].stock) );
eLink.appendChild(eDim);
			}
				eList.appendChild(eListElem);
			}
			if( $('#autosearch_search_results').length > 0 ) {
				$('#autosearch_search_results').remove();
			}
			if( set['vallname'] != '' )
			{
			eListElem = document.createElement('li');
			eLink = document.createElement('a');
				var el_span = document.createElement('viewall');
				var textNode = document.createTextNode(set['vallname']);
				el_span.appendChild(textNode);
				eLink.appendChild(el_span);

				eLink.href = $('base').attr('href') + 'index.php?route=product/search&search=' + keywords;
			eListElem.appendChild(eLink);
			eList.appendChild(eListElem);
			}
		eDiv.appendChild(eList);
		}
$('.top__search').append(eDiv);
$('#autosearch_search_results').css('maxHeight', set['size'] + 'px');
		}
	}});

	return true;
}
function upDownEvent( ev ) {
	var elem = document.getElementById('autosearch_search_results');
	var fkey = $('.top__search').find('[name=search]').first();
	if( elem ) {
		var length = elem.childNodes.length - 1;
		if( updown != -1 && typeof(elem.childNodes[updown]) != 'undefined' ) {
			$(elem.childNodes[updown]).removeClass('highlighted');
		}
		// Up
		if( ev.keyCode == 38 ) {
			updown = ( updown > 0 ) ? --updown : updown;
		}
		else if( ev.keyCode == 40 ) {
			updown = ( updown < length ) ? ++updown : updown;
		}
		if( updown >= 0 && updown <= length ) {
			$(elem.childNodes[updown]).addClass('highlighted');

			var text = elem.childNodes[updown].childNodes[0].text;
			if( typeof(text) == 'undefined' ) {
				text = elem.childNodes[updown].childNodes[0].innerText;
			}
		}
	}
	return false;
}
var updown = -1;
$(document).ready(function(){
	$('.top__search').find('[name=search]').attr('autocomplete', 'off');

	$('.top__search').find('[name=search]').first().keyup(function(ev){
		doLiveSearch(ev, this.value);
	}).focus(function(ev){
		doLiveSearch(ev, this.value);
	}).keydown(function(ev){
		//upDownEvent( ev );
	}).blur(function(){
		window.setTimeout("$('#autosearch_search_results').remove();updown=0;", 1500);
	});
	$(document).bind('keydown', function(ev) {
		try {
			if( ev.keyCode == 13 && $('.highlighted').length > 0 ) {
				document.location.href = $('.highlighted').find('a').first().attr('href');
			}
		}
		catch(e) {}
	});
});
//]]>

	/* Search */
/*	$('.top__search input[name=\'search\']').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header .top__search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('.top__search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header .top__search input[name=\'search\']').trigger('click');
		}
	}); */

//PRODUCT GRID

	$('.grid-view').click(function() {
		$('.catalog__item').addClass('hide');
		$('.catalog__row').removeClass('hide');
		$('.list-view').removeClass('active');
		$('.grid-view').addClass('active');
		localStorage.setItem('display', 'grid');
	});

//PRODUCT LIST

	$('.list-view').click(function() {
		$('.catalog__row').addClass('hide');
		$('.catalog__item').removeClass('hide');
		$('.grid-view').removeClass('active');
		$('.list-view').addClass('active');
		localStorage.setItem('display', 'list');
	});

	if (localStorage.getItem('display') == 'grid') {
		$('.grid-view').trigger('click');
		$('.grid-view').addClass('active');
	} else {
		$('.list-view').trigger('click');
		$('.list-view').addClass('active');
	}

	$( ".tabs a.first" ).click((function() {
    $(this).parent().parent().find('> .item').addClass('inactive');
    $(this).parent().parent().find($(this).attr('data-tab')).removeClass('inactive');
    $( "a.first" ).addClass('active');
    $( "a.second" ).removeClass('active');
        sessionStorage.setItem('vision', 'fview');
    }));

	$( ".tabs a.second" ).click((function() {
    $(this).parent().parent().find('> .item').addClass('inactive');
    $(this).parent().parent().find($(this).attr('data-tab')).removeClass('inactive');
    $( "a.first" ).removeClass('active');
	$( "a.second" ).addClass('active');
        sessionStorage.setItem('vision', 'sview');
    }));

	if (sessionStorage.getItem('vision') == 'sview') {
		$( "a.first" ).removeClass('active');
		$( "a.second" ).addClass('active');
	$(".item-size").removeClass('inactive');
    $(".item-auto").addClass('inactive');
	} else {
	$( "a.first" ).addClass('active');
	$( "a.second" ).removeClass('active');
	$(this).parent().parent().find('> .item').addClass('inactive');
   $(this).parent().parent().find($(this).attr('data-tab')).removeClass('inactive');
	}
	//

