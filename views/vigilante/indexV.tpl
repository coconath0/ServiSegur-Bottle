%include('header_index.tpl')

<head>
    <title>Vigilantes</title>
</head>

<body>
    <main class="main">
        <section>
            <h1>Listado de Vigilantes</h1>
            <p>{{mensaje}}</p>
            <div class="btn-container"><a href="/vigilante/new"><button class="btn">Agregar registro</button></a></div>
            <table class="center">
                <thead>
                    <th style="color: #fff;"> Id </th>
                    <th style="color: #fff;"> Inicio Contrato </th>
                    <th style="color: #fff;"> Nombre Vigilante </th>
                    <th style="color: #fff;"> DNI </th>
                    <th style="color: #fff;"> Num. cuenta </th>
                    <th style="color: #fff;"> Porta Arma </th>
                    <th style="color: #fff;"> Tipo servicio </th>
                    <th style="color: #fff;">Acciones</th>

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
    %include('footer.tpl')

</body>