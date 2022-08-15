import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class E17 {
    public static List<String> funcTwo (String num1, String num2) {
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

        String[] one = new String[1];
        String[] two = new String[1];

        switch (num1) {
            case "2": one = a; break;
            case "3": one = b; break;
            case "4": one = c; break;
            case "5": one = d; break;
            case "6": one = e; break;
            case "7": one = f; break;
            case "8": one = g; break;
            case "9": one = h; break;
        }
        switch (num2) {
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

        for (int k=0; k<one.length; k++) {
            for (int l=0; l<two.length; l++) {
                list2.add(one[k]+two[l]);
            }
        }

        return list2;
    }


    public static List<String> letterCombinations(String digits) {
        List<String> listOne = new LinkedList<String>();
        List<String> finaList = new LinkedList<String>();
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
        // System.out.println(newArr.length);
        // System.out.println(Arrays.toString(newArr));

        if ((newArr.length==2)) {
            // for (int i=0; i<newArr.length; i++) {
            //     for (int j=0;(j<newArr.length);j++) {
            //         if ((j>i)&&(i!=j)) {
            //             listOne.add(newArr[i]+newArr[j]);
            //         }
            //     }
            // }
            // System.out.println(listOne.toString());
            // Iterator<String> iterOne = listOne.iterator();
            // while (iterOne.hasNext()) {
            //     List<String> newList = new LinkedList<String>();
            // String[] tempStr = iterOne.next().split("");
            //     newList = funcTwo(tempStr[0], tempStr[1]);
            //     finaList.addAll(newList);
            // }
            return funcTwo("2", "3");
        } else if (cond==true) {finaList = funcTwo(digits, "1");}
        // else if ()
        
        return finaList;
    }

    public static void main (String[] args) {
        System.out.println("Result:\t\t"+letterCombinations("234"));
    }
}