import java.io.File;
import java.util.Scanner;

public class ArrayCollectionP1TestDriver {
    public static void main(String[] args) {
        var col = new ArrayCollection<String>();
        var testFile = new File("AnimalsPart.txt");
        Scanner testReader = null;
        var iReader = new Scanner(System.in);
        try {
            testReader = new Scanner(testFile);
        } catch (Exception e) {
            testReader.close();
            System.exit(1);
        }
        while(testReader.hasNext()) {
            col.add(testReader.nextLine());
        }
        System.out.println(col.toString());
        var animalToCount = iReader.nextLine();
        var animalToRemove = iReader.nextLine();
    }
}
