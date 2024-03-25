import java.io.File;
import java.util.HashSet;
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
        
        int successCnt = 0;
        var rand = new Random();
        char randChar = (char) (rand.nextInt(26) + 'A');
        // Use hash set to prevent multiple guesses
        var enteredAnimals = new HashSet<String>();

        System.out.println("Enter names of animals that begin with the character: " + randChar);
        while(iReader.hasNext()) {
            enteredAnimals.add(iReader.nextLine().trim());
        }
        for(var enteredAnimal: enteredAnimals) {
            col.find(enteredAnimal);
            if(col.found == true) {
                successCnt++;
            }
        }
        System.out.println("You successfully entered 3 unique animal name(s) that start with");
        iReader.close();
        testReader.close();
    }
}
