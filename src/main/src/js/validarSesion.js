const url_string = window.location.href;
const url = new URL(url_string);

let user_and_password = url.searchParams.get("user_password");

console.log(user_and_password);

if (user_and_password === "incorrect") {
    alert("El usuario y/o contraseña son incorrectos");
}
