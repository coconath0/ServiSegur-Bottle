%include('header_index.tpl')
<head>
    <title>Horarios</title>
</head>
<body>
    <main class="main">
        <section>
            <h1>Listado de Horarios</h1>
            <p>{{mensaje}}</p>
            <table class="center">
                <thead>
                    <th style="color: #fff;"> ID </th>
                    <th style="color: #fff;"> Nombre Vigilante </th>
                    <th style="color: #fff;"> Día </th>
                    <th style="color: #fff;"> Horario </th>
                    <th style="color: #fff;"> Sede </th>
                </thead>
                <tbody>
                    % for s in horario:
                    <tr>
                        <td>{{s[0]}} </td>
                        <td>{{s[1]}} </td>
                        <td>{{s[2]}} </td>
                        <td>{{s[3]}} </td>
                        <td>{{s[4]}} </td>
                    </tr>
                    % end
                </tbody>
            </table>
        </section>
    </main>
    %include('footer.tpl')

</body>