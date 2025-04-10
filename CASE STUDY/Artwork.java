package entity;

public class Artwork {
    private int artworkID;
    private String title;
    private String description;
    private String creationDate;
    private String medium;
    private String imageURL;
    private int artistID;

    public Artwork() {}

    public Artwork(int artworkID, String title, String description, String creationDate, String medium, String imageURL, int artistID) {
        this.artworkID = artworkID;
        this.title = title;
        this.description = description;
        this.creationDate = creationDate;
        this.medium = medium;
        this.imageURL = imageURL;
        this.artistID = artistID;
    }

    // Getters and Setters
}