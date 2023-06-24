%include('header_index.tpl')
<head>
    <title>Sedes</title>
</head>
<body>
    <main class="main">
        <section>
            <h1>Listado de Sedes</h1>
            <p>{{mensaje}}</p>
            <a href="/sede/new"><button class="btn">Agregar registro</button></a>
            <table class="center">
                <thead>
                    <th style="color: #fff;">Sedes</th>
                    <th style="color: #fff;">Empresas</th>
                    <th style="color: #fff;">Acciones</th>
                </thead>
                <tbody>
                    % for s in sede:
                    <tr>
                        <td>{{s[0]}}</td>
                        <td>{{s[1]}}</td>
                        <td>
                            <a href="/sede/edit?id={{s[0]}}">Editar</a>
                            <a href="/sede/delete?id={{s[0]}}">Eliminar</a>
                        </td>
                    </tr>
                    %end
                </tbody>
            </table>

        </section>
    </main>
    %include('footer.tpl')
</body>