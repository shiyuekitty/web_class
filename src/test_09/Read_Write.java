package test_09;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
public class Read_Write {
    public static void main(String[] args) throws FileNotFoundException, IOException {

        try (
                FileInputStream inputStream = new FileInputStream(new File("e:/new/abc.txt"));

                InputStreamReader streamReader = new InputStreamReader(inputStream);

                BufferedReader reader = new BufferedReader(streamReader);

                FileOutputStream outputStream = new FileOutputStream(new File("e:/new/output.txt"));

                OutputStreamWriter streamWriter = new OutputStreamWriter(outputStream);

                BufferedWriter writer = new BufferedWriter(streamWriter);

        ) {

            int count = 1;

            String line = null;

            while ((line = reader.readLine()) != null) {
                writer.write(count++ + ": " + line);
                writer.newLine();
            }
        }

        System.out.println("done.");
    }
}




