package utils;

public class URLExtract {

    // Static method to extract value after "v="
    public static String getVideoId(String url) {
        if (url == null || !url.contains("v=")) {
            return null; // Return null if URL is invalid or doesn't contain "v="
        }

        // Find the starting index of "v=" and extract the substring
        int startIndex = url.indexOf("v=") + 2;
        int endIndex = url.indexOf("&", startIndex); // Check if there are additional parameters
        
        // If no additional parameters, return from "v=" to the end
        if (endIndex == -1) {
            return url.substring(startIndex);
        }
        
        // Otherwise, return the part between "v=" and "&"
        return url.substring(startIndex, endIndex);
    }
}
