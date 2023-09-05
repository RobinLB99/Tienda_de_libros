<%@page import="java.util.List"%>
<%@page import="Logica.Libro"%>
<div class="card card-tabla" id="targetaSeleccionarLibro">
    <div class="card-header">Nueva venta</div>
    <div class="card-body libros-seleccion">
        <h5 class="card-title">Elija los libros</h5>
        <p class="card-text">
            Marque los libros de la orden a realizar y
            especifique la cantidad por libro.
        </p>
        <div class="border opacity-25 mb-3"></div>
        <table
            class="table"
            id="TablaLibrosSeleccion"
            class="display"
            style="width: 100%"
        >
            <thead>
                <tr>
                    <th></th>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Autor</th>
                    <th>Año de publicación</th>
                    <th>Precio</th>
                    <th>Unidades disponible</th>
                    <th>Unidades seleccionadas</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Libro> librosToSelect = (List) request.getSession().getAttribute("listaLibrosSelect");
                    
                    if (librosToSelect != null) {
                        for (Libro libro : librosToSelect) {
                        
                %>
                <tr class="RegistroLibro">
                    <td>
                        <input
                            class="form-check-input inpCheck"
                            type="checkbox"
                            style="
                                width: 25px;
                                height: 25px;
                            "
                            name="idBookSelect_"
                            value="<%= libro.getId() %>"
                        />
                    </td>
                    <td>1920145786</td>
                    <td>Cien años de soledad</td>
                    <td>Gabriel García Márquez</td>
                    <td>1967</td>
                    <td>$29.99</td>
                    <td>30 unidades</td>
                    <td>
                        <input
                            class="form-control inpNumUnit"
                            type="number"
                            style="width: 80px"
                            name="numUnitSelect_"
                            value="1"
                            max="9"
                            min="1"
                            maxlength="1"
                        />
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                
                
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Autor</th>
                    <th>Año de publicación</th>
                    <th>Precio</th>
                    <th>Unidades disponible</th>
                    <th>Unidades seleccionadas</th>
                </tr>
            </tfoot>
        </table>
        <div class="border opacity-25 my-3"></div>
        <form
            action="SvTomarGuardarListaLibros"
            method="post"
            class="d-flex align-items-center justify-content-end gap-3"
        >
            <textarea
                name="arrayObjetos_"
                id="arrayObjetos"
                hidden
                ></textarea>
            <button
                type="button"
                class="btn btn-secondary"
                id="tomarListaLibros"
            >
                Tomar libros
            </button>
            <button
                type="submit"
                class="btn btn-primary"
                id="enviarListaLibros"
                disabled
            >
                Siguiente
            </button>
        </form>
    </div>
</div>

<div
    class="modal fade"
    id="modalCheckList"
    data-bs-backdrop="static"
    data-bs-keyboard="false"
    tabindex="-1"
    aria-labelledby="title-modal-checkList"
    aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1
                    class="modal-title fs-5"
                    id="title-modal-checkList"
                >
                    Modal title
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <p id="text-modal"></p>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                >
                    Entendido
                </button>
            </div>
        </div>
    </div>
</div>