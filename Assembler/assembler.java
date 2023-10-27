
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Scanner;

 public class assembler {

     public static void main(String[] args) throws IOException {
    	  String[] data = null ;
    	  String data_str ="";
    	  
    	  // ------------------ Read file -------------------
    	  try {

    		  FileReader file_reader = new FileReader("C:\\Users\\user\\eclipse-workspace\\CPU\\src\\AsseblyCode.txt");
             
    		  Scanner sc = new Scanner(file_reader );
    		  
    		  int i = 0;
    		  while (sc.hasNextLine()) {
    			  
    			  data_str += sc.nextLine() + ";";
    		  }
    		  
    		  data = data_str.split(";");

    	  } catch (IOException e) {
    		  e.printStackTrace();
    	  }
    	  
    	  System.out.println("Binary Code :\n");
         
    	  int index = 0;
    	  String oprator ="",
    			 operand1 ="",
    			 operand2 ="";
    	  
    	  
	  for(int i = 0; i < data.length; i++){
		  
		  String[] segment = data[i].split(" "); 
		  
		  // ----------------- LOAD ----------------
		  if(segment[0].equals("Load")){
    			
			  	oprator = "00";// OPcode
			  	
          		switch (segment[1]) {
  				case "R0,":
  					operand1 = "00";
  					break;
  				case "R1,":
  					operand1 = "01";
  					break;
  				case "R2,":
  					operand1 = "10";
  					break;
  				case "R3,":
  					operand1 = "11";
  					break;
  				
  				default:
  					break;
  				}
        		
        		  System.out.println("m(" + index + ") <= \"" + oprator + operand1 +"11" +"\" ;" );
        		  index++;
        		  String value = "000000" + (Integer.toBinaryString(Integer.parseInt(segment[2]))).toString();
        		  System.out.println("m(" + index + ") <= \"" + value.substring(value.length() - 6, value.length() ) +"\" ;" );
        	
        	}
		  
		    // ----------------- ADD ----------------
        	else if(segment[0].equals("Add") ){
        		
        		oprator = "01";// OPcode
        		
        		switch (segment[1]) {
				case "R0,":
					operand1 = "00";
					break;
				case "R1,":
					operand1 = "01";
					break;
				case "R2,":
					operand1 = "10";
					break;
				case "R3,":
					operand1 = "11";
					break;
				
				default:
					break;
				}

        		switch (segment[2]) {
				case "R0":
					operand2 = "00";
					break;
				case "R1":
					operand2 = "01";
					break;
				case "R2":
					operand2 = "10";
					break;
				case "R3":
					operand2 = "11";
					break;
				
				default:
					operand2 ="00";
					break;
				}
        		
        		System.out.println("m(" + index + ") <= \"" + oprator + operand1 + operand2 +"\" ;" );
        	
        	}

		  
		    // ----------------- SUB ----------------
         	else if(segment[0].equals("Sub") ){
         		
         		oprator = "10";// OPcode
         		
        		switch (segment[1]) {
				case "R0,":
					operand1 = "00";
					break;
				case "R1,":
					operand1 = "01";
					break;
				case "R2,":
					operand1 = "10";
					break;
				case "R3,":
					operand1 = "11";
					break;
				
				default:
					break;
				}

        		switch (segment[2]) {
				case "R0":
					operand2 = "00";
					break;
				case "R1":
					operand2 = "01";
					break;
				case "R2":
					operand2 = "10";
					break;
				case "R3":
					operand2 = "11";
					break;
				
				default:
					operand2 ="00";
					break;
				}
        		
        		System.out.println("m(" + index + ") <= \"" + oprator + operand1 + operand2 +"\" ;" );
        		
        	
        	}
        		
		    // ----------------- JNZ ----------------
        	else if(segment[0].equals("Jnz")){
        		
        		oprator = "11";// OPcode
        		
        		switch (segment[1]) {
				case "R0,":
					operand1 = "00";
					break;
				case "R1,":
					operand1 = "01";
					break;
				case "R2,":
					operand1 = "10";
					break;
				case "R3,":
					operand1 = "11";
					break;
				
				default:
					break;
				}

        	  System.out.println("m(" + index + ") <= \"" + oprator + operand1 +"11" +"\" ;" );
       		  index++;
       		  String value = "000000" + (Integer.toBinaryString(Integer.parseInt(segment[2]))).toString();
       		  System.out.println("m(" + index + ") <= \"" + value.substring(value.length() - 6, value.length() ) +"\" ;" );
         	
        	}
        	else if(segment[0].equals("Hlt")){
        		System.out.println("m(" + index + ") <= \"" + "000000" +"\" ;" );
        		break;
        	}
        	index++;
         }
         System.out.println();
     }
 }