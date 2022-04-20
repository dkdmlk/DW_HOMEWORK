1. user 패키지 생성

2. UserVO 클래스 생성 (main 함수 x)
```java
    package user;

//VO는 Value Objec의 약자.
//Value Object에는 필드변수,생성자,getter,setter만 존재함.
public class UserVO{
    private String ename; //직원 이름
    private String dname; //부서 이름
    private int sal;  //급여
    private int lv; //직원 레벨
    
    public UserVO(String ename, String dname, int sal){
        this.ename = ename;
        this.dname = dname;
        this.sal = sal;
    }
    //0. getter,setter 함수를 생성하시오. 

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}
}

```

3. UserService 클래스 생성 (main 함수 x)
```java
 package user;

import java.util.List;

public class UserService{

    //1. 부서이름이 DEVELOP인 사원 급여를 2배 인상하시오.
    public List<UserVO> updateSal(List<UserVO> list, String dname){
    	int doublup =0;
    	for(int i=0;i<list.size();++i) {
    		if(list.get(i).getDname().equals(dname)) {
    			list.get(i).setSal(list.get(i).getSal()*2);
    		}
    		System.out.println("문제1. 급여 : "+list.get(i).getSal()+" 부서: "+list.get(i).getDname());
    	}
        return list;
    }
    //2. 급여가 0 ~ 100 : 1 레벨, 101 ~ 1000 : 2 레벨, 1001 이상부터는 3 레벨로 수정하시오.
    public List<UserVO> updateLv(List<UserVO> list){
    	for(int i=0;i<list.size();++i) {
    		if(list.get(i).getSal() >= 0 && list.get(i).getSal() <= 100) {
    			list.get(i).setLv(1);
    		}
    		if(list.get(i).getSal() >= 101 && list.get(i).getSal() <= 1000) {
    			list.get(i).setLv(2);
    		}
    		if(list.get(i).getSal() >= 1001) {
    			list.get(i).setLv(3);
    		}
    		System.out.println("문제2. 급여 : "+list.get(i).getSal()+" 레벨 : "+list.get(i).getLv());
    	}
        return list;
    }
    //3. 레벨 3이상 직원을 모두 해고하시오.
    public List<UserVO> deleteUser(List<UserVO> list, int lv){
    for(int i=0; i<list.size();++i) {
    		if(list.get(i).getLv() == lv) {
    			System.out.println("문제3. 해고된 사원 이름 : "+list.remove(i).getEname());
    		}
    	}
        return list;
    }
    //4. 이름이 King인 직원의 모든 정보 조회.
    public UserVO selectUserByEname(List<UserVO> list, String ename){
    	for(int i=0; i<list.size();++i) {
    		if(list.get(i).getEname().equals(ename)) {
    			System.out.println("문제4. 이름 : "+list.get(i).getEname()+" 부서 : "+list.get(i).getDname()+ " 급여 : "+list.get(i).getSal() + " 레벨 : "+list.get(i).getLv());
    		}
    	}
        return null;
    }

}

```

4. MainController 클래스 생성 (main 함수 o)
```java
package user;

import java.util.ArrayList;
import java.util.List;

public class MainController{
    public static void main(String args[]){
        
        List<UserVO> list = new ArrayList<UserVO>();
        list.add(new UserVO("Alex","DEVELOP",200));
        list.add(new UserVO("Max","DEVELOP",80));
        list.add(new UserVO("Brian","DEVELOP",100));
        list.add(new UserVO("mr.Hyun","MANAGER",300));
        list.add(new UserVO("Allen","DEVELOP",110));
        list.add(new UserVO("Katter","DEVELOP",220));
        list.add(new UserVO("Hooker","MANAGER",1500));
        list.add(new UserVO("King","MASTER",0));
        //여기서 문제 풀 것
        UserService us = new UserService();
        us.updateSal(list, "DEVELOP");
        us.updateLv(list);
        us.deleteUser(list, 3);
        us.selectUserByEname(list, "King");
        
    }
}

```

