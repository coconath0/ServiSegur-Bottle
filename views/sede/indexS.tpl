%include('header_index.tpl')
<head>
    <title>Sedes</title>
</head>
<body>
    <main class="main">
        <section>
            <h1>Listado de Sedes</h1>
            <p>{{mensaje}}</p>
            <table class="center">
                <thead>
                    <th style="color: #fff;">Sedes</th>
                    <th style="color: #fff;">Empresas</th>
                </thead>
                <tbody>
                    % for s in sede:
                    <tr>
                        <td>{{s[0]}}</td>
                        <td>{{s[1]}}</td>
                    </tr>
                    %end
                </tbody>
            </table>

        </section>
    </main>
    %include('footer.tpl')
</body>