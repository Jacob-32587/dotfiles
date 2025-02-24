import java.io.File;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class Problem3AnimalCount {
    public static void main(String[] args) {
        var col = new ArrayCollection<String>();
        var testFile = new File("Animals.txt");
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
        
        var rand = new Random();
        char randChar = (char) (rand.nextInt(26) + 'A');
        var enteredAnimals = new ArrayList<String>();

        System.out.println("Enter names of animals that begin with the character: " + randChar);
        while(iReader.hasNext()) {
            enteredAnimals.add(iReader.nextLine());
        }
        System.out.println("The animal name " + animalToCount + " appears " + col.count(animalToCount) + " times.");
        System.out.println("Enter the name of an animal that you want to remove:");
        var animalToRemove = iReader.nextLine();
        col.removeAll(animalToRemove);
        System.out.println("The collection after removing.\nCollection:");
        System.out.println(col.toString());
        iReader.close();
        testReader.close();
    }
}
