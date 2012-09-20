trigger updateOrder on Accordion__c (before insert, after insert, after update) {

    for(Accordion__c a : Trigger.new){
        
        
        if(trigger.isUpdate || trigger.isInsert  ){
            List<PageBlock_Order__c> tobeDeletedRecords = [select id,name from PageBlock_Order__c];
            delete tobeDeletedRecords;
        }
        if(Trigger.isBefore && trigger.isInsert  ){
            List<Accordion__c > deleteExistingAccordionRecords= [select Field1__c,Field2__c,Field3__c,Field4__c,Field5__c,Field6__c,Field7__c,Field8__c,Field18__c,Field9__c,Field10__c,Field11__c,Field12__c,Field13__c,Field14__c,Field15__c,Field16__c,Field17__c,Field19__c,Field20__c from Accordion__c ];
            delete deleteExistingAccordionRecords;
        }
        
        if(a.tab1__c!=null){
            PageBlock_Order__c pbo = new PageBlock_Order__c();
            pbo.Name = a.tab1__c;
            pbo.Order__c = 1;
            insert pbo;
            
            updateSpecialCase(pbo,pbo.id,a.tab1__c);
        }
        
        if(a.tab2__c!=null){
            PageBlock_Order__c pbo1 = new PageBlock_Order__c();
            pbo1.Name = a.tab2__c;
            pbo1.Order__c = 2;
            insert pbo1;
            
            updateSpecialCase(pbo1,pbo1.id,a.tab2__c);
        }
        if(a.tab3__c!=null){
            PageBlock_Order__c pbo2 = new PageBlock_Order__c();
            pbo2.Name = a.tab3__c;
            pbo2.Order__c = 3;
            insert pbo2;
            
            updateSpecialCase(pbo2,pbo2.id,a.tab3__c);
        }
        if(a.tab4__c!=null){
            PageBlock_Order__c pbo3 = new PageBlock_Order__c();
            pbo3.Name = a.tab4__c;
            pbo3.Order__c = 4;
            insert pbo3;
            
            updateSpecialCase(pbo3,pbo3.id,a.tab4__c);
        }
        if(a.tab5__c!=null){
            PageBlock_Order__c pbo4 = new PageBlock_Order__c();
            pbo4.Name = a.tab5__c;
            pbo4.Order__c = 5;
            insert pbo4;
            
            updateSpecialCase(pbo4,pbo4.id,a.tab5__c);
        }
    
    }
    
    public void updateSpecialCase(PageBlock_Order__c pbo,String Id,String objectName){
        if(objectName == 'Open Activities'){
            PageBlock_Order__c pbUpdate = new PageBlock_Order__c(id=Id);
            pbUpdate.Special_Case__c = 'OA';
            update pbUpdate;
        }
    }

}