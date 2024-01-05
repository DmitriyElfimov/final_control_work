package org.example;

import java.util.Collection;
import java.util.Iterator;

import static org.example.InputFromConsole.scanner;

public class Animal {

    public static String nameFamily;
    public static String nickname;
    public static String birthday;
    public static String command;


    public static Collection<Animal> addAnimal() {
        Collection<Animal> animal = new Collection<Animal>() {
            @Override
            public String toString(){
                return nameFamily + " " + nickname + " " + birthday + " " + command;
            }

            @Override
            public int size() {
                return 0;
            }

            @Override
            public boolean isEmpty() {
                return false;
            }

            @Override
            public boolean contains(Object o) {
                return false;
            }

            @Override
            public Iterator<Animal> iterator() {
                return null;
            }

            @Override
            public Object[] toArray() {
                return new Object[0];
            }

            @Override
            public <T> T[] toArray(T[] a) {
                return null;
            }

            @Override
            public boolean add(Animal animal) {
                return false;
            }

            @Override
            public boolean remove(Object o) {
                return false;
            }

            @Override
            public boolean containsAll(Collection<?> c) {
                return false;
            }

            @Override
            public boolean addAll(Collection<? extends Animal> c) {
                return false;
            }

            @Override
            public boolean removeAll(Collection<?> c) {
                return false;
            }

            @Override
            public boolean retainAll(Collection<?> c) {
                return false;
            }

            @Override
            public void clear() {

            }
        };
        System.out.println("Введите класс животного: ");
        nameFamily = scanner.nextLine();
        System.out.println("Введите кличку животного: ");
        nickname = scanner.nextLine();
        System.out.println("Введите дату рождения животного: ");
        birthday = scanner.nextLine();
        System.out.println("Введите команды животного: ");
        command = scanner.nextLine();
        return animal;

    }



}
