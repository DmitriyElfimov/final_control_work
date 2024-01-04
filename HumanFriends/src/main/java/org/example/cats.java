package org.example;

import java.util.Date;

public class cats extends PetAnimals {
    private int class_id;
    private int family_id;
    private String name_class;
    private String name_family;
    private int id;
    private String nickname;
    private Date birthday;
    private String command;

    public cats(int class_id, String name_class, int family_id, String name_family, int id, String nickname, Date birthday, String command) {
        super(class_id, name_class, family_id, name_family);
        this.id = id;
        this.nickname = nickname;
        this.birthday = birthday;
        this.command = command;
    }
}

