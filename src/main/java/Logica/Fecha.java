package Logica;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 * @author joel
 */
public class Fecha {

    private String stringFecha;

    public Fecha(String stringFecha) {
        this.stringFecha = stringFecha;
    }

    public String getStringFecha() {
        return stringFecha;
    }

    public void setStringFecha(String stringFecha) {
        this.stringFecha = stringFecha;
    }

    /* Obtine la la fecha de tipo string "1985-05-06" convertida a tipo Date */
    public Date getTypeDate() {
        String[] arrStringDate = this.stringFecha.split("-");

        LocalDate fechaPersonalizada = LocalDate.of(
                Integer.parseInt(arrStringDate[0]),
                Integer.parseInt(arrStringDate[1]),
                Integer.parseInt(arrStringDate[2])
        );

        Instant instant = fechaPersonalizada.atStartOfDay(ZoneId.systemDefault()).toInstant();

        return Date.from(instant);
    }

}
