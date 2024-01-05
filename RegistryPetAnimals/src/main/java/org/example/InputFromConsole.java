package org.example;

import java.util.Scanner;

public interface InputFromConsole {

    static Scanner scanner = new Scanner(System.in);


    public static String processInput(String message) {
        System.out.print(message);
        return scanner.nextLine();
    }



}
