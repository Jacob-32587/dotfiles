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
        System.out.println("Enter the name of an animal that you want to count:");
        var animalToCount = iReader.nextLine();
        System.out.println("Enter the name of an animal that you want to remove:");
        var animalToRemove = iReader.nextLine();
        System.out.println("The collection after removing.\n Collection:");
        System.out.println(col.toString());
    }
}
