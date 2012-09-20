public class TestServiceCloudConsoleConfigurer {
   public static testMethod void testRunAs() {
        
        User u1 = [SELECT Id FROM User WHERE Alias='KKarn'];
            System.RunAs(u1){
            
            Accordion__c a = new Accordion__c ();
            a.Tab1__c = 'Case';    
            a.Tab2__c = 'Contact'; 
            a.Tab3__c = 'Opportunity'; 
            a.Tab4__c = 'Activity History'; 
            a.Tab5__c = 'Open Activities'; 
            insert a;
            
           
            ApexPages.currentPage().getParameters().put('id', '0019000000F7OgK');

          SSELeftBarCustomizeController sse = new SSELeftBarCustomizeController();
            
          }  
          
          
          
   }
}