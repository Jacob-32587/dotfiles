import java.io.File;
import java.util.Scanner;

public class ArrayCollectionP1TestDriver {
    public static void main(String[] args) {
        var col = new ArrayCollection<String>();
        var testFile = new File("AnimalsPart.txt");
        Scanner testReader = null;
        try {
            testReader = new Scanner(testFile);
        } catch (Exception e) {
            testReader.close();
            System.exit(1);
        }
        testReader.nextLine();
    }
}
