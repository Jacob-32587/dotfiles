import java.io.File;
import java.util.Scanner;

public class SortedArrayCollectionP2TestDriver {
    public static void main(String[] args) {
        var col = new SortedArrayCollection<String>();
        var testFile = new File("AnimalsPart.txt");
        Scanner testReader = null;
        var iReader = new Scanner(System.in);
        try {
            testReader = new Scanner(testFile);
        } catch (Exception e) {
            System.out.print(e.toString());
            System.exit(1);
        }
        while(testReader.hasNext()) {
            col.add(testReader.nextLine());
        }
        System.out.println(col.toString());
        System.out.println("Enter the name of an animal that you want to count:");
        var animalToCount = iReader.nextLine();
        System.out.println("The animal name " + animalToCount + " appears " + col.count(animalToCount) + " times.");
        System.out.println("Enter the name of an animal that you want to remove:");
        var animalToRemove = iReader.nextLine();
        col.removeAll(animalToRemove);
        System.out.println("The collection after removing.\n Collection:");
        System.out.println(col.toString());
        iReader.close();
        testReader.close();
    }
}
