/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Date;
import javafx.scene.text.Text;

/**
 *
 * @author Jahij
 */
public class novosti {
    
    private int novosti_id;
    private String naslov;
    private String novost_sazetak;
    private String novosti_opis;
    private String image;   
    private Date datum;
    private int urednik_id;

    public int getNovosti_id() {
        return novosti_id;
    }

    public void setNovosti_id(int novosti_id) {
        this.novosti_id = novosti_id;
    }

    public String getNaslov() {
        return naslov;
    }

    public void setNaslov(String naslov) {
        this.naslov = naslov;
    }

    public String getNovost_sazetak() {
        return novost_sazetak;
    }

    public void setNovost_sazetak(String novost_sazetak) {
        this.novost_sazetak = novost_sazetak;
    }

    public String getNovosti_opis() {
        return novosti_opis;
    }

    public void setNovosti_opis(String novosti_opis) {
        this.novosti_opis = novosti_opis;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public int getUrednik_id() {
        return urednik_id;
    }

    public void setUrednik_id(int urednik_id) {
        this.urednik_id = urednik_id;
    }
    
}
