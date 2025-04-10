package main;

import dao.VirtualArtGalleryImpl;
import entity.Artwork;
import java.util.*;

public class MainModule {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        VirtualArtGalleryImpl service = new VirtualArtGalleryImpl();

        while (true) {
            System.out.println("1. Add Artwork\n2. Update Artwork\n3. Exit");
            int choice = sc.nextInt();
            switch (choice) {
                case 1:
                    // Take input & call addArtwork
                    break;
                case 2:
                    // updateArtwork
                    break;
                case 3:
                    System.exit(0);
            }
        }
    }
}