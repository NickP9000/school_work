
public class SearcherTest {

	public static void main(String[] args) {
		
		GenericArraySearcher<String> stringSearch = new GenericArraySearcher<>();
		String[] sArr = {"apple", "potato", "agriculture", "eggplant", "orange"};
		System.out.println(stringSearch.findMin(sArr));
		System.out.println(stringSearch.findMax(sArr));
		System.out.println(stringSearch.find("act", sArr));
		
		GenericArraySearcher<Integer> intSearch = new GenericArraySearcher<>();
		Integer[] iArr = {100, 11, 15, 6, 9, 27, 16, -10};
		System.out.println(intSearch.findMin(iArr));
		System.out.println(intSearch.findMax(iArr));
		System.out.println(intSearch.find(100, iArr));
		
		GenericArraySearcher<Double> doubleSearch = new GenericArraySearcher<>();
		Double[] dArr = {400.54, 10.5, 11.3, 15.55, 6.66, 9.5, 27.1643, 16.3456, -10.123};
		System.out.println(doubleSearch.findMin(dArr));
		System.out.println(doubleSearch.findMax(dArr));
		System.out.println(doubleSearch.find(10.5, dArr));

	}

}
