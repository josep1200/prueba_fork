#!/bin/bash
#Programa para crear copias de seguridad de Joomla

clear

echo "/* ----------------------------------------------------- */"
echo "      Programa para crear copia de seguridad  de Joomla    "
echo "/* ----------------------------------------------------- */"

bdname=joomla
bduser=joomla
bdpass=comomola
rutajoomla=iaw/joomla/
fecha=$(date +'%Y-%m-%d')
directoriodestino=/home/asir/

mysqldump -u $bduser -p$bdpass $bdname > bdd_joomla.sql
tar czf joomla.tar.gz $rutajoomla 
zip -q backup_joomla_$fecha.zip  bdd_joomla.sql joomla.tar.gz
rm bdd_joomla.sql
rm joomla.tar.gz
mv backup_joomla_$fecha.zip $directoriodestino
echo "El archivo de respaldo backup_joomla_$fecha.zip se ha realizado correctamente"
