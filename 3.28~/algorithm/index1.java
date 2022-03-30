package 문제2;

public class 버블함수 {

	public static void main(String[] args) {
		//자바스크립트 or 자바 선택해서 풀 것!
		// 버블정렬을 이용하여 오름차순으로 정렬하고 총 몇회전 했는지 알아내시오.
		int array[] = {1, 10, 4, 3, 5};
		int count = 0; //총 몇회전 했는지 알아내는 변수
		int temp = 0;
		for(int i=0; i<array.length;++i) {
			++count;
			for(int j = 0; j<array.length;++j) {
				if(array[i] < array[j]) {
					temp = array[i];
					array[i] = array[j];
					array[j] = temp;
				}
			}
		}
		for(int i : array) {
		    System.out.print(i+" ");
		}
		
		System.out.println("회전값"+count);
		
		

	}

}
