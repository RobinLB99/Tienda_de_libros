import "@popperjs/core";
import { Popover } from "bootstrap";

document.addEventListener("DOMContentLoaded", () => {
    const popoverTriggerList = document.querySelectorAll(
        '[data-bs-toggle="popover"]'
    );
    const popoverList = [...popoverTriggerList].map(
        (popoverTriggerEl) => new Popover(popoverTriggerEl)
    );
});
