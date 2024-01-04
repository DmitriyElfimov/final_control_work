package org.example;

public class PackAnimals extends Animals {
    private int class_id;
    private int family_id;
    private String name_class;
    private String name_family;

    public PackAnimals(int class_id, String name_class, int family_id, String name_family) {
        super(name_class, class_id);
        this.family_id = family_id;
        this.name_family = name_family;
    }
}
