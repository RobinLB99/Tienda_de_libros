import html2canvas from "html2canvas";
import jsPDF from "jspdf";

document.addEventListener("DOMContentLoaded", () => {
    const print = document.getElementById("retrivePaid");
    const toConvert = document.getElementById("factura_");
    const btnContinuar = document.getElementById("continue");
    const btnX = document.getElementById("x-close");
    const btnCancel = document.getElementById("close");

    const convertToPDF = () => {
        html2canvas(toConvert).then((canvas) => {
            const imgData = canvas.toDataURL("image/png");
            const pdf = new jsPDF("p", "mm", "a4");
            const imgWidth = 210;
            const imgHeight = (canvas.height * imgWidth) / canvas.width;

            pdf.addImage(imgData, "PNG", 0, 0, imgWidth, imgHeight);
            pdf.save("factura.pdf");
        });
        alert("Pago recibido!");
        btnContinuar.disabled = false;
        btnX.disabled = true;
        btnCancel.disabled = true;
        print.disabled = true;
    };

    print.addEventListener("click", convertToPDF);
});
