import { LightningElement } from 'lwc';

export default class Mylwc extends LightningElement {
    submit=false;
    value;
    toggle(){
        this.submit =true;
    }
    handleChange(event){
        this.value = event.target.value;
    }
}