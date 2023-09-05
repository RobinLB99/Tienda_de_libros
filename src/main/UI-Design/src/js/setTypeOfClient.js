document.addEventListener("DOMContentLoaded", () => {
    const typeOfClientsRatios = document.getElementsByName("typeClient");
    const inpTypeOfClient = document.getElementById("typeOfClient");

    typeOfClientsRatios.forEach(ratio => {
        ratio.addEventListener("click", () => {
            inpTypeOfClient.value = ratio.value;
        })
    })
})