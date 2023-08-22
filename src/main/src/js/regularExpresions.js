// Validar datos de modificacion de libros
export const regExpCode = /^\d{10}$/;
export const regExpName = /\b\w+\s(?:de\s)?\w+\s(?:\w+\s)?\w+\b/;
export const regExpAutor =
    /\b[A-Za-zÀ-ÿ.'-]+\s(?:[A-Za-zÀ-ÿ.'-]+\s[A-Za-zÀ-ÿ.'-]+)?\b/;
export const regExpYear = /^\d{4}$/;
export const regExpPrice = /^\d+(.\d{1,2})?$/;
export const regExpUnits = /\b([1-9]|[1-9][0-9]|100)\b/;
