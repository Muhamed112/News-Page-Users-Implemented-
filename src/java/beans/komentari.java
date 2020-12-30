/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Jahij
 */
public class komentari {
    private int komentar_id;
    private int novost_id;
    private int user_id;
    private String komentar;

    public int getKomentar_id() {
        return komentar_id;
    }

    public void setKomentar_id(int komentar_id) {
        this.komentar_id = komentar_id;
    }

    public int getNovost_id() {
        return novost_id;
    }

    public void setNovost_id(int novost_id) {
        this.novost_id = novost_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getKomentar() {
        return komentar;
    }

    public void setKomentar(String komentar) {
        this.komentar = komentar;
    }
    
    
}
