<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="accordion-item">
    <h2 class="accordion-header">
        <button
            class="accordion-button collapsed d-flex flex-row align-items-center justify-content-center gap-2"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#collapseThree"
            aria-expanded="false"
            aria-controls="collapseThree"
        >
            <i class="fontawesome fa-solid fa-users"></i>
            <span>Personal</span>
        </button>
    </h2>
    <div
        id="collapseThree"
        class="accordion-collapse collapse"
        data-bs-parent="#acordionActions"
    >
        <div
            class="accordion-body d-flex flex-column gap-2"
        >
            <form action="SvRedirigirGestionEmpleados" method="POST">
                <button
                    type="submit"
                    class="d-flex flex-row gap-2 align-items-center"
                >
                    <i
                        class="fontawesome fa-solid fa-user-gear"
                    ></i>
                    <span>Gestionar personal</span>
                </button>
            </form>
            <form action="SvRedirigirIngresarEmpleado" method="POST">
                <button
                    type="submit"
                    class="d-flex flex-row gap-2 align-items-center"
                >
                    <i class="fa-solid fa-user-plus"></i>
                    <span>Nuevo empleado</span>
                </button>
            </form>
        </div>
    </div>
</div>