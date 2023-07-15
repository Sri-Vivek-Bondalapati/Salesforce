public class actionpollerDemoController {
public  Integer count{get;set;}
  public actionpollerDemoController(){
   count = 0;
  }
 
  public void callMethod(){
    count = count + 1;
  }
}