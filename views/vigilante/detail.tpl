% include('header_index.tpl')

<head>
    % if vigilante[0] == 0:
    <title>Crear Vigilantes</title>
    % else:
    <title>Editar Vigilantes</title>
    % end
</head>

<body>
    <section>
        % if vigilante[0] == 0:
        <h1>Crear Vigilante</h1>
        % else:
        <h1>Editar Vigilante</h1>
        % end
        <div class="centerForm">
            <form class="formDetails" action="/vigilante/save" method="post">
                <input type="hidden" name="id" value="{{vigilante[0]}}"><br>
                <!-- <label for="name">Inicio Contrato:</label><br>
                <input type="text" name="fecha_ini_contrato" maxlength="15" value="{{vigilante[1]}}"><br> -->
                <label for="name">Inicio Contrato:</label><br>
                <input type="date" name="fecha_ini_contrato" value="{{vigilante[1]}}" pattern="\d{1,2}/\d{1,2}/\d{4}"
                    placeholder="dd/mm/aaaa" required min="2020-01-01" max="2023-12-31"><br>


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
                </select><br>

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
                <label for="name">Capacitacion:</label><br>
                <select name="capacitacion">
                    % if vigilante[7] == 1:
                    <option selected value="1">Si</option>
                    <option value="0">No</option>
                    % else:
                    <option value="1">Si</option>
                    <option selected value="0">No</option>
                    % end
                </select><br>
                <label for="name">Seguro:</label><br>
                <select name="seguro">
                    % for s in seguros:
                    % if vigilante[8] == s[1]:
                    <option selected value="{{s[0]}}">{{s[1]}}</option>
                    % else:
                    <option value="{{s[0]}}">{{s[1]}}</option>
                    % end
                    % end
                </select><br>

                <label for="name">Fondo de pension:</label><br>
                <select name="fondo_pension">
                    % for s in fondo_pensiones:
                    % if vigilante[9] == s[1]:
                    <option selected value="{{s[0]}}">{{s[1]}}</option>
                    % else:
                    <option value="{{s[0]}}">{{s[1]}}</option>
                    % end
                    % end
                </select><br>

                <!-- <button class="btn"> Guardar Cambios</button>
                <a href="/vigilante" class="btnCancel">Cancelar</a> -->
                <div class="btn-container">
                    <button class="btn">Guardar Cambios</button>
                    <a href="/vigilante" class="btn">Cancelar</a>
                </div>
            </form>
        </div>
        % if vigilante[0] != 0:
        <h3>Horarios</h3>
        <!-- <a href="/vigilante/horario/new?vigilante_id={{vigilante[0]}}"><button class="btn">Agregar Horario</button></a> -->
        <div class="btn-container">
            <a href="/vigilante/horario/new?vigilante_id={{vigilante[0]}}"><button class="btn">Agregar
                    Horario</button></a>
        </div>
        <table class="center">
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
    </section>
    % include('footer.tpl')
</body>

</html>