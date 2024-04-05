import { LightningElement} from 'lwc';

export default class BetaComponent extends LightningElement {
    handleClose() {
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}
