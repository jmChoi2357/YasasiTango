package com.yasasitango.www.jungwooJava;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.protobuf.ByteString;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class FindTextToImage {
public static void main(String... args) throws Exception {
 // Initialize client that will be used to send requests. This client only needs to be created
 // once, and can be reused for multiple requests. After completing all of your requests, call
 // the "close" method on the client to safely clean up any remaining background resources.
 try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {

   // The path to the image file to annotate
   String fileName = "C:\\Spring\\image\\wakeupcat.jpg";

   // Reads the image file into memory
   Path path = Paths.get(fileName);
   byte[] data = Files.readAllBytes(path);
   ByteString imgBytes = ByteString.copyFrom(data);

   // Builds the image annotation request
   List<AnnotateImageRequest> requests = new ArrayList<>();
   Image img = Image.newBuilder().setContent(imgBytes).build();
   Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
   AnnotateImageRequest request =
       AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
   requests.add(request);

   // Performs label detection on the image file
   BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
   List<AnnotateImageResponse> responses = response.getResponsesList();

   for (AnnotateImageResponse res : responses) {
     if (res.hasError()) {
       System.out.format("Error: %s%n", res.getError().getMessage());
       return;
     }

     for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
         annotation
             .getAllFields();
          
       }
   }
 }
}

public static void detectText() throws IOException {
    // TODO(developer): Replace these variables before running the sample.
    String filePath = "C:\\Spring\\image\\korona.jpg"; 
    detectText(filePath);
  }

  // Detects text in the specified image.
  public static void detectText(String filePath) throws IOException {
    List<AnnotateImageRequest> requests = new ArrayList<>();
    String result = "";

    ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

    Image img = Image.newBuilder().setContent(imgBytes).build();
    Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
    AnnotateImageRequest request =
        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
    requests.add(request);

    // Initialize client that will be used to send requests. This client only needs to be created
    // once, and can be reused for multiple requests. After completing all of your requests, call
    // the "close" method on the client to safely clean up any remaining background resources.
    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
      List<AnnotateImageResponse> responses = response.getResponsesList();

      for (AnnotateImageResponse res : responses) {
        if (res.hasError()) {
          System.out.format("Error: %s%n", res.getError().getMessage());
          return;
        }

        // For full list of available annotations, see http://g.co/cloud/vision/docs
        for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
          System.out.format("Text: %s%n", annotation.getDescription());
          result += annotation.getDescription();
          //System.out.format("Position : %s%n", annotation.getBoundingPoly());
        }
        System.out.println("결과: " + result);
      }
    }
  }
  
  
  public static void detectTextGcs() throws IOException {
	    // TODO(developer): Replace these variables before running the sample.
	    String filePath = "https://3.bp.blogspot.com/-Ysg9gD0BSWg/UNrdB2zjPMI/AAAAAAAAJkA/3v15_io6FmQ/s320/banner_food_cooking.jpg";
	    detectTextGcs(filePath);
	  }

	  // Detects text in the specified remote image on Google Cloud Storage.
	  public static void detectTextGcs(String gcsPath) throws IOException {
	    List<AnnotateImageRequest> requests = new ArrayList<>();
	    String result = "";
	    //ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(gcsPath).build(); 이건 gs주소용 일반주소는 setImageUri
	    ImageSource imgSource = ImageSource.newBuilder().setImageUri(gcsPath).build();
	    Image img = Image.newBuilder().setSource(imgSource).build();
	    Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
	    AnnotateImageRequest request =
	        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	    requests.add(request);

	    // Initialize client that will be used to send requests. This client only needs to be created
	    // once, and can be reused for multiple requests. After completing all of your requests, call
	    // the "close" method on the client to safely clean up any remaining background resources.
	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responses = response.getResponsesList();

	      for (AnnotateImageResponse res : responses) {
	        if (res.hasError()) {
	          System.out.format("Error: %s%n", res.getError().getMessage());
	          return;
	        }

	        // For full list of available annotations, see http://g.co/cloud/vision/docs
	        for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
	          System.out.format("Text: %s%n", annotation.getDescription());
	          System.out.format("Position : %s%n", annotation.getBoundingPoly());
	          result += annotation.getDescription();
	        }
	        System.out.println("결과: " + result);
	      }
	    }
	  }

}
