server <- function(input, output) {
  #migration data
  dataplot= eventReactive(input$go,{
    
    k=readRDS("data/k.rds") %>% rename(all=`number of migrants`)
    map=readRDS("data/map.rds")
    
    
    data=k%>%filter(!area %in% "India") %>% filter(sector==input$sector,durationofresidence==input$duration,
                                                   sectoroflastresidence==input$lastres,Gender==input$gender) %>% select(area,all,!!rlang::sym(input$reason)) %>% 
      rename(id=area) %>% arrange(id) %>% mutate(pct=!!sym(input$reason)*100/all) %>% inner_join(map,.)
    
  })
  
  output$migrantgis=renderPlot({ 
    source("plotgis.R")
    # gis plot of migration
    plotgis(dataplot(),input$reason)
  })
  output$text=renderText({"Underconstruction"})
}