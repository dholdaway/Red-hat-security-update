#### RHEL Security Updates Script

this script will install security updates only on a redhat host.

it will create two files on the host 
        
        1. /var/log/security-update.log
        2. /var/log/security-report.log

the first file will be emailed to the users listed in the 

	receiver="email address goes here""

of the securityupdateRH_1.1.sh file.

### Install Dependences

you will need to make sure that the host / box / server is receving updates and has an active Redhat subscription

so run from the command line

	subscription-manager register
enter username and password 

then run 

	subscription-manager attach --auto

followed by

	yum install yum-plugin-security

if using git you will need to run 'yum install git-core'

### Copy files to server

Make a directory on the server that will contain the scripts.

	mkdir /opt/scripts/management_scripts

copy files to the newly created folder.

	/opt/scripts/management_scripts

### Make Files executable

change directory to the management_scripts folder

	cd /opt/scripts/management_scripts

make the files user executable

	chmod u+x securityupdateRH_1.1.sh

and

	chmod u+x restartfailprocess.sh

### create a Cronjob

from the command line run 

	sudo crontab -e

then add the following lines 

	30 8 1 * * /opt/scripts/management_scripts/securityupdate_1.1.sh #Runs at 8:30 am on the first day of every month

and

	30 * * * * /opt/scripts/management_scripts/restartfailprocess.sh #Runs every 30mins
