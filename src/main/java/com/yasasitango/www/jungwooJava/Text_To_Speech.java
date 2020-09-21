package com.yasasitango.www.jungwooJava;

//Imports the Google Cloud client library
import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.protobuf.ByteString;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.SourceDataLine;

/**
* Google Cloud TextToSpeech API sample application. Example usage: mvn package exec:java
* -Dexec.mainClass='com.example.texttospeech.QuickstartSample'
*/
public class Text_To_Speech {

/** Demonstrates using the Text-to-Speech API. */
public void speech(String say, String code) throws Exception {
         String langanguage = "ja-JP"; 	
	     if(code.equals("jp"))
	    	 langanguage = "ko-KR";
	     else
	    	 langanguage = "ja-JP";
		 // Instantiates a client
		 try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
		   // Set the text input to be synthesized
		   SynthesisInput input = SynthesisInput.newBuilder().setText(say).build();

		   // Build the voice request, select the language code ("en-US") and the ssml voice gender
		   // ("neutral")
		   VoiceSelectionParams voice =
		       VoiceSelectionParams.newBuilder()
		           .setLanguageCode(langanguage)
		           .setSsmlGender(SsmlVoiceGender.NEUTRAL)
		           .build();

		   // Select the type of audio file you want returned
		   AudioConfig audioConfig =
		       AudioConfig.newBuilder().setAudioEncoding(AudioEncoding.LINEAR16).build();

		   // Perform the text-to-speech request on the text input with the selected voice parameters and
		   // audio file type
		   SynthesizeSpeechResponse response =
		       textToSpeechClient.synthesizeSpeech(input, voice, audioConfig);

		   // Get the audio contents from the response
		   ByteString audioContents = response.getAudioContent();

		   // Write the response to the output file.
		   try (OutputStream out = new FileOutputStream("C:\\Spring\\voice\\voiceComplete.wav")) { //주소 지정
		     out.write(audioContents.toByteArray());
		     System.out.println("Audio content written to file \"voiceComplete.wav\"");
		   }
		 }

  }


  public void playSound() {
  	System.out.println("PlaySound 시작");
  	File file = new File("C:\\Spring\\voice\\voiceComplete.wav"); //주소 찾기
  	AudioInputStream audioInputStream = null;
  	SourceDataLine auline = null;
  	try {
  		audioInputStream = AudioSystem.getAudioInputStream(file);
  	} catch(Exception e) {
  		e.printStackTrace();
  	}
  	AudioFormat format = audioInputStream.getFormat();
  	DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);
  	try {
  		auline = (SourceDataLine) AudioSystem.getLine(info);
  		auline.open();
  	} catch(Exception e) {
  		e.printStackTrace();
  		return;
  	}
  	auline.start();
  	
  	int nByteRead = 0;
  	final int EXTERNAL_BUFFER_SIZE = 524288;
  	byte[] abData = new byte[EXTERNAL_BUFFER_SIZE];
  	
  	try {
  		while (nByteRead != -1) {
  			nByteRead = audioInputStream.read(abData, 0, abData.length);
  			System.out.println("nByteRead: " + nByteRead);
  			if(nByteRead >= 0)
  				auline.write(abData, 0, nByteRead);
  		}
  	} catch(Exception e) {
  		e.printStackTrace();
  	} finally {
  		System.out.println("PlaySound 종료");
  		auline.drain();
  		auline.close();
  	}
  }
}
