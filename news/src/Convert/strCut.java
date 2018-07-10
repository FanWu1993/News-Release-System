package Convert;

public class strCut {
	public String strcut(String s,int i){
		int j=s.length();
		if(j>i)
			s=s.substring(0,i)+"....";
		return s;
	}

}
