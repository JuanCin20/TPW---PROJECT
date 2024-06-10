<?php
include 'Global/Configuration.php';
include 'Global/Connection.php';
include 'Cart.php';
include 'Templates/Header_First.php';
?>

<!-- Slider main container -->
<div class="swiper anuncio">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper anuncio_wrapper">
        <!-- Slides -->
        <a href="https://www.nvidia.com/es-la/geforce/graphics-cards/40-series/" class="swiper-slide" style="align-self: center;" width="100%"><img class="anuncio_img" src="https://cyccomputer.pe/modules/labslideshow/images/eac45d97e4efbc2e44f52c9fea6856427360ac2d_BANNERMSISUPERSERIE40.png"></a>
        <a href="https://wilsoncompuplaza.com/" class="swiper-slide" style="align-self: center;" width="100%"><img class="anuncio_img" src="https://apicompuplaza.compuplaza.net.pe/public/uploads/2024-04-18/LoL02sEFVWUc0qfuNAPfuwfxBgGCVdwaUknHDwKx.webp"></a>
        <a href="https://www.asus.com/campaign/tuf-gaming/global/" class="swiper-slide" style="align-self: center;" width="100%"><img class="anuncio_img" src="https://apicompuplaza.compuplaza.net.pe/public/uploads/2024-05-07/RGihHMPqiaUh1mjVsNivPNgsA9pUnaBgBmyw1Fzq.webp"></a>
    </div>
    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
</div>

<section id="US" class="nosotros">
    <div class="content nosotros">
        <h2>Bienvenidos a DigitalTech</h2>
        <p>En DigitalTech podrás comprar en línea de forma fácil y segura la mayor variedad de componentes tecnológicos
            dentro de las categorías: Procesadores, Memoria RAM, y mucho más.</p>
        <p>Somos una empresa dedicada a proporcionar componentes de computadora de alta calidad a nuestros cliente,
            con un completo servicio de garantía de compra.</p>
        <p>Nuestra misión es brindar tecnología de vanguardia y un servicio excepcional para impulsar el éxito de
            nuestros clientes en el mundo digital.</p>
        <hr>
    </div>

    <div class="servicios">
        <div class="box-container">
            <div class="box">
                <i class="fa-solid fa-shop"></i>
                <h3>Compra, fácil, rápido y seguro</h3>
                <p>En tan solo 4 pasos</p>
            </div>
            <div class="box">
                <i class="fa-solid fa-award"></i>
                <h3>Brindamos 3 años de garantía</h3>
                <p>Protegemos tus compras</p>
            </div>
            <div class="box">
                <i class="fa-solid fa-check"></i>
                <h3>Lo mejor en tecnología</h3>
                <p>Productos al mejor costo</p>
            </div>
        </div>
    </div>
</section>

<script>
    const swiper = new Swiper('.swiper', {
        // Optional parameters
        direction: 'horizontal',
        loop: false,
        autoHeight: true,
        grabCursor: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false
        },

        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
        },
    });
</script>
</body>

</html>

<?php
include 'Templates/Footer_First.php';
?>