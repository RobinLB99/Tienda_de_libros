<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<nav class="text-light d-flex flex-column pb-2 z-1 gap-3">
    <div class="d-flex flex-column gap-0 nav-menu">
        <div class="d-flex flex-row gap-3 p-3">
            <p
                class="h2 m-0 d-flex flex-row gap-3 titulo-nav align-items-center"
            >
                <i
                    class="fontawesome fa-solid fa-book-open d-flex justify-content-center align-items-center"
                ></i>
                <span>Libreria</span>
            </p>
        </div>
        <div class="border opacity-25"></div>
        <form action="SvMenuPrincipal" method="get">
            <button
                type="submit"
                class="btn btn-primary d-flex flex-row gap-2 align-items-center menu-principal p-3"
            >
                <i class="fa-solid fa-bars"></i>
                <span>Inicio</span>
            </button>
        </form>
        <div class="border opacity-25"></div>
        <div class="accordion mt-3" id="acordionActions">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button
                        class="accordion-button d-flex flex-row align-items-center justify-content-center gap-2"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseOne"
                        aria-expanded="true"
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
                    class="accordion-collapse collapse show"
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
                        <form action="#">
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
                        <form action="#">
                            <button
                                type="submit"
                                class="d-flex flex-row gap-2 align-items-center"
                            >
                                <i
                                    class="fontawesome fa-solid fa-circle-plus"
                                ></i>
                                <span>Nuevo empleado</span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
    String nameUser = (String) request.getSession().getAttribute("usuario");
    %>
    <div class="dropdown container-fluid m-0 p-0">
        <div class="border opacity-25"></div>
        <a
            class="btn btn-primary dropdown-toggle d-flex justify-content-between align-items-center"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            style="width: 100%; height: 50px"
        >
            <div class="d-flex align-items-center gap-3">
                <i
                    class="fa-solid fa-circle-user"
                    style="font-size: 25px"
                ></i>
                <span><%= nameUser %></span>
            </div>
        </a>

        <ul class="dropdown-menu shadow p-auto" id="menu-sesion" style="width: 100%;">
            <li>
                <form class="dropdown-item" action="SvCerrarSesion" method="POST">
                    <button
                        class="d-flex justify-content-start align-items-center gap-3 m-0 p-0"
                        type="submit"
                        style="width: 100%; height: 25px; background-color: transparent; border: none;"
                    >
                        <i class="fa-solid fa-sign-out-alt"></i>
                        <span>Cerrar sesión</span>
                    </button>
                </form>
            </li>
        </ul>
    </div>
</nav>