%include('header_index.tpl')

<head>
    <title>Vigilantes</title>
</head>

<body>
    <main class="main">
        <section>
            <h1>Listado de Vigilantes</h1>
            <p>{{mensaje}}</p>
            <a href="/vigilante/new"><button class="btn">Agregar registro</button></a>
            <table class="center">
                <thead>
                    <th> Id </th>
                    <th> Inicio Contrato </th>
                    <th> Nombre Vigilante </th>
                    <th> DNI </th>
                    <th> Num. cuenta </th>
                    <th> Porta Arma </th>
                    <th> Tipo servicio </th>
                    <th>Acciones</th>

                </thead>
                <tbody>
                    % for s in vigilante:
                    <tr>
                        <td>{{s[0]}} </td>
                        <td>{{s[1]}} </td>
                        <td style="font-weight: 600;">{{s[2]}} </td>
                        <td>{{s[3]}} </td>
                        <td>{{s[4]}} </td>
                        <td>{{s[5]}} </td>
                        <td>{{s[6]}} </td>

                        <td>
                            <a href="/vigilante/edit?id={{s[0]}}">Editar</a>
                            <a href="/vigilante/delete?id={{s[0]}}">Eliminar</a>
                        </td>
                    </tr>
                    % end
                </tbody>
            </table>
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