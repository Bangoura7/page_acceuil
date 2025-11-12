#!/bin/bash

# Script pour télécharger des images depuis Pexels
# Usage: ./download_images.sh

echo "📥 Téléchargement d'images depuis Pexels..."
echo ""

# Créer le dossier image s'il n'existe pas
mkdir -p image

# Tableau d'URLs d'images Pexels (libres de droits)
declare -a urls=(
    "https://images.pexels.com/photos/326502/pexels-photo-326502.jpeg?auto=compress&cs=tinysrgb&w=800"
    "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=800"
    "https://images.pexels.com/photos/270348/pexels-photo-270348.jpeg?auto=compress&cs=tinysrgb&w=800"
    "https://images.pexels.com/photos/574071/pexels-photo-574071.jpeg?auto=compress&cs=tinysrgb&w=800"
    "https://images.pexels.com/photos/1181298/pexels-photo-1181298.jpeg?auto=compress&cs=tinysrgb&w=800"
    "https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg?auto=compress&cs=tinysrgb&w=800"
)

# Télécharger chaque image
counter=1
for url in "${urls[@]}"
do
    echo "⬇️  Téléchargement de project${counter}.jpg..."
    curl -L -o "image/project${counter}.jpg" "$url"
    if [ $? -eq 0 ]; then
        echo "✅ project${counter}.jpg téléchargé avec succès"
    else
        echo "❌ Erreur lors du téléchargement de project${counter}.jpg"
    fi
    ((counter++))
    echo ""
done

echo "🎉 Téléchargement terminé !"
echo ""
echo "📁 Images sauvegardées dans le dossier: ./image/"
ls -lh image/project*.jpg 2>/dev/null
