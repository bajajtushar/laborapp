#model 
l
k=readRDS("data/k.rds") %>% rename(all=`number of migrants`)
b=readRDS("data/b.rds")



modeldata=k %>% 
  mutate(workp=Work/all,educationp=education/all,marriagep=marriage/all) %>% 
  filter(!Gender%in%"Total",!durationofresidence%in%"All durations of residence",!sector%in%"Total",!sectoroflastresidence%in%"Total") %>% 
  select(Gender,workp,marriagep,educationp,durationofresidence,sector,sectoroflastresidence) %>% unite(sectorflow,c("sectoroflastresidence","sector"),sep="-")
modeldata$Gender=as.factor(modeldata$Gender)
modeldata$durationofresidence=as.factor(modeldata$durationofresidence)





modgender=glm(Gender~.,data = modeldata,family = "binomial")
mod2=glm(Gender~workp,data = modeldata,family = "binomial")
mod3=glm(Gender~workp+durationofresidence,data = modeldata,family = "binomial")
mod4=glm(Gender~marriagep+sectorflow,data = modeldata,family = "binomial")


summary(modwork)
summary(mod2)
summary(mod4)

