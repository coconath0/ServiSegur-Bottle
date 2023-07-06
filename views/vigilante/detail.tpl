% include('views/header_index.tpl')

<body>
    % if vigilante[0] == 0:
    <h3>Crear Vigilante</h3>
    % else:
    <h3>Editar Vigilante</h3>
    % end
    <form action="/vigilante/save" method="post">
        <input type="hidden" name="id" value="{{vigilante[0]}}"><br>
        <label for="name">Inicio Contrato:</label><br>
        <input type="text" name="fecha_ini_contrato" maxlength="15" value="{{vigilante[1]}}"><br>
        <label for="name">Nombre :</label><br>
        <input type="text" name="nombre" maxlength="30" value="{{vigilante[2]}}"><br>
        <label for="name">DNI:</label><br>
        <input type="text" name="dni" maxlength="8" value="{{vigilante[3]}}"><br>
        <label for="name">Numero de cuenta:</label><br>
        <input type="text" name="num_cuenta" maxlength="60" value="{{vigilante[4]}}"><br>
        <label for="name">Porta arma:</label><br>
        <select name="portaArma">
            % if vigilante[5] == "Sí":
            <option selected value="1">Si</option>
            <option value="0">No</option>
            % else:
            <option value="1">Si</option>
            <option selected value="0">No</option>
            % end
        </select>
        <label for="name">Tipo de servicio:</label><br>
        <select name="servicio_id">
            % for s in servicio:
            % if vigilante[6] == s[1]:
            <option selected value="{{s[0]}}">{{s[1]}}</option>
            % else:
            <option value="{{s[0]}}">{{s[1]}}</option>
            % end
            % end
        </select><br>
        <button class="btn"> Guardar Cambios</button>
        <a href="/vigilante" class="btn">Cancelar</a>
    </form>
    % if vigilante[0] != 0:
    <h4>Horarios</h4>
    <a href="/vigilante/horario/new?vigilante_id={{vigilante[0]}}" class="btn">Agregar Horario</a>
    <table>
        <thead>
            <th>ID</th>
            <th>Dia</th>
            <th>Rango Horario</th>
            <th>Sede</th>
            <th>Empresa</th>
            <th>Acciones</th>
        </thead>
        <tbody>
            % for s in control_asistencia:
            <tr>
                <td>{{s[0]}}</td>
                <td>{{s[1]}}</td>
                <td>{{s[2]}}</td>
                <td>{{s[3]}}</td>
                <td>{{s[4]}}</td>
                <td>
                    <a href="/vigilante/edit/delete?id={{s[5]}}&vigilante_id={{vigilante[0]}}">Eliminar</a>
                </td>
            </tr>
            % end
        </tbody>
    </table>
    % end
    % include('views/footer.tpl')
</body>

</html>