// imports
// import getBoatTypes from the BoatDataService => getBoatTypes method';
import { LightningElement,wire, } from "lwc";
// imports
import getBoatTypes from '@salesforce/apex/BoatDataService.getBoatTypes'
// import getBoatTypes from the BoatDataService => getBoatTypes method';
export default class BoatSearchForm extends LightningElement {
  selectedBoatTypeId = '';
  
  // Private
  error = undefined;
  
  searchOptions;
  
  // Wire a custom Apex method
    @wire(getBoatTypes)
    boatTypes({ error, data }) {
    if (data) {
      this.searchOptions = data.map(type => {
        return { label:type.Name , value:type.Id};
      });
      console.log('this.searchOptions'+this.searchOptions)
      this.searchOptions.unshift({ label: 'All Types', value: '' });
    } else if (error) {
      this.searchOptions = undefined;
      this.error = error;
    }
  }
  
  // Fires event that the search option has changed.
  // passes boatTypeId (value of this.selectedBoatTypeId) in the detail
  handleSearchOptionChange(event) {
    this.selectedBoatTypeId = event.detail.value

    const searchEvent = new CustomEvent('search',{
      detail:{
        boatTypeId: this.selectedBoatTypeId
      }
    })
    // Create the const searchEvent
    // searchEvent must be the new custom event search
    
    this.dispatchEvent(searchEvent);
  }
}