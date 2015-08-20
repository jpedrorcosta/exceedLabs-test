
public class Solution {

	public static double closestToZero(double[] ts){
		
		double result;
		
		if(ts.length == 0) return 0;
		else{
			result = ts[0];
			for(int i = 1; i < ts.length; i++){
				if(ts[i] > -274 && ts[i] < 5527){
					if(Math.abs(ts[i]) < Math.abs(result)){
						result = ts[i];
					}
				}
			}
		}			
		return result;
	}
	
	
}
