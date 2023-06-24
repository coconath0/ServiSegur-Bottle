%include('header_index.tpl')
<head>
    <title>Horarios</title>
</head>
<body>
    <main class="main">
        <section>
            <h1>Listado de Horarios</h1>
            <p>{{mensaje}}</p>
            <a href="/horario/new"><button class="btn">Agregar registro</button></a>
            <table class="center">
                <thead>
                    <th style="color: #fff;"> Nombre Vigilante </th>
                    <th style="color: #fff;"> Día </th>
                    <th style="color: #fff;"> Horario </th>
                    <th style="color: #fff;"> Sede </th>
                    <th style="color: #fff;"> Acciones </th>
                </thead>
                <tbody>
                    % for s in horario:
                    <tr>
                        <td>{{s[0]}} </td>
                        <td>{{s[1]}} </td>
                        <td>{{s[2]}} </td>
                        <td>{{s[3]}} </td>

                        <td>
                            <a href="/horario/edit?id={{s[0]}}">Editar</a>
                            <a href="/horario/delete?id={{s[0]}}">Eliminar</a>
                        </td>
                    </tr>
                    % end
                </tbody>
            </table>
        </section>
    </main>
    %include('footer.tpl')

</body>