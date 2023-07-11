%include('header_index.tpl')
<head>
    <title>Asistencias</title>
</head>
<body>
    <main class="main">
        <section>
            <h1>Listado de Asistencias</h1>
            <p>{{mensaje}}</p>
            <!-- <a href="/asistencia/new"><button class="btn">Agregar registro</button></a> -->
            <table class="center">
                <thead>
                    <th style="color: #fff;"> ID </th>
                    <th style="color: #fff;"> Nombre Vigilante </th>
                    <th style="color: #fff;"> Sede </th>
                    <th style="color: #fff;"> Día </th>
                    <th style="color: #fff;"> Horario </th>
                    <th style="color: #fff;"> Asistencia </th>
                    <th style="color: #fff;"> Acciones </th>
                </thead>
                <tbody>
                    % for s in asistencia:
                    <tr>
                        <td>{{s[0]}} </td>
                        <td>{{s[1]}} </td>
                        <td>{{s[2]}} </td>
                        <td>{{s[3]}} </td>
                        <td>{{s[4]}} </td>
                        <td style="font-weight: 600;">{{s[5]}} </td>

                        <td>
                            <a href="/asistencia/edit?id={{s[0]}}">Editar</a>
                            <!-- <a href="/asistencia/delete?id={{s[0]}}">Eliminar</a> -->
                        </td>
                    </tr>
                    % end
                </tbody>
            </table>
        </section>
    </main>
    %include('footer.tpl')
</body>