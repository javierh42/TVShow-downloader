#!/bin/sh

########################################
#
# nombre_serie='Z Nation'
# url_serie='https://grantorrent.com/series/z-nation-temporada-1/'
# destino_serie='/home/usuario/Descargas/Z Nation/Season 1/'
# calidad=keep blank for regular episode or type 720p
########################################

################# START SERIE RSS #################
nombre_serie='Fariña'
url_serie='https://grantorrent.com/series/farina-temporada-1/'
destino_serie='/home/javierh/MK5/Series/Fariña/Season 1'
calidad='720p'

if [ -d "${destino_serie}/show_info/" ]; then
  cd "${destino_serie}/show_info/"
else
  cd "$destino_serie"
  mkdir "${destino_serie}/show_info"
  cd "${destino_serie}/show_info/"
fi

wget --html-extension "$url_serie"
touch "${destino_serie}/show_info/links_descargados.txt"
cat index.html | grep -Eo "(http|https)://files.[a-zA-Z0-9./?=_-]*" | sort | uniq > links_detectados_NEW.txt

for url in $(cat links_detectados_NEW.txt); do

  if ! (( $(grep -c "$url" "${destino_serie}/show_info/links_descargados.txt") )); then
    if [[ $calidad == "720p" ]]; then
      if [[ "$url" == *"720"* ]]; then
        echo "Descargando... $url"
        transmission-remote -a "$url" -C -sr 0 -s -w "$destino_serie"
        echo "$url" >> "${destino_serie}/show_info/links_descargados.txt"
      fi
    else if [[ "$url" != *"720"* ]]; then
            echo "Descargando... $url"
      transmission-remote -a "$url" -C -sr 0 -s -w "$destino_serie"
      echo "$url" >> "${destino_serie}/show_info/links_descargados.txt"
     fi
    fi
  else echo "$url ya está descargado"
  fi
done
rm "${destino_serie}/show_info/index.html"

################# END SERIE RSS #################

################# START SERIE RSS #################
nombre_serie='Vikings'
url_serie='https://grantorrent.com/series/vikingos-temporada-5/'
destino_serie='/home/javierh/MK2/Series/Vikings/Season 5/'
calidad=''

if [ -d "${destino_serie}/show_info/" ]; then
  cd "${destino_serie}/show_info/"
else
  cd "$destino_serie"
  mkdir "show_info"
  cd "${destino_serie}/show_info/"
fi

wget --html-extension "$url_serie"
touch "${destino_serie}/show_info/links_descargados.txt"
cat index.html | grep -Eo "(http|https)://files.[a-zA-Z0-9./?=_-]*" | sort | uniq > links_detectados_NEW.txt

for url in $(cat links_detectados_NEW.txt); do

  if ! (( $(grep -c "$url" "${destino_serie}/show_info/links_descargados.txt") )); then
    if [[ $calidad == "720p" ]]; then
      if [[ "$url" == *"720"* ]]; then
              echo "Descargando... $url"
      transmission-remote -a "$url" -C -sr 0 -s -w "$destino_serie"
      echo "$url" >> "${destino_serie}/show_info/links_descargados.txt"
      fi
    else if [[ "$url" != *"720"* ]]; then
            echo "Descargando... $url"
      transmission-remote -a "$url" -C -sr 0 -s -w "$destino_serie"
      echo "$url" >> "${destino_serie}/show_info/links_descargados.txt"
     fi
    fi
  else echo "$url ya está descargado"
  fi
done
rm "${destino_serie}/show_info/index.html"

################# END SERIE RSS #################


