package compiler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class Compiler {
	private static Runtime runtime = null;
	
	private static final String[] lang = {
		"c",
		"cpp",
		"java"
	};
	
	private static final String[] compileCommandFormat = {
		"C:\\MinGW\\bin\\gcc -w -o %s %s",
		"g++ -w -o %s %s",
		"javac %s"
	};
	
	public static int getLanguageIndex(String langName) {
		for (int i = 0; i < lang.length; i++) {
			if (lang[i].equalsIgnoreCase(langName)) return i; 
		}
		return -1;
	}
	
	public CompileResult compile(int langIdx, String src) throws IOException, InterruptedException {
		//write source to file with name lang[langIdx]
		FileWriter fw = null;
		
		String srcName, resName;
		
		if (langIdx < 2) {
			srcName = lang[langIdx] + "." + lang[langIdx];
			resName = lang[langIdx] + ".exe";
		}
		else {
			srcName = "Main.java";
			resName = "Main.class";
		}
		
		//write src to file srcName
		fw = new FileWriter(srcName);
		fw.write(src);
		fw.close();
		
		
		String cmd;
		if (langIdx < 2) {
			cmd = String.format(compileCommandFormat[langIdx], resName, srcName );
		}
		else cmd = String.format(compileCommandFormat[langIdx], srcName);
		System.out.println("cmd: ");
		System.out.println(cmd);

		//System.setProperty("user.dir", "D:\\");
		//execute compile command
		Process p = Runtime.getRuntime().exec(cmd);
		p.waitFor();

		//Get compiler messages
		BufferedReader reader = new BufferedReader(new InputStreamReader(p.getErrorStream()));
		
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
			sb.append("<br>");
		}
		
		String error = sb.toString();
		
		CompileResult ret = null;
		
		//If there are errors
		if (error.length() > 0) {
			System.out.println("error length: " + error.length());
			ret = new CompileResult(null, error);
		}
		else {
			//no errors..
			System.out.println("no error");
			File file;
			try {
				file = new File(resName);
				ret = new CompileResult(file, error);
			} catch (Exception e) {
				System.out.println("error cuy... "+error);
				// e.printStackTrace();
			}
		}
		return ret;
	}

	private static Runtime getRuntime() {
		if (runtime == null) runtime = Runtime.getRuntime();
		return runtime;
	}
}
