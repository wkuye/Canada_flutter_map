
# Canada_flutter_map

# map_of_canada


## install supabsase Cli in your mac device
1) run this command to install using homebrew: `brew install supabase/tap/supabase`

2) download docker from here: [Docker](https://docs.docker.com/desktop/install/mac-install/)

3) Inside the folder where you want to create your project, run: `supabase init`

4) Now, to start the Supabase stack, run: `supabase start`

6) run `supabase status` to show you the links to your keys and url and open the link  to your studio url which is [studio_url](http://127.0.0.1:54323)
   
## how to use use pmtiles with protomap
the pmtiles is already in the code , the name of the file is pmtiles, to use the command :
1) copy the path of the pmtiles and use the pm tiles command for example : `/Users/olawalekuye/Documents/map_of_canada/pmtiles extract https://build.protomaps.com/20240930.pmtiles my_area.pmtiles --bbox=4.742883,51.830755,5.552837,52.256198`

2) Go to `maps.protomaps.com/builds` and find a recent daily basemap build and use version 3.7.1 for it to rendeer all the maps on flutter map
   
3) Use the pmtiles CLI to inspect that archive: `path_to_your_pmtiles show https://build.protomaps.com/20240812.pmtiles`.

4) go to the bboxfinder `http://bboxfinder.com/` and use the tools in the websiter to mark the place, state or country you want to get and copy the bbox co-ordinates

5) extract any area but if you want to extract canada here is the command `path_to_your_pmtiles extract https://build.protomaps.com/20240812.pmtiles Canada.pmtiles --bbox=-146.226354,42.915979,-59.151292,83.715544` it will download the map of canada in the flutter project directory

6) you will see a file name called Canada.pmtiles and  upload your pmtile in your supabase bucket and click on geturl

7) show the file information of Canada.pmtiles by using this command `path_to_your_pmtiles show {geturl link of the pmtiles in supabase storage}` this is an example: `/Users/olawalekuye/Downloads/pmtiles show  http://127.0.0.1:54321/storage/v1/object/public/Canada_pm_tiles/Lagos.pmtiles`

8) install flutter map into your project 
   
9) pass the url to your tilesource in the map_page.dart file

10) add the LatLng cordinates gotten from the show command from pm tiles to yout flutter map options to render the map

11) run your project

