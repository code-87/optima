<?php echo $header; ?>
<div class="content content-viewed content-lk"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js"></script>
<script type="text/javascript">
  $('.content-viewed').load('index.php?route=product/ochelp_viewed/getProducts', {limit: <?php echo $limit; ?>, page: <?php echo $page; ?>},
  
  function(res) {
  var interestSwiper = new Swiper ('.interesting .swiper-container', {
        // Optional parameters
        direction: 'horizontal',
        slidesPerView: 2,
        loop: true,
        // Navigation arrows
        navigation: {
            nextEl: '.interesting__next',
            prevEl: '.interesting__prev',
        },
        breakpoints: {
            768: {
                slidesPerView: 4,
            },
            1366: {
                slidesPerView: 6,
            },
            1851: {
                slidesPerView: 8,
            },
        }
    }
);
  });
</script>
<?php echo $footer; ?>