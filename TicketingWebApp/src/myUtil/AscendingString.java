package myUtil;

import java.util.Comparator;

public class AscendingString implements Comparator<String> {

	@Override
	public int compare(String a, String b) {
		return a.compareTo(b);
	}
	
}