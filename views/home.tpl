%include('header_db.tpl')
<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <script src="/static/js/app.js"></script>
    <script src="/static/js/particles.js"></script>
    <title>Home</title>
</head>

<body>

    <header class="header" id="header">
        <nav class="navBar">
            <ul class="nav__list">
                <li class="nav_item">
                    <a href="/" class="nav__link active" target="_blank"> Home</a>
                </li>

                <li class="nav_item">
                    <a href="/asistencia" class="nav__link" target="_blank">Asistencia</a>
                </li>

                <li class="nav_item">
                    <a href="/sede" class="nav__link" target="_blank">Sede</a>
                </li>

                <li class="nav_item">
                    <a href="/horario" class="nav__link" target="_blank">Horario</a>
                </li>

                <li class="nav_item">
                    <a href="/vigilante" class="nav__link" target="_blank">Vigilante</a>
                </li>
            </ul>
        </nav>
    </header>
    <!-- main -->
    <main>
        <section class="home section" id="home">
            <div class="cont">
                <img src="/static/img/logoEmpresa.png" alt="logo">
            
            <h1 id="empresaNom"> SERVISEGUR</h1>
            <div id="particles"></div>
            <div class="home__scroll">
                <a href="#about" class="home__scroll-button button--flex"> <!--  -->
                    <i class="uil uil-arrow-circle-down home__scroll-arrow"></i>
                </a>
            </div>

            
        </div>
        </section>

        <!--About-->
        <section class="about section" id="about">
            <h2 class="section__title">
                About Us
            </h2>
            <span class="section__subtitle">Bienvenidos al sistema de base de datos de Servisegur!</span>
            <div class="about__container container grid">
                <img src="/static/img/photo_about.png" alt="" class="about__img">
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
        <p class="footerStyle">&copy; 2023 Ing. de Datos. All rights reserved.</p>
        <p class="footerStyle">Designed by <a class="linkPerf" href="https://github.com/coconath0" target="_blank"
                style="text-decoration: none !important;">Nathaly Ingol</a> - &#169; to creators of tsparticles </p>
        <p class="footerStyle">Cameo: <a class="linkPerf" href="https://github.com/farodri03" target="_blank">Joaquin</a> alias Fabian R.
        </p>
    </footer>
</body>

</html>