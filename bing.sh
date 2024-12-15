#!/bin/bash

# Diretório onde as imagens temporárias serão armazenadas
temp_dir="/tmp/papel_de_parede_bing"
mkdir -p "$temp_dir"

# Baixando a imagem do Bing (usando a API do Bing)
imagem_url=$(curl -s "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1" | jq -r '.images[0].url' | sed 's/^/https:\/\/www.bing.com/')

# Baixando a imagem
wget -q "$imagem_url" -O "$temp_dir/papel_de_parede.jpg"

# Usando feh para definir a imagem como papel de parede
feh --bg-fill "$temp_dir/papel_de_parede.jpg"


# Limpar o diretório temporário (opcional)
# rm -rf "$temp_dir"
