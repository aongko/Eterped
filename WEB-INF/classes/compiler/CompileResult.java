package compiler;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class CompileResult {
	private File file;
	private String error;
	private byte[] result;
	public CompileResult(File res, String error) throws IOException {
		super();
		this.file = res;
		this.error = error;
		this.result = null;
		if (this.file != null) {
			initResult();
		}
	}
	
	private void initResult () throws FileNotFoundException, IOException {
		RandomAccessFile f = new RandomAccessFile(getFile(), "r");
		try {
			long longlength = f.length();
            int length = (int) longlength;
            if (length != longlength)
                throw new IOException("File size >= 2 GB");
            // Read file and return data
            this.result = new byte[length];
            f.readFully(result);
		}
		finally {
			f.close();
		}
		
	}
	
	public File getFile() {
		return file;
	}
	public String getError() {
		return error;
	}
	
	public byte[] getResult() {
		return result;
	}
}
