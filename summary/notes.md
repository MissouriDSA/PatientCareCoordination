> testdata <- read.csv("./clean_msg_ctr_data.csv")
> summary(testdata)
            MRN             FIN                 DOB           AGE_AT_VISIT  
 02-52-68-47-8:   62   Min.   : 6336419   06/22/63:  239     0 Days : 9483  
 02-55-10-65-8:   58   1st Qu.:24205469   08/01/63:  226    51 Years: 1607  
 02-47-74-83-2:   42   Median :24987281   03/30/35:  204    57 Years: 1523  
 02-17-72-80-2:   40   Mean   :26785418   07/01/61:  189    71 Years: 1517  
 02-41-07-46-1:   39   3rd Qu.:25749925   05/31/61:  188    50 Years: 1462  
 02-54-24-07-8:   39   Max.   :60263088   01/23/57:  187    70 Years: 1312  
 (Other)      :68081   NA's   :422        (Other) :67128   (Other)  :51457  
                   RACE          GENDER          VISIT_DT    
 WHITE               :54902         :    3           : 9486  
 BLACK OR AFRICAN AME:11660   Female:43283   01/20/15:  199  
 SOME OTHER RACE     :  682   Male  :25075   05/13/14:  190  
 ASIAN               :  384                  09/08/14:  188  
 AMERICAN INDIAN OR A:  296                  09/22/14:  188  
 OTHER               :  264                  01/13/14:  186  
 (Other)             :  173                  (Other) :57924  
                   MSG_TEXT       CREATE_DTTM   
                       : 1022   03/09/15:  289  
 noted                 :  348   02/23/15:  283  
 noted.                :  133   04/20/15:  278  
 Noted.                :  120   03/02/15:  245  
 chart review completed:  115   06/30/14:  245  
 Noted. Thanks.        :   90   08/26/14:  239  
 (Other)               :66533   (Other) :66782  
                        NCM_NM.      
 Waterman RN, Lisa A\n       : 6570  
 Willenburg RN, Christina F\n: 5847  
 Cohen RN, Roxanna E\n       : 5376  
 Felten FNP, Susan K\n       : 4399  
 Ortbals RN, Jeanne M\n      : 4266  
 Torreyson RN, Carrie A\n    : 3837  
 (Other)                     :38066  
> unique(testdata$NCM_NM.)
 [1] Alioto RN, Armine A\n        Asbee RN, Joanne S\n        
 [3] Barton RN, Gayla J\n         Bolton RN, Julie A\n        
 [5] Bomar GCNS, Marilee Green\n  Cohen RN, Roxanna E\n       
 [7] Davis RN, Janis M\n          Day RN, Tamara M\n          
 [9] Dodson RN, Jaime Elizabeth\n Doss RN, Patricia L\n       
[11] Faber AGCNS, Jackie Dee\n    Felten FNP, Susan K\n       
[13] Felten RN, Elizabeth A\n     Hestir RN, Cynthia A\n      
[15] Imhoff RN, Ashley D\n        Martin RN, Tammy L\n        
[17] Nelson RN, Rose M\n          09/19/14                    
[19]                              Ortbals RN, Jeanne M\n      
[21] Runyon, Susan L\n            Sessions RN, Sharon A\n     
[23] Thullen RN, Lila Virginia\n  Torreyson RN, Carrie A\n    
[25] Vroman RN, Amber Nicole\n    Wankel RN, Amber\n          
[27] Waterman RN, Lisa A\n        08/27/13                    
[29] Willenburg RN, Christina F\n
29 Levels:  08/27/13 09/19/14 Alioto RN, Armine A\n ... Willenburg RN, Christina F\n
> 

