<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="accordion-item">
    <h2 class="accordion-header">
        <button
            class="accordion-button collapsed d-flex flex-row align-items-center justify-content-center gap-2"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#collapseTwo"
            aria-expanded="false"
            aria-controls="collapseTwo"
        >
            <i
                class="fontawesome fa-solid fa-cash-register d-flex flex-row align-items-center justify-content-center"
            ></i>
            <span>Ventas</span>
        </button>
    </h2>
    <div
        id="collapseTwo"
        class="accordion-collapse collapse"
        data-bs-parent="#acordionActions"
    >
        <div
            class="accordion-body d-flex flex-column gap-2"
        >
            <form action="#">
                <button
                    type="submit"
                    class="d-flex flex-row gap-2 align-items-center"
                >
                    <i
                        class="fontawesome fa-solid fa-list-check"
                    ></i>
                    <span>Historial de ventas</span>
                </button>
            </form>
            <form action="#">
                <button
                    type="submit"
                    class="d-flex flex-row gap-2 align-items-center"
                >
                    <i
                        class="fontawesome fa-solid fa-cart-shopping"
                    ></i>
                    <span>Realizar venta</span>
                </button>
            </form>
        </div>
    </div>
</div>