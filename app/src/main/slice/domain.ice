/*
 * Copyright (c) 2020 Charlie Condorcet Engineer Student.
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation, either version 3 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
 * even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program. If not, see
 * <https://www.gnu.org/licenses/>.
 */

// https://doc.zeroc.com/ice/3.7/language-mappings/java-mapping/client-side-slice-to-java-mapping/customizing-the-java-mapping
["java:package:cl.ucn.disc.pdis.fivet.zeroice", "cs:namespace:Fivet.ZeroIce"]
module model {

    /**
     * Clase Persona (duenio de mascota).
     */
    class Persona {

        /**
         * Primary Key.
         */
        int uid;

        /**
         * Rut: 113335557.
         */
        string rut;

        /**
         * Nombre.
         */
        string nombre;

        /**
         * Direccion.
         */
        string direccion;

        /**
         * Telefono Fijo: +55 55 550000.
         */
        long telefonoFijo;

        /**
         * Telefono Fijo: +55 55 550000.
         */
        long telefonoMovil;

        /**
         * Correo electronico.
         */
        string email;

    }

    /**
     * Sexo del paciente.
     */
    enum Sexo {
        MACHO,
        HEMBRA
    }

     /**
      * Tipo de paciente.
      */
     enum TipoPaciente {
         INTERNO,
         EXTERNO
     }

    /**
     * Clase Ficha (identifica una mascota).
     */
    class Ficha{

        /**
         * Primary key.
         */
        int uid;

        /**
         * Numero: 1133.
         */
        int numero;

        /**
         * Nombre: Misifus.
         */
        string nombre;

        /**
         * Especie: Gatuno.
         */
        string especie;

        /**
         * Fecha nacimiento.
         * Format: ISO_ZONED_DATE_TIME
         */
        string fechaNacimiento;

        /**
         * Raza de la mascota.
         */
        string raza;

        /**
         * Color paciente: blanco perlado.
         */
        string color;

        /**
         * Sexo paciente: Macho/Hembra.
         */
        Sexo sexo;

        /**
         * Tipo pacinte: Interno/Externo.
         */
        TipoPaciente tipoPaciente;
     }

    /**
     * Clase Control para las mascotas.
     */
    class Control{

        /**
         * Primary key.
         */
        int uid;

        /**
         * Fecha de emision.
         * Format: ISO_ZONED_DATE_TIME
         */
        string fechaEmision;

        /**
         * Fecha de proximo control.
         * Format: ISO_ZONED_DATE_TIME
         */
        string fechaProximoControl;

        /**
         * Temperatura mascota.
         */
        double temperatura;

        /**
         * Peso mascota.
         */
        double peso;

        /**
         * Altura mascota.
         */
        double altura;

        /**
         * Diagnostico para la mascota.
         */
        string diagnostico;

    }

    /**
     * Interface para operaciones basicas en el sistema.
     */
    interface Contratos {

        /**
         * Deseo registrar los datos de un paciente.
         *
         * @param ficha a crear en el backend.
         * @return the ficha almacenada en el backend (con numero asignado).
         */
        Ficha crearFicha(Ficha ficha);

        /**
         * Deseo registrar los datos del duenio de un paciente.
         *
         * @param persona a crear en el backend.
         * @return the Persona almacenada en el backend.
         */
        Persona crearPersona(Persona persona);

        /**
         * Deseo registrar los datos de un Control.
         *
         * @param numeroFicha al cual sera asignado el control.
         * @param control a agregar.
         */
        Control crearControl(int numeroFicha, Control control);

        /**
         * Dado un numero de ficha, retorna la ficha asociada.
         *
         * @param numero de la ficha a obtener.
         * @return the Ficha.
         */
        Ficha obtenerFicha(int numero);

        /**
         * Dado un numero de rut obtiene la persona.
         *
         * @param rut de la persona a buscar.
         * @return the Persona.
         */
        Persona obtenerPersona(string rut);

    }

    /**
     * The base system.
     */
    interface TheSystem {

        /**
         * @return the diference in time between client and server.
         */
        long getDelay(long clientTime);

    }
}
