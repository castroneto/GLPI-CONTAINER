#!/bin/bash
#
set -x
# 

SetPermission () {

    chown -Rf www-data:www-data /var/www/html/glpi/plugins

}

RemoveOldPlugin() {

	if [ -z $1 ]
	then
		return "Use: $0 directory"
	fi

	if [ ! -d /var/www/html/glpi/plugins/$1 ]
	then

		echo "Directory not found."

	else

		rm -rf /var/www/html/glpi/plugins/$1

	fi

}

PluginModifications() {

	RemoveOldPlugin Mod

	curl --progress-bar -L "https://github.com/stdonato/glpi-modifications/archive/1.5.2.tar.gz" | tar -zxf - -C /var/www/html/glpi/plugins/

	mv /var/www/html/glpi/plugins/glpi-modifications-1.5.2 /var/www/html/glpi/plugins/Mod

}




PluginTelegramBot() {

	RemoveOldPlugin telegrambot

	curl --progress-bar -L "https://github.com/pluginsGLPI/telegrambot/releases/download/2.0.0/glpi-telegrambot-2.0.0.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/

}


PluginTimesheet() {

	RemoveOldPlugin timesheet

	curl --progress-bar -L "https://github.com/99net/Timesheet/releases/download/v1.0.1/timesheet-1.0.1.tar.gz" | tar -jxf - -C /var/www/html/glpi/plugins/

}




PluginPDF() {

	RemoveOldPlugin pdf

	curl --progress-bar -L "https://forge.glpi-project.org/attachments/download/2293/glpi-pdf-1.6.0.tar.gz" | tar -zxf - -C /var/www/html/glpi/plugins/

}


PluginOCS() {

	RemoveOldPlugin ocsinventoryng

    curl --progress-bar -L "https://github.com/pluginsGLPI/ocsinventoryng/releases/download/1.6.0/glpi-ocsinventoryng-1.6.0.tar.gz" | tar -zxf - -C /var/www/html/glpi/plugins/

}

PluginFusion() {

	RemoveOldPlugin fusioninventory

	curl --progress-bar -L "https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.4%2B2.4/fusioninventory-9.4+2.4.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/

}


PluginDataInjection() {

	RemoveOldPlugin datainjection

    curl --progress-bar -L "https://github.com/pluginsGLPI/datainjection/releases/download/2.7.1/glpi-datainjection-2.7.1.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/

}

PluginFields() {

	RemoveOldPlugin fields

	curl --progress-bar -L "https://github.com/pluginsGLPI/fields/releases/download/1.10.3/glpi-fields-1.10.3.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/

}


PluginTasklists() {

	RemoveOldPlugin tasklists

	curl --progress-bar -L "https://github.com/InfotelGLPI/tasklists/releases/download/1.5.0/glpi-tasklists.1.5.0.tar.gz" | tar -zxf - -C /var/www/html/glpi/plugins/ 

}


PluginFormCreator() {

	RemoveOldPlugin formcreator

	curl --progress-bar -L "https://github.com/pluginsGLPI/formcreator/releases/download/v2.9.1/glpi-formcreator-2.9.1.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/ 

}


PluginBehaviors() {

	RemoveOldPlugin behaviors

	curl --progress-bar -L "https://forge.glpi-project.org/attachments/download/2296/glpi-behaviors-2.2.2.tar.gz" | tar -zxf - -C /var/www/html/glpi/plugins/

}

PluginCosts() {

	RemoveOldPlugin costs

	curl --progress-bar -L "https://github.com/ticgal/costs/releases/download/1.1.0/glpi-costs-1.1.0.tar.gz" | tar -zxf - -C /var/www/html/glpi/plugins/

}


PluginTag() {

	RemoveOldPlugin tag

	curl --progress-bar -L "https://github.com/pluginsGLPI/tag/releases/download/2.6.0/glpi-tag-2.6.0.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/

}

PluginGenericObject() {

	RemoveOldPlugin genericobject 

	curl --progress-bar -L "https://github.com/pluginsGLPI/genericobject/releases/download/2.8.0/glpi-genericobject-2.8.0.tar.bz2" | tar -jxf - -C /var/www/html/glpi/plugins/

}


InstallPlugins() {

	if [ ! -z $PLUGINS ]
	then
		
		LIST=$(echo $PLUGINS | sed "s/,/ /g")

		for i in $LIST
		do

			case $i in

				glpi-modifications)

					PluginModifications

				;;

				glpi-telegrambot)

					PluginTelelgramBot

				;;

				glpi-pdf)

					PluginPDF

				;;

				glpi-ocsinventoryng)

				    PluginOCS

				;;

				glpi-fusioninventory)

					PluginFusion

				;;

				glpi-timesheet)

					PluginTimesheet

				;;

				glpi-datainjection)

					PluginDataInjection

				;;

				glpi-fields) 

					PluginFields

				;;

				glpi-tasklists)

					PluginTasklists

				;;

				glpi-formcreator)

					PluginFormCreator

				;;

				glpi-costs)

					PluginCosts

				;;

				glpi-tag) 

					PluginTag

				;;

				glpi-genericobject)

					PluginGenericObject

				;;

				all)
					# PluginModifications
					PluginTelegramBot
					PluginPDF
					PluginOCS
					PluginDataInjection
					PluginFields
					PluginTasklists
					PluginFormCreator
					PluginTimesheet
					PluginCosts
					PluginTag
					PluginGenericObject
					PluginFusion

				;;

				*)
				
					echo "Use: $0 <plugin_name> "
					echo "Available: "
					echo " all (all plugins above)"
					echo " glpi-modifications"
					echo " glpi-telegrambot"
					echo " glpi-pdf"
					echo " glpi-ocsinventoryng"
					echo " glpi-datainjection"
					echo " glpi-fields"
					echo " glpi-tasklists"
					echo " glpi-formcreator"
					echo " glpi-costs"
					echo " glpi-tags"
					echo " glpi-genericobject"
					echo " glpi-fusioninventory"

				;;

			esac	

		done

	fi

}

#
#
InstallPlugins
#
#
SetPermission
#
#
