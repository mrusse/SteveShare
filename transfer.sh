#!/bin/bash
docker cp css/imgs/logo/horizontal3.png 586a174fcf66:/var/www/css/imgs/logo
docker cp css/pictshare.css 586a174fcf66:/var/www/css
docker cp templates/main.html 586a174fcf66:/var/www/templates
docker cp templates/text.html 586a174fcf66:/var/www/templates
docker cp templates/video.html 586a174fcf66:/var/www/templates
docker cp favicon.ico 586a174fcf66:/var/www
docker cp css/dropzone.css 586a174fcf66:/var/www/css

#TO CONNECT TO DOCKER / FIND THE ID
#docker ps
#docker exec -it previously_noted_ID /bin/bash

#TO FIX THE NGINX CONFIG IF NEEDED (\\STEVE\appdata\NginxProxyManager\nginx\proxy_host\21.conf)
#https://stackoverflow.com/questions/65628981/set-basic-auth-on-homepage-only-nginx