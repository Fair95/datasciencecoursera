lat <- runif(20,-10,20)
lng <- runif(20,30,100)
loc <- data.frame(lat = lat,lng = lng)
loc <- loc %>% leaflet() %>% addTiles() %>% 
  addMarkers(clusterOptions = markerClusterOptions())
loc