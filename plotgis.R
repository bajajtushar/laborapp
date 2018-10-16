plotgis=function(data,input){
  
  nam=readRDS("data/nam.rds") 
  
  if(input!="all"){
    ggplot()+geom_polygon(data=data,aes(x=long,y=lat,group=group,fill=pct)) +
      geom_path(data=data,aes(x=long,y=lat,group=group),color="black") +
      labs(title=paste("Propotion of migration due to",input, "by state"),caption="census2011") +coord_equal()+ theme_classic()+theme(axis.ticks = element_blank(),axis.line = element_blank(),axis.title = element_blank(),axis.text = element_blank(),legend.position = "bottom")+
      scale_fill_viridis(name="Percentage",guide=guide_colorbar(barwidth=17,title.position = "top")) + geom_text_repel(data=nam, aes(x=long, y=lat, label = id), size=3, fontface="bold")
  } else {
    
    
    ggplot()+geom_polygon(data=data,aes(x=long,y=lat,group=group,fill=all)) +   # gis for work =all
      geom_path(data=data,aes(x=long,y=lat,group=group),color="black") +
      labs(title="migration GIS ",caption="census2011") + coord_equal()+theme_classic()+ theme(axis.ticks = element_blank(),axis.line = element_blank(),axis.title = element_blank(),axis.text = element_blank(),legend.position = "bottom")+
      scale_fill_viridis(name="Number of Migrants",guide=guide_colorbar(barwidth=17,title.position = "top")) + geom_text(data=nam, aes(x=long, y=lat, label = id), size=3, fontface="bold")
  }
}
