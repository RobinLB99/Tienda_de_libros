// Validar datos de modificacion de libros
export const regExpCode = /^\d{10}$/;
export const regExpName = /\b\w+\s(?:de\s)?\w+\s(?:\w+\s)?\w+\b/;
export const regExpAutor =
    /\b[A-Za-zÀ-ÿ.'-]+\s(?:[A-Za-zÀ-ÿ.'-]+\s[A-Za-zÀ-ÿ.'-]+)?\b/;
export const regExpYear = /^\d{4}$/;
export const regExpPrice = /^\d+(.\d{1,2})?$/;
export const regExpUnits = /\b([1-9]|[1-9][0-9]|100)\b/;

// Validar datos de empleado y cliente
export const regExpCedula = /^(09\d{8}|193\d{7})$/;
export const regExpNombres = /^[A-Z][a-záéíóúü]*\s[A-Z][a-záéíóúü]*$/;
export const regExpApellidos = /^[A-Z][a-záéíóúü]*\s[A-Z][a-záéíóúü]*$/;
export const regExpFechaNacimiento = /^\d{4}-\d{2}-\d{2}$/
export const regExpTelefono = /^09\d{8}$/;

// Validar credenciales
export const regExpNameUser = /^[a-z]{5,}\d{2}$/;
export const regExpFistPassword = /^\S{3,}$/;
export const regExpNewPassword = /^\S{10,}$/;