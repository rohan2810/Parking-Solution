package dao;

import Utils.Util;

import java.util.Random;

public class Test {
    public static void main(String[] args) {
        int num = 05;
        String n = String.valueOf(num);
        System.out.println(num);
        Random rnd = new Random();
        int number = rnd.nextInt(9999);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(15);
        stringBuilder.append(String.format("%04d", number));

        System.out.println(stringBuilder.toString());
    }

}
