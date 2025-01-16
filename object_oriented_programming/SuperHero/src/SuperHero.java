public class SuperHero {
	private String name;
	private int numLivesSaved;
	private String sideKickName;
	
	public void setName(String n) {
		name = n;
	}
	
	public void setNumLivesSaved(int n) {
		numLivesSaved = n;
	}
	
	public void setSideKickName(String sk) {
		sideKickName = sk;
	}
	
	public String getName() {
		return name;
	}
	
	public int getNumLivesSaved() {
		return numLivesSaved;
	}
	
	public String getSideKickName() {
		return sideKickName;
	}
}