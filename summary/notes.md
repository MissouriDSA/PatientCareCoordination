> testdata <- read.csv("./clean_msg_ctr_data.csv")
> summary(testdata)
            MRN             FIN                 DOB           AGE_AT_VISIT  
 X:   62   Min.   : 6336419   xx/22/xx:  239     0 Days : 9483  
 x:   58   1st Qu.:24205469   xx/01/xx:  226    51 Years: 1607  
 x:   42   Median :24987281   xx/30/xx:  204    57 Years: 1523  
 x:   40   Mean   :26785418   xx/01/xx:  189    71 Years: 1517  
 x:   39   3rd Qu.:25749925   xx/31/xx:  188    50 Years: 1462  
 x:   39   Max.   :60263088   xx/23/xx:  187    70 Years: 1312  
 (Other)      :68081   NA's   :422        (Other) :67128   (Other)  :51457  
                   RACE          GENDER          VISIT_DT    
 WHITE               :54902         :    3           : 9486  
 BLACK OR AFRICAN AME:11660   Female:43283   01/20/xx:  199  
 SOME OTHER RACE     :  682   Male  :25075   05/13/xx:  190  
 ASIAN               :  384                  09/08/xx:  188  
 AMERICAN INDIAN OR A:  296                  09/22/xx:  188  
 OTHER               :  264                  01/13/xx:  186  
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
x       : 6570  
 x: 5847  
 x       : 5376  
x       : 4399  
xn      : 4266  
 x    : 3837  
 x                    :38066  
> unique(testdata$NCM_NM.)
 [1] all unique NCM's listed
> 

