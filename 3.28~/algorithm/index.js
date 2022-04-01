// 자바스크립트 or 자바 선택해서 풀 것!
// 버블정렬을 이용하여 오름차순으로 정렬하고 총 몇회전 했는지 알아내시오.
let array = [1, 10, 4, 3, 5];
let count = 0; //총 몇회전 했는지 알아내는 변수
//let, var 차이
//var는 중복을허용 ,let은 중복을허용x
let temp = 0;

// let isSwap = null; //처음부터 정렬이되어 있을경우

let len = array.length;
for (let i = len; i > 0; --i) { //outer -for
    for (let j = 0; j < (i - 1); ++j) { //inner -for
        // isSwap = false;
        if (array[j] > array[j + 1]) { 
            temp = array[j];//큰수
            array[j] = array[j + 1];
            array[j + 1] = temp;
            ++count;
            //isSwap = true;
        }
    }
    /*if (!isSwap) {//false경우 black;
        break;
    }*/
}
 console.log(array);
 console.log(count);
//54321
//4321
//