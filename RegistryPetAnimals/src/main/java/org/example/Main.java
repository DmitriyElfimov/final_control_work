package org.example;

import org.w3c.dom.css.Counter;

import java.util.*;

import static org.example.Animal.*;
import static org.example.InputFromConsole.scanner;

/**
 * Главный класс программы для управления реестром домашних животных.
 */
public class Main {
    private static final Map<Integer, Collection<Animal>> registry = new HashMap<Integer, Collection<Animal>>();
    private static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {

        Counter counter = new Counter() {
            @Override
            public String getIdentifier() {
                return null;
            }

            @Override
            public String getListStyle() {
                return null;
            }

            @Override
            public String getSeparator() {
                return null;
            }
        };
        try (Scanner in = new Scanner(System.in)) {
            while (true) {
                System.out.println("\nМеню:");
                System.out.println("1. Вывести список животных");
                System.out.println("2. Добавить новое животное");
                System.out.println("3. Увидеть список команд, которые выполняет животное");
                System.out.println("4. Обучить животное новым командам");
                System.out.println("5. Вывести количество животных");
                System.out.println("6. Выйти из программы");
                System.out.print("Выберите действие: ");
                int choice = scanner.nextInt();
                scanner.nextLine();
                switch (choice) {
                    case 1:
                        for (int i=0; i<registry.size(); i++)
                            System.out.println(registry);

                        break;
                    case 2:

                        Collection<Animal> animal = Animal.addAnimal();

                        registry.put(registry.size()+1, (Collection<Animal>) animal);



                        break;
                    case 3:
//                        System.out.println("Введите id животного: ");
//                        Integer n = scanner.nextInt();
//                        System.out.println(registry.values(command));


                        break;
                    case 4:
//                        System.out.println("Введите id животного: ");
//                        Integer m = scanner.nextInt();
//                        System.out.println("Введите команду животного: ");
//                        String commands = scanner.nextLine();
//                        registry.put(m, registry.values(nameFamily, nickname, birthday, command + commands));

                        break;
                    case 5:
                        System.out.println(registry.size());
                        break;
                    case 6:
                        System.out.println("Программа завершена.");
                        return;
                    default:
                        System.out.println("Некорректный выбор. Пожалуйста, выберите действие из меню.");
                }
            }
        }
    }
}