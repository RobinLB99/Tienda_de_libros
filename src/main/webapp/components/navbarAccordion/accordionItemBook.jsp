<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="accordion-item">
    <h2 class="accordion-header">
        <button
            class="accordion-button collapsed d-flex flex-row align-items-center justify-content-center gap-2"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#collapseOne"
            aria-expanded="false"
            aria-controls="collapseOne"
        >
            <i
                class="fontawesome fa-solid fa-book d-flex flex-row align-items-center justify-content-center"
            ></i>
            <span>Libros</span>
        </button>
    </h2>
    <div
        id="collapseOne"
        class="accordion-collapse collapse"
        data-bs-parent="#acordionActions"
    >
        <div
            class="accordion-body d-flex flex-column gap-2"
        >
            <form action="SvLibrosDisponibles" method="post">
                <button
                    type="submit"
                    class="d-flex flex-row gap-2 align-items-center"
                >
                    <i
                        class="fontawesome fa-solid fa-list-check"
                    ></i>
                    <span>Libros disponibles</span>
                </button>
            </form>
            <form action="SvRedirigirAgregarLibro" method="GET">
                <button
                    type="submit"
                    class="d-flex flex-row gap-2 align-items-center"
                >
                    <i
                        class="fontawesome fa-solid fa-circle-plus"
                    ></i>
                    <span>Agregar libro</span>
                </button>
            </form>
        </div>
    </div>
</div>