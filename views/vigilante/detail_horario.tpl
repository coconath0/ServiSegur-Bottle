% include('header_index.tpl')

<body>
    <section>
        <h1>AGREGAR HORARIO A VIGILANTE</h1>
        <div class="centerForm">
            <form class="formDetails" action="/vigilante/horario/new/save" method="post">
                <input type="hidden" name="vigilante_id" value="{{vigilante_id}}"><br>
                <label for="name">Dia:</label><br>
                <select name="dia">
                    % for s in dias:
                    % if horario[1] == s[1]:
                    <option selected value="{{s[0]}}">{{s[1]}}</option>
                    % else:
                    <option value="{{s[0]}}">{{s[1]}}</option>
                    % end
                    % end
                </select><br>
                <label for="name">Hora:</label><br>
                <select name="hora">
                    % for s in horas:
                    % if horario[2] == s[1]:
                    <option selected value="{{s[0]}}">{{s[1]}}</option>
                    % else:
                    <option value="{{s[0]}}">{{s[1]}}</option>
                    % end
                    % end
                </select><br>

                <label for="name">Sede:</label><br>
                <select name="sede">
                    % for s in sedes:
                    % if horario[3] == s[1]:
                    <option selected value="{{s[0]}}">{{s[1]}}</option>
                    % else:
                    <option value="{{s[0]}}">{{s[1]}}</option>
                    % end
                    % end
                </select><br>

                <div class="btn-container"><button class="btn">Agregar</button></div>
            </form>
        </div>
        <div class="btn-container"><a href="/vigilante/edit?id={{vigilante_id}}" class="btn">Cancelar</a></div>
    </section>
    % include('footer.tpl')
</body>

</html>