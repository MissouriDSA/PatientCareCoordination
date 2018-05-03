From = gsub('^From: (.*)  To|Sent: .*$','\\1',clean_msg_ctr_data_500$MSG_TEXT)
write.csv(From, 'From_incomplete.csv')
read.csv('From_incomplete.csv')

subset = clean_msg_ctr_data_500$MSG_TEXT[grep('^From: .*',clean_msg_ctr_data_500$MSG_TEXT)]
From = gsub('^From: (.*)  (To)|(Sent):.+', '\\1', subset)
From = gsub('(.*): .*', '\\1', From)
From = gsub('(.*): .*', '\\1', From)



Age = gsub('(.*) (Years)|(Days)','\\1', clean_msg_ctr_data_500$AGE_AT_VISIT)
Age = as.numeric(Age)
Age = Age[-1]
Age = as.data.frame(Age)
library(ggplot2)
ggplot(Age, aes(Age))+
  geom_histogram()

Gender = clean_msg_ctr_data_500$GENDER
df = table(Gender)
df = as.data.frame(df)

pie = ggplot(df, aes(x='',y=Freq, fill=Gender))+
  geom_bar(width=1, stat='identity')+
  coord_polar('y', start=0)

library(scales)
pie + scale_fill_grey() + 
  theme(axis.text.x=element_blank()) + 
  geom_text(aes(y=Freq/2+c(0,cumsum(Freq)[-length(Freq)]),label=percent(round(Freq/248,2))), size=5)
