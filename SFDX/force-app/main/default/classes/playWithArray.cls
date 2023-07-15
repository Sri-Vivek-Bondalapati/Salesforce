public class playWithArray {
    integer[] a =new integer[100];
        
     public void remove(integer key) {
        integer count =0;
        integer[] b =new integer[100];
        for(integer value:a)
        {
           if(value != key){
            b[count] =value;
               count++;
           } 
        }
        a=b;
         System.debug('iam in a class'+a);
    }
}