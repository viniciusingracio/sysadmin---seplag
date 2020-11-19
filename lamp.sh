#!/bin/bash
# Instalação da pilha LAMP
# Autor: Vinicius Ingracio - Sysadmin - SEPLAG
clear

# Variáveis das cores
NC="\E[0;00m";
vermelho="\E[1;31m";
amarelo="\E[1;33m";
verde="\E[1;32m";
azul="\E[1;36m";

	echo -e "${azul}#######################################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Instala pilha LAMP em Debian/Ubuntu${NC} ${azul}#${NC}"
		echo -e "${azul}#${NC} ${vermelho}Versão: 0.1${NC}                         ${azul}#${NC}"
	echo -e "${azul}#######################################${NC}"
echo ''

	echo -e "${azul}##################################${NC}"
		echo -e "${azul}#${NC} ${vermelho}O script será executado agora!${NC} ${azul}#${NC}"
	echo -e "${azul}##################################${NC}"
echo ''

	echo -e "${azul}##########################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Atualizando pacotes...${NC} ${azul}#${NC}"
	echo -e "${azul}##########################${NC}"

	echo -e "${amarelo}Obtendo Atualizações...${NC}"; /usr/bin/apt-get update -y &> /dev/null
		echo -e "${amarelo}Obtendo Upgrades...${NC}"; /usr/bin/apt-get upgrade -y &> /dev/null
	echo -e "${amarelo}Instalando Chkconfig...${NC}"; /usr/bin/apt-get install chkconfig -y &> /dev/null
echo ''

#Instalando pacotes LAMP.
	echo -e "${azul}############################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Instalando Pacotes LAMP${NC}  ${azul}#${NC}"
	echo -e "${azul}############################${NC}"
echo ''

	echo -e "${azul}#####################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Instalando Apache${NC} ${azul}#${NC}"
	echo -e "${azul}#####################${NC}"

#Install Apache.
	echo -e "${amarelo}Instalando Apache...${NC}"; /usr/bin/apt-get install apache2 -y &> /dev/null
		echo -e "${amarelo}Reiniciando Apache...${NC}"; /etc/init.d/apache2 restart &> /dev/null
	echo -e "${amarelo}Checando Apache...${NC}"; /sbin/chkconfig apache2 on &> /dev/null
echo ''

	echo -e "${azul}####################${NC}"
		echo -e "${azul}# ${vermelho}Instalando MySQL${NC} ${azul}#${NC}"
  echo -e "${azul}####################${NC}"

#Install MySQL.
	echo -e "${amarelo}Instalando MySQL...${NC}"; /usr/bin/apt-get install mysql-server mysql-client -y
echo ''

	echo -e "${azul}##################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Instalando PHP${NC} ${azul}#${NC}"
	echo -e "${azul}##################${NC}"

#Install PHP.
	echo -e "${amarelo}Instalando PHP...${NC}"; /usr/bin/apt-get install php5 php5-mysql libapache2-mod-php5 -y &> /dev/null
echo ''

	echo -e "${azul}######################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Reiniciando Apache${NC} ${azul}#${NC}"
	echo -e "${azul}######################${NC}"

#Restart Apache.
	echo -e "${amarelo}Reiniciando Apache...${NC}"; /etc/init.d/apache2 restart &> /dev/null
echo ''

#Checando Serviços LAMP.
	echo -e "${azul}##########################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Checando Serviços Lamp${NC} ${azul}#${NC}"
	echo -e "${azul}##########################${NC}"
echo ''

	echo -e "${azul}#############################${NC}"
		echo -e "${azul}#${NC} ${vermelho}Checando Status do Apache${NC} ${azul}#${NC}"
	echo -e "${azul}#############################${NC}"

#Checando Status do Apache.
	echo -e "${amarelo}`/usr/sbin/apache2ctl -v | grep version`${NC}"
		echo -e "${amarelo}`/etc/init.d/apache2 status`${NC}"
echo ''

	echo -e "${azul}############################${NC}"
		echo -e "${azul}# ${vermelho}Checando Status do MySQL${NC} ${azul}#${NC}"
	echo -e "${azul}############################${NC}"

#Checando Status MySQL.
	echo -e "${amarelo}`/etc/init.d/mysql status | grep Server`${NC}"
		echo -e "${amarelo}`/etc/init.d/mysql status | grep Uptime`${NC}"
echo ''

#Instalação do LAMP completa.
	echo -e "${azul}##################################${NC}"
		echo -e "${azul}#${NC} ${verde}INSTALAÇÃO DO LAMP FINALIZADA!${NC} ${azul}#${NC}"
	echo -e "${azul}##################################${NC}"

#Instalando phpMyAdmin.
	echo -e "${azul}#########################${NC}"
		echo -e "${azul}# ${vermelho}Instalando phpMyAdmin${NC} ${azul}#${NC}"
	echo -e "${azul}#########################${NC}"

	echo -e "${amarelo}Instalando phpMyAdmin...${NC}"; apt-get install phpmyadmin apache2-utils -y; echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf; service apache2 restart &> /dev/null
echo ''

#Exibindo versões dos softwares.
	echo -e "${azul}############################${NC}"
		echo -e "${azul}# ${vermelho}Versões dos Softwares${NC}    ${azul}#${NC}"
	echo -e "${azul}############################${NC}"

	echo -e "${amarelo}`mysql -V | cut -d"f" -f1 | cut -d"," -f1`${NC}"
	echo -e "${amarelo}`php -v | grep built | cut -d"(" -f1`${NC}"
	echo -e "${amarelo}`apache2 -v | grep "version:" | cut -d: -f2 | cut -d" " -f2`${NC}"
	echo ''