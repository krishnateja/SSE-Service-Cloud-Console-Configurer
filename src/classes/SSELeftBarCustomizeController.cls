public class SSELeftBarCustomizeController {
    
    public String id;
    public Accordion__c acc {set;get;}
    
    Public List<SObject> varia1{set;get;}
    Public List<SObject> varia2{set;get;}
    Public List<SObject> varia3{set;get;}
    Public List<SObject> varia4{set;get;}
    Public List<SObject> varia5{set;get;}

    Public List<PageBlock_Order__c> pbo{set;get;} 
    public Map<String, String> columnsForCase {get; set;}

    Public String fieldsOnDemand;
    Public String framedFieldsOnDemand;   
    Public String isActivityHistory;  
 
    public SSELeftBarCustomizeController (){
         
         try{
         
             id = apexpages.currentpage().getparameters().get('id');
             pbo = [select id,name,order__C,Special_Case__c from PageBlock_Order__c ORDER BY order__C ASC ]; 
             acc = [select id,Tab1__c,Tab2__c,Tab3__c,Tab4__c,Tab5__c from Accordion__c limit 1];
                                    
             columnsForCase = new Map<String, String>();
                                       
             for(integer i=1; i<=pbo.size();i++){             
                 if(i==1){
                     if(pbo[i-1].name != null){                         
                             framedFieldsOnDemand = this.formFields(pbo[i-1].name,i,pbo[i-1].Special_Case__c);
                             String dynamicQuery = 'Select '+framedFieldsOnDemand+' from'+' '+pbo[i-1].name+' ' +'where AccountId= \''+id+'\''+isActivityHistory;
                             varia1 =  Database.query(dynamicQuery );
                     }    
                 }
                 if(i==2){
                     if(pbo[i-1].name != null){
                             framedFieldsOnDemand = this.formFields(pbo[i-1].name,i,pbo[i-1].Special_Case__c);
                             String dynamicQuery = 'Select '+framedFieldsOnDemand+' from'+' '+pbo[i-1].name+' ' +'where AccountId= \''+id+'\''+isActivityHistory;
                             varia2 =  Database.query(dynamicQuery );
                     }    
                 }
                 if(i==3){
                     if(pbo[i-1].name != null){
                             framedFieldsOnDemand = this.formFields(pbo[i-1].name,i,pbo[i-1].Special_Case__c);
                             String dynamicQuery = 'Select '+framedFieldsOnDemand+' from'+' '+pbo[i-1].name+' ' +'where AccountId= \''+id+'\''+isActivityHistory;
                             varia3 =  Database.query(dynamicQuery );
                     }    
                 }
                 if(i==4){
                     if(pbo[i-1].name != null){
                             framedFieldsOnDemand = this.formFields(pbo[i-1].name,i,pbo[i-1].Special_Case__c);
                             String dynamicQuery = 'Select '+framedFieldsOnDemand+' from'+' '+pbo[i-1].name+' ' +'where AccountId= \''+id+'\''+isActivityHistory;
                             varia4 =  Database.query(dynamicQuery );
                     }
                 }
                 if(i==5){
                     if(pbo[i-1].name != null){
                             framedFieldsOnDemand = this.formFields(pbo[i-1].name,i,pbo[i-1].Special_Case__c );
                             String dynamicQuery = 'Select '+framedFieldsOnDemand+' from'+' '+pbo[i-1].name+' ' +'where AccountId= \''+id+'\''+isActivityHistory;
                             varia5 =  Database.query(dynamicQuery );
                     }
                 }
             }
         
         }catch(Exception e){}                     
    }
   
   
    public String formFields(String objectName,Integer i,String specialCase){
        
        Accordion__c localCase = [select Field1__c,Field2__c,Field3__c,Field4__c,Field5__c,Field6__c,Field7__c,Field8__c,Field18__c,Field9__c,Field10__c,Field11__c,Field12__c,Field13__c,Field14__c,Field15__c,Field16__c,Field17__c,Field19__c,Field20__c from Accordion__c limit 1];
        if(objectName == 'Case'){            
            isActivityHistory ='';            
            
            if(localCase.Field1__c == null && localCase.Field2__c == null && localCase.Field3__c == null && localCase.Field4__c== null){
                columnsForCase.put(i+'1','id'  );
                columnsForCase.put(i+'2','subject'  );
                columnsForCase.put(i+'3','status' );
                columnsForCase.put(i+'4','origin'  );
                fieldsOnDemand = 'id,subject,status,origin';        
            }else{
                columnsForCase.put(i+'1',localCase.Field1__c  );
                columnsForCase.put(i+'2',localCase.Field2__c  );
                columnsForCase.put(i+'3',localCase.Field3__c  );
                columnsForCase.put(i+'4',localCase.Field4__c  );
                fieldsOnDemand = localCase.Field1__c+','+localCase.Field2__c+','+localCase.Field3__c+','+localCase.Field4__c;
            }
            
        }
        if(objectName == 'Opportunity'){    
            isActivityHistory ='';
           
            if(localCase.Field9__c == null && localCase.Field10__c == null && localCase.Field11__c == null && localCase.Field12__c== null){
                columnsForCase.put(i+'1','id'  );
                columnsForCase.put(i+'2','StageName'  );
                columnsForCase.put(i+'3','Probability'  );
                columnsForCase.put(i+'4','Type'  );
                fieldsOnDemand = 'id,StageName,Probability,Type';        
            }else{
                columnsForCase.put(i+'1',localCase.Field9__c  );
                columnsForCase.put(i+'2',localCase.Field10__c  );
                columnsForCase.put(i+'3',localCase.Field11__c  );
                columnsForCase.put(i+'4',localCase.Field12__c  );
                fieldsOnDemand = localCase.Field9__c+','+localCase.Field10__c+','+localCase.Field11__c+','+localCase.Field12__c;
            }
         }   
         if(objectName == 'Contact'){    
            isActivityHistory ='';
             
            if(localCase.Field5__c == null && localCase.Field6__c == null && localCase.Field7__c == null && localCase.Field8__c== null){
                columnsForCase.put(i+'1','id' );
                columnsForCase.put(i+'2','Name' );
                columnsForCase.put(i+'3','Email' );
                columnsForCase.put(i+'4','Phone' );
                fieldsOnDemand = 'id,Name,Email,Phone';        
            }else{
                columnsForCase.put(i+'1',localCase.Field5__c );
                columnsForCase.put(i+'2',localCase.Field6__c );
                columnsForCase.put(i+'3',localCase.Field7__c );
                columnsForCase.put(i+'4',localCase.Field8__c ); 
                fieldsOnDemand = localCase.Field5__c+','+localCase.Field6__c+','+localCase.Field7__c+','+localCase.Field8__c;
            }
         }
         if(objectName == 'Task' ){           
             if(specialCase=='OA'){ 
                
                isActivityHistory =  ' and status != \'Completed\'';
                if(localCase.Field13__c == null && localCase.Field14__c == null && localCase.Field15__c == null && localCase.Field16__c== null){
                    columnsForCase.put(i+'1','id' );
                    columnsForCase.put(i+'2','Subject' );
                    columnsForCase.put(i+'3','Status' );
                    columnsForCase.put(i+'4','Priority' );
                    fieldsOnDemand = 'id,Subject,Status,Priority';               
                }else{
                    columnsForCase.put(i+'1',localCase.Field17__c );
                    columnsForCase.put(i+'2',localCase.Field18__c );
                    columnsForCase.put(i+'3',localCase.Field19__c );
                    columnsForCase.put(i+'4',localCase.Field20__c );
                     
                    fieldsOnDemand = localCase.Field13__c+','+localCase.Field14__c+','+localCase.Field15__c+','+localCase.Field16__c;
                } 
             }else{
                
                isActivityHistory = ' and status = \'Completed\'';   
                if(localCase.Field17__c == null && localCase.Field18__c == null && localCase.Field19__c == null && localCase.Field20__c== null){
                    columnsForCase.put(i+'1','id' );
                    columnsForCase.put(i+'2','Subject' );
                    columnsForCase.put(i+'3','Status' );
                    columnsForCase.put(i+'4','Priority' );
                    fieldsOnDemand = 'id,Subject,Status,Priority';        
                }else{
                    columnsForCase.put(i+'1',localCase.Field13__c );
                    columnsForCase.put(i+'2',localCase.Field14__c );
                    columnsForCase.put(i+'3',localCase.Field15__c );
                    columnsForCase.put(i+'4',localCase.Field16__c );
                    fieldsOnDemand = localCase.Field17__c+','+localCase.Field18__c+','+localCase.Field19__c+','+localCase.Field20__c;
                } 
             }
   
         }       
         return fieldsOnDemand;       
    }
   
}