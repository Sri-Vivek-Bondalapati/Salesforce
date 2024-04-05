import { LightningElement, track } from 'lwc';

export default class PapaComponent extends LightningElement {
    @track showBeta = false;
    @track papaClass = '';
    @track childClass ='';

    handleShowBeta() {
        this.showBeta = true;
        this.childClass = 'slide-in';
    }

    handleBetaClose() {
        this.showBeta = false;
        this.papaClass = 'slide-out';
    }
}