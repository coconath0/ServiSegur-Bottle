% include('header_index.tpl')

<body>
    <section>
        <h3>Editar Asistencia</h3>
        <div class="centerForm">
            <form action="/asistencia/save" method="post">
                <input type="hidden" name="id" value="{{control_asistencia[0]}}"><br>
                <label for="name">Asistencia:</label><br>
                <select name="asistencia">
                    % if control_asistencia[5] == "ASISTIÓ":
                    <option selected value="1">ASISTIÓ</option>
                    <option value="0">FALTÓ</option>
                    % else:
                    <option value="1">ASISTIÓ</option>
                    <option selected value="0">FALTÓ</option>
                    % end
                </select><br>
                <div class="btn-container">
                    <button class="btn"> Guardar Cambios</button>
                    <a href="/asistencia" class="btn">Cancelar</a>
                </div>
            </form>
        </div>
    </section>
    % include('footer.tpl')
</body>

</html>