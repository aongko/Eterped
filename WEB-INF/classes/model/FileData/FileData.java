package model.FileData;

public class FileData{
	int ownerid,parentid,dataid;
	String name,src,ownername;
	
	public void setDataID(int value){
		dataid = value;
	}
	
	public void setParentID(int value){
		parentid = value;
	}
	
	public void setName(String value){
		name = value;
	}
	
	public void setSrc(String value){
		src = value;
	}
	
	public void setOwnerID(int value){
		ownerid = value;
	}
	
	public void setOwnerName(String value){
		ownername = value;
	}
	
	public int getDataID(){
		return dataid;
	}
	
	public int getParentID(){
		return parentid;
	}
	
	public String getName(){
		return name;
	}
	
	public String getSrc(){
		return src;
	}
	
	public int getOwnerID(){
		return ownerid;
	}
	
	public String getOwnerName(){
		return ownername;
	}
}