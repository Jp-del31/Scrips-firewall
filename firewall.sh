#!/bin/bash
#Borrar todas las reglas
sudo ufw reset
#Habilitar ufw de nuevo
sudo ufw enable
#Establecer politica restrictiva por defecto
sudo ufw default deny incoming
sudo ufw default deny outgoing
#Permitir SFTP puerto 22
sudo ufw allow from 10.11.0.125 to any port 22
#Permitir Samba en puertos 137,138,139 y 445
sudo ufw allow from 10.11.0.125 to any port 137 proto udp
sudo ufw allow from 10.11.0.125 to any port 138 proto udp
sudo ufw allow from 10.11.0.125 to any port 139 proto tcp
sudo ufw allow from 10.11.0.125 to any port 445 proto tcp
#Permitir rango de puertos 31010:31110 solo en tcp
sudo ufw allow from 10.11.0.125 to any port 31010:31110 proto tcp
#Permitir rango de puertos 50505:50509 solo en tcp
sudo ufw allow from 10.11.0.125 to any port 50505:50509 proto tcp
#Permitir rango de puertos 50505:50509 solo en udp
sudo ufw allow from 10.11.0.125 to any port 50505:50509 proto udp
#Permitir conexiones al puerto 4444 solo udp desde la ip 172.16.2.201
sudo ufw allow from 172.16.2.201 to any port 4444 proto udp
#Abrir los puertos 138 y 145 desde la ip 172.16.2.201
sudo ufw allow from 172.16.2.201 to any port 139
sudo ufw allow from 172.16.2.201 to any port 445
#Respuesta a la pregunta si abrir los puertos 139 y 145 es seguro o no
# - No es seguro abrir estos puertos ya que es un protocolo debil
#a la hora de recibir ataques si no se asegura adecuadamente.
#Se recomienda abrir estos puertos en caso de que sea muy necesario
# y si la red esta segura y confiable
#Abrir el puerto 3389 desde la ip 172.16.2.201
sudo ufw allow from 172.16.2.201 to any port 3389
#Respuesta a la pregunta si abrir el puerto 3389 es seguro o no
#- NO es seguroabrir el puerto 3389 porque te expondrias publicamente
# debido a multiples vulnerabilidades ya que es un objetivo frecuente de ataques
#Permitir conexiones SMTP puerto(25)
sudo ufw allow to any port 25 proto tcp
# Permitir conexiones para imap puerto(143)
sudo ufw allow to any port 143 proto tcp
#Permitir conexiones para POP3 en el puerto(110)
sudo ufw allow to any port 110 proto tcp
#Permitir conexiones a MySQL/MariaDB desde la subred de tu ip
sudo ufw allow from 10.11.0.0/24 to any port 3306 proto tcp
#Imprimir todas las reglas del firewall
sudo ufw status verbose
