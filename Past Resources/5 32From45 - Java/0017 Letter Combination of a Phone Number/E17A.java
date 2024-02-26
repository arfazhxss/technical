import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class E17A {
    public static List<String> func (String first, String second, String third, String fourth, int size) {
        List<String> list2 = new LinkedList<String>();
        String[] a = {"a", "b", "c"};
        String[] b = {"d","e","f"};
        String[] c = {"g","h","i"};
        String[] d = {"j","k","l"};
        String[] e = {"m","n","o"};
        String[] f = {"p","q","r","s"};
        String[] g = {"t","u","v"};
        String[] h = {"w","x","y","z"};
        String[] blockC = {""};

        String[] one = new String[size];
        String[] two = new String[size];
        String[] three = new String[size];
        String[] four = new String[size];

        switch (first) {
            case "2": one = a; break;
            case "3": one = b; break;
            case "4": one = c; break;
            case "5": one = d; break;
            case "6": one = e; break;
            case "7": one = f; break;
            case "8": one = g; break;
            case "9": one = h; break;
        }
        switch (second) {
            case "1": two = blockC; break;
            case "2": two = a; break;
            case "3": two = b; break;
            case "4": two = c; break;
            case "5": two = d; break;
            case "6": two = e; break;
            case "7": two = f; break;
            case "8": two = g; break;
            case "9": two = h; break;
        }        
        switch (third) {
            case "1": three = blockC; break;
            case "2": three = a; break;
            case "3": three = b; break;
            case "4": three = c; break;
            case "5": three = d; break;
            case "6": three = e; break;
            case "7": three = f; break;
            case "8": three = g; break;
            case "9": three = h; break;
        }        
        switch (fourth) {
            case "1": four = blockC; break;
            case "2": four = a; break;
            case "3": four = b; break;
            case "4": four = c; break;
            case "5": four = d; break;
            case "6": four = e; break;
            case "7": four = f; break;
            case "8": four = g; break;
            case "9": four = h; break;
        }

        for (int k=0; k<one.length; k++) {
            for (int l=0; l<two.length; l++) {
                for (int m=0; m<three.length; m++) {
                    for (int n=0; n<four.length; n++) {
                        list2.add(one[k]+two[l]+three[m]+four[n]);
                    }
                }
            }
        }
        System.out.println(list2.toString());

        return list2;
    }


    public static List<String> letterCombinations(String digits) {
        List<String> onlyList = new LinkedList<String>();
        String[] newArr = digits.split("");
        
        boolean cond = false;
        switch (digits) {
            case "2": cond=true; break;
            case "3": cond=true; break;
            case "4": cond=true; break;
            case "5": cond=true; break;
            case "6": cond=true; break;
            case "7": cond=true; break;
            case "8": cond=true; break;
            case "9": cond=true; break;
        }
        if ((newArr.length==1)&&(cond==true)) {return func(digits, "1", "1", "1",1);}
        else if ((newArr.length==1)&&(cond==false)) {return func("1", "1", "1", "1",0);}
        else if (newArr.length==2) {return func(newArr[0],newArr[1],"1","1",2);}
        else if (newArr.length==3) {return func(newArr[0],newArr[1],newArr[2],"1",3);}
        else if (newArr.length==4) {return func(newArr[0],newArr[1],newArr[2],newArr[3],4);}
        return null;
    }

    public static void main (String[] args) {
        System.out.println("Result:\t\t"+letterCombinations(""));
    }
}