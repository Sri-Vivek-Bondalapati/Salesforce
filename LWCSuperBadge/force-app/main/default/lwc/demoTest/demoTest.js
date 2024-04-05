
import { LightningElement, api} from 'lwc';

/** Custom labels Import **/



/** Custom class Import **/

/** Define constants for CSS classes **/
const SELECTED_TAB = 'slds-context-bar__item slds-is-active';
const UNSELECTED_TAB = 'slds-context-bar__item';
export default class demoTest extends LightningElement {


    /* API PROPERTIES */

/**
 * @description Used to set the default selected tab.
 * @type {String}
 */
    
@api selectedNav;


    /* OTHER PROPERTIES */

/**
 * @description Used to detect if the user is an authenticated or unauthenticated user.
 * @type {Boolean}
 */
isGuestUser;


/** Custom labels **/

labels = {
    GM_Home,
    GM_My_Dashboard,
    GM_Contact_Us,
    GM_Application,
    GM_Award,
    GM_Home_Page_Url,
    GM_My_Dashboard_Url,
    GM_Contact_Us_Url
};


/** LifeCycle Hook **/
 connectedCallback(){
    //async function
    this.loadUserDetails();
}

/** This is an async function used to determine if the user is authenticated or unauthenticated */
loadUserDetails = async() => {
    this.isGuestUser = await DataStore.getIsGuestUser();
}


    /********/
    /** GETTERS **/
    /********/

    //gets HOME as selected tab and makes it the active tab
    get isHomeSelected() {
        return this.selectedNav == 'HOME' ? SELECTED_TAB : UNSELECTED_TAB;
    }

     //gets MY DASHBOARD as selected tab and makes it the active tab
    get isDashboardSelected() {
        return this.selectedNav == 'MY_DASHBOARD'? SELECTED_TAB : UNSELECTED_TAB;
    }

     //gets CONTACT US as selected tab and makes it the active tab
    get isContactUsSelected() {
        return this.selectedNav == 'CONTACT_US'? SELECTED_TAB : UNSELECTED_TAB;
    }
 
    //getter to determine if the user has chosen Application or Award
    get showAdditionalNavItem(){
        return this.selectedNav == 'APPLICATION' || this.selectedNav == 'AWARD';
    }

    //getter to return the labels as per the tab selection
    get additionalNavItemLabel() {
        if(this.selectedNav == 'APPLICATION'){
            return this.labels.GM_Application;
        } else if(this.selectedNav == 'AWARD'){
            return this.labels.GM_Award;
        } else{
            return ''; // default value setting to empty if neither are returned.
        }
    }

    //getter to return if either Application or Award has been chosen and displaying the labels and selection accordingly
    get isAdditionalNavItemSelected() {
        return {
            showAdditionalNavItem: this.showAdditionalNavItem,
            class: this.selectedNav == 'APPLICATION' || this.selectedNav == 'AWARD' ? SELECTED_TAB : UNSELECTED_TAB,
            additionalNavItemLabel : this.additionalNavItemLabel
        };
    }

    /********/
    /** HANDLERS **/
    /********/

    //handles navigation between multiple tabs based on the data set name given
    handleNavigation(event) {
        const selectedNavItem = event.currentTarget.dataset.name;
        this.selectedNav = selectedNavItem;
    }
}