package com.torneodefutbol.dominio;

/**
 * Created by Usuario on 09/01/2018.
 */
public class Futbol {

    int height = 0;
    int widht = 0;

    public Futbol(int height, int widht) {
        this.height = height;
        this.widht = widht;
    }

    public Futbol() {

    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidht() {
        return widht;
    }

    public void setWidht(int widht) {
        this.widht = widht;
    }
}
