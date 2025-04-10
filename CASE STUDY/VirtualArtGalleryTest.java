import dao.VirtualArtGalleryImpl;
import entity.Artwork;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class VirtualArtGalleryTest {

    @Test
    void testAddArtwork() {
        Artwork a = new Artwork(0, "Test Title", "Test Desc", "2022-01-01", "Oil", "url", 1);
        VirtualArtGalleryImpl dao = new VirtualArtGalleryImpl();
        assertTrue(dao.addArtwork(a));
    }
}