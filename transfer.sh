#!/bin/bash
dockerid=$(docker ps -aqf 'name=SteveShare')
docker cp css/imgs/logo/horizontal3.png $dockerid:/var/www/css/imgs/logo
docker cp css/pictshare.css $dockerid:/var/www/css
docker cp templates/main.html $dockerid:/var/www/templates
docker cp templates/text.html $dockerid:/var/www/templates
docker cp templates/video.html $dockerid:/var/www/templates
docker cp favicon.ico $dockerid:/var/www
docker cp css/dropzone.css $dockerid:/var/www/css

#TO FIX THE NGINX CONFIG IF NEEDED (\\STEVE\appdata\NginxProxyManager\nginx\proxy_host\21.conf)
#https://stackoverflow.com/questions/65628981/set-basic-auth-on-homepage-only-nginx
