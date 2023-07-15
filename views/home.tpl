%include('header_db.tpl')
<head>
    <script src="/static/js/app.js"></script>
    <script src="/static/js/particles.js"></script>
    <title>Home</title>
</head>

<body>

    <header class="header" id="header">
        <nav class="navBar">
            <ul class="nav__list">
                <li class="nav_item">
                    <a href="/" class="nav__link active"> Home</a>
                </li>

                <li class="nav_item">
                    <a href="/vigilante" class="nav__link" >Vigilante</a>
                </li>

                <li class="nav_item">
                    <a href="/sede" class="nav__link" >Sede</a>
                </li>

                <li class="nav_item">
                    <a href="/horario" class="nav__link" >Horario</a>
                </li>
                
                <li class="nav_item">
                    <a href="/asistencia" class="nav__link" >Asistencia</a>
                </li>

            </ul>
        </nav>
    </header>
    <!-- main -->
    <main>
        <section class="home" id="home">
                <div class="cont">
                    <img src="/static/img/logoEmpresa.png" alt="logo">
        
                    <h1 id="empresaNom"> SERVISEGUR</h1>
                    <div id="particles"></div>
                </div> 
        </section>

        <!--About-->
        <section class="about" id="about">
            <div class="about-img">
                <img src="/static/img/photo_about.png" alt="">
            </div>
            <div class="about-content">
                <h2 class="heading">About <span>Us</span></h2>
                <h3>Hello! This is a database filter system for our class of Data Engineering</h3>
                <p>ServiSegur is a Peruvian company founded in 1995, specialized in providing private security services for companies and individuals throughout the Peruvian territory. The company has a wide range of services that adapt to the needs of each client, providing personalized and effective solutions to protect the people, goods and assets of its clients. Such as physical security, electronic surveillance, remote monitoring, transportation of valuables, protection of people and risk management. </p>
                    <a href="https://servisegur.com.pe/" target="_blank"><button class="btn">Read More</button></a>
            </div>
        </section>

    </main>
    <footer>
        <p class="footerStyle">&copy; 2023 Ing. de Datos. All rights reserved.</p>
        <p class="footerStyle">Designed by <a class="linkPerf" href="https://github.com/coconath0" target="_blank"
                style="text-decoration: none !important;">Nathaly Ingol</a> -  &#169; to creators of tsparticles </p>
    </footer>
</body>

</html>