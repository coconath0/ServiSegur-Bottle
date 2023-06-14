<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/static/style.css">

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <script src="/static/app.js"></script>
    <script src="/static/particles.js"></script>

</head>

<body>

    <header class="header" id="header">
        <nav class="navBar">
            <ul class="nav__list">
                <li class="nav_item">
                    <a href="/" class="nav__link active-link"> Home</a>
                </li>

                <li class="nav_item">
                    <a href="/tabla1" class="nav__link">X</a>
                </li>

                <li class="nav_item">
                    <a href="/tabla2" class="nav__link">Y</a>
                </li>

                <li class="nav_item">
                    <a href="/tabla3" class="nav__link">Z</a>
                </li>
            </ul>
        </nav>
    </header>
    <!-- main -->
    <main class="main">
        <section class="home section" id="home">
            <div class="cont">
                <img src="/static/logoEmpresa.png" alt="logo">
            </div>
            <h1 id="empresaNom"> SERVISEGUR</h1>

            <div class="home__scroll">
                <a href="#about" class="home__scroll-button button--flex">
                    <i class="uil uil-mouse-alt-2 home__scroll-mouse"></i>
                    <span class="home__scroll-name">Scroll down</span>
                    <i class="uil uil-arrow-circle-down home__scroll-arrow"></i>
                </a>
            </div>

            <div id="particles"></div>
        </section>

        <!--About-->
        <section class="about section" id="about">
            <h2 class="section__title">
                About Us
            </h2>
            <span class="section__subtitle">Bienvenidos al sistema de base de datos de Servisegur!</span>
            <div class="about__container container grid">
                <img src="/static/photo_about.png" alt="" class="about__img">
                <div class="about__data">
                    <p class="about__description">
                        ServiSegur es una empresa peruana fundada en 1995, especializada en la prestación de servicios
                        de seguridad privada para empresas y particulares en todo el territorio peruano. La empresa
                        cuenta con una amplia gama de servicios que se adaptan a las necesidades de cada cliente,
                        brindando soluciones personalizadas y efectivas para proteger a las personas, bienes y activos
                        de sus clientes. Tales como seguridad física, vigilancia electrónica, monitoreo remoto,
                        transporte de valores, protección de personas y gestión de riesgos. </p>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <div>
        <p class="nath">&copy; 2023 Ing. de Datos. All rights reserved.</p>
        <p>Designed by <a class="linkPerf" href="https://github.com/coconath0" target="_blank"
                style="text-decoration: none !important;">Nathaly Ingol</a> - &#169; to creators of tsparticles </p>
        <p>Cameo: <a class="linkPerf" href="https://github.com/farodri03" target="_blank">Joaquin</a> alias Fabian R.
        </p>
    </div>
    </footer>
</body>

</html>