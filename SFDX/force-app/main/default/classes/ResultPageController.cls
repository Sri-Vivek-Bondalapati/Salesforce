public class ResultPageController {
    public static String Res{set;get;}
    public ResultPageController(){
         Res=ApexPages.currentPage().getParameters().get('Result');

}
}