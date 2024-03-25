import java.io.File;
import java.util.Scanner;

public class ArrayCllectionP1TestDriver {
    public static void main(String[] args) {
        var testFile = new File("AnimalsPart.txt");
        Scanner testReader = null;
        try {
            testReader = new Scanner(testFile);
        } catch (Exception e) {
            System.exit(1);
        }
    }
}
