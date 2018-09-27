require(googleVis)

################################################################
# Exemplo mostrando os dados de popularidade das cidades dos EUA
################################################################


edit(CityPopularity)


#O que eu faria no passado
barplot(CityPopularity$Popularity,names.arg=CityPopularity$City, col="royalblue")

#O que eu faço hoje
Gauge <-  gvisGauge(CityPopularity, 
                    options=list(min=0, max=800, greenFrom=500,
                                 greenTo=800, yellowFrom=300, yellowTo=500,
                                 redFrom=0, redTo=300, width=400, height=300))


plot(Gauge)

#######################################################
# Tabela
#######################################################

PopTable <- gvisTable(Population, 
                      formats=list(Population="#,###",
                                   '% of World Population'='#.#%'),
                      options=list(page='enable'))
plot(PopTable)


#######################################################
######  Barras e Mapas 
#######################################################

df=data.frame(country=c("US", "GB", "BR", "FR", "AU"), 
              var1=c(10,13,14,13,12), 
              var2=c(23,12,32,20,30))
df

Bar <- gvisBarChart(df)
plot(Bar)

Intensity <- gvisIntensityMap(df)
plot(Intensity)

################################################################
######### Grafico Customizado e Grafico de Bolhas
################################################################

edit(Fruits)
Bubble <- gvisBubbleChart(Fruits, idvar="Fruit", 
                          xvar="Sales", yvar="Expenses",
                          colorvar="Year", sizevar="Profit",
                          options=list(width="900px", height="600px"))
                            
plot(Bubble)                          
                            
              
             

########################################################################
# Grafico Sankey
########################################################################

datSK <- data.frame(From=c(rep("A",3), rep("B", 3)),
                    To=c(rep(c("X", "Y", "Z"),2)),
                    Weight=c(5,7,6,2,9,4))
edit(datSK)
Sankey <- gvisSankey(datSK, from="From", to="To", weight="Weight",
                     options=list(
                       sankey="{link: {color: { fill: '#d799ae' } },
                       node: { color: { fill: '#a61d4c' },
                       label: { color: '#871b47' } }}"))
plot(Sankey)


#######################################################
# Organograma
#######################################################
edit(Regions)
Org <- gvisOrgChart(Regions, 
                    options=list(width=600, height=250,
                                 size='large', allowCollapse=TRUE))
plot(Org)


#######################################################
# Grafico Treemap
#######################################################

edit(Regions)
Tree <- gvisTreeMap(Regions,  
                    "Region", "Parent", 
                    "Val", "Fac", 
                    options=list(fontSize=16))
plot(Tree)


#######################################################
# Grafico - Calendar chart
#######################################################

edit(Cairo)
Cal <- gvisCalendar(Cairo, 
                    datevar="Date", 
                    numvar="Temp",
                    options=list(
                      title="Daily temperature in Cairo",
                      height=520,
                      width=800,
                      calendar="{yearLabel: { fontName: 'Times-Roman',
                      fontSize: 32, color: '#1A8763', bold: true},
                      cellSize: 14,
                      cellColor: { stroke: 'red', strokeOpacity: 0.2 },
                      focusedCellColor: {stroke:'red'}}")
                    )
plot(Cal)

#######################################################
# Timeline
#######################################################

datTL <- data.frame(Position=c(rep("Presidente", 3), rep("Vice", 3)),
                    Name=c("Washington", "Adams", "Jefferson",
                           "Adams", "Jefferson", "Burr"),
                    start=as.Date(x=rep(c("1789-03-29", "1797-02-03", 
                                          "1801-02-03"),2)),
                    end=as.Date(x=rep(c("1797-02-03", "1801-02-03", 
                                        "1809-02-03"),2)))
edit(datTL)

Timeline <- gvisTimeline(data=datTL, 
                         rowlabel="Position",
                         barlabel="Name",
                         start="start", 
                         end="end",
                         options=list(timeline="{groupByRowLabel:false}",
                                      backgroundColor='#ffd', 
                                      height=350,
                                      colors="['#cbb69d', '#603913', '#c69c6e']"))
plot(Timeline)






#######################################################
# Mostrando o Furacao Andrew (1992). O caminho da tempestade
#######################################################

head(Andrew)

AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip", 
                     options=list(showTip=TRUE, 
                                  showLine=TRUE, 
                                  enableScrollWheel=TRUE,
                                  mapType='terrain', 
                                  useMapTypeControl=TRUE))
plot(AndrewMap)

#######################################################
# Mostrando o Furacao Andrew (1992) Versao 2
#######################################################

AndrewMap2 <- gvisMap(Andrew, "LatLong" , "Tip", 
                      options=list(showTip=TRUE, 
                                   showLine=TRUE, 
                                   enableScrollWheel=TRUE,
                                   #mapType='roadmap', 
                                   #mapType='hybrid',
                                   #mapType='normal',
                                   useMapTypeControl=TRUE))
plot(AndrewMap2)



#######################################################
# Mostrando a qualidade das Upas
#######################################################

QUALIDADE <- read.table("QUALIDADEgoogle.csv", header=TRUE, sep=";", 
                        na.strings="NA", dec=".", strip.white=TRUE)
str(QUALIDADE)
head(QUALIDADE)

QUALIDADE$LatLong <- as.character(QUALIDADE$LatLong)
QUALIDADE$gestao <- as.character(QUALIDADE$gestao)


Mapadaqualidade <- gvisMap(QUALIDADE,locationvar ="LatLong" ,  tipvar = "cod_Bairro",
                           options=list(showTip=TRUE, 
                                        showLine=TRUE, 
                                        enableScrollWheel=TRUE,
                                        #mapType='terrain', 
                                        mapType='roadmap', 
                                        #mapType='hybrid',
                                        #mapType='normal',
                                        useMapTypeControl=TRUE))
plot(Mapadaqualidade)


Mapadaqualidade2 <- gvisMap(QUALIDADE,locationvar ="LatLong" ,  tipvar = "cod_Bairro",
                            options=list(showTip=TRUE, 
                                         showLine=TRUE, 
                                         enableScrollWheel=TRUE,
                                         #mapType='terrain', 
                                         mapType='roadmap', 
                                         #mapType='hybrid',
                                         #mapType='normal',
                                         useMapTypeControl=TRUE,
                                         icons=paste0("{",
                                                      "'default': {'normal': 'http://icons.iconarchive.com/",
                                                      "icons/icons-land/vista-map-markers/48/",
                                                      "Map-Marker-Ball-Azure-icon.png',\n",
                                                      "'selected': 'http://icons.iconarchive.com/",
                                                      "icons/icons-land/vista-map-markers/48/",
                                                      "Map-Marker-Ball-Right-Azure-icon.png'",
                                                      "}}")))

plot(Mapadaqualidade2)


Mapadaqualidade3 <- gvisMap(QUALIDADE,locationvar ="LatLong" ,  tipvar = "cod_Bairro",
                            options=list(showTip=TRUE, 
                                         showLine=TRUE, 
                                         enableScrollWheel=TRUE,
                                         #mapType='terrain', 
                                         mapType='roadmap', 
                                         #mapType='hybrid',
                                         #mapType='normal',
                                         useMapTypeControl=TRUE,
                                         icons=paste0("{",
                                                      "'default': {'normal': 'http://icons.iconarchive.com/",
                                                      "icons/iconshock/world-places/48/",
                                                      "christ-the-redeemer-icon.png',\n",
                                                      "'selected': 'http://icons.iconarchive.com/",
                                                      "icons/iconshock/world-places/48/",
                                                      "christ-the-redeemer-icon.png'",
                                                      "}}")))
#http://icons.iconarchive.com/icons/iconshock/world-places/256/christ-the-redeemer-icon.png
#http://icons.iconarchive.com/icons/icons-land/vista-map-markers/48/Map-Marker-Ball-Right-Azure-icon.png

plot(Mapadaqualidade3)

#######################################################
#Merging charts
#######################################################

G <- gvisGeoChart(Exports, "Country", "Profit", 
                  options=list(width=300, height=300))
T <- gvisTable(Exports, 
               options=list(width=220, height=300))

GT <- gvisMerge(G,T, horizontal=TRUE) 

plot(G)
plot(T)
plot(GT)

#######################################################
# Exemplo mostrando os dados de letramento dos EUA por estados
#######################################################

require(datasets)
states <- data.frame(state.name, state.x77)
states

#O que eu faria no passado
barplot(states$Illiteracy,names.arg=states$state.name, col="red")

#O que eu faco hoje
GeoStates <- gvisGeoChart(states, "state.name", "Illiteracy",
                          options=list(region="US", 
                                       displayMode="regions", 
                                       resolution="provinces",
                                       width=600, height=400))
plot(GeoStates)



#######################################################
#######################################################
# read CSV file
#######################################################
#######################################################
UF <- read.table("estados_teste.csv", header=TRUE, sep=";", na.strings="NA", dec=",", strip.white=TRUE)

edit(UF) 


brasil<- gvisGeoChart(UF, "nome", "regiao_id",
                      options=list(region="BR", 
                                   displayMode="regions", 
                                   resolution="provinces",
                                   width=600, height=400))
plot(brasil)


#######################################################

brasil2<- gvisGeoChart(UF, "nome", "PIBpc",
                       options=list(region="BR", 
                                    displayMode="regions", 
                                    resolution="provinces",
                                    width=600, height=400))
plot(brasil2)

#######################################################

brasil3<- gvisGeoChart(UF, "nome", "POPULACAO",
                       options=list(region="BR", 
                                    displayMode="regions", 
                                    resolution="provinces",
                                    width=600, height=400))
plot(brasil3)




###############################################################################
# Exemplo com os dados do Banco Mundial - Gráfico em movimento
###############################################################################

load("WorldBank.RDATA")
edit(WorldBank)

Movimento <- gvisMotionChart(WorldBank,
                             idvar="Pais", timevar="ANO",        
                             xvar="EspectativadeVidaaoNascer", yvar="TaxadeFecundidade",
                             colorvar="Regiao", sizevar="Populacao",
                             options=list(width=700, height=600),
                             chartid="WorldBank")

plot(Movimento)
#demo(WorldBank)



