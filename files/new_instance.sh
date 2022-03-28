#!/bin/bash

echo "Hello. This is the script to prepare your instance for a PostgreSQL backup. Continue installation?"
read ANSWER 
 
echo -ne "Choose you OS:\n1.OEL7\n2.CentOS7\n3.OEL8\n4.CentOS8\n5.RHEL7\n6.RHEL8\n"
read OS_VER

read -p "Enter PG major version [10-14]: " PG_VER

case $ANSWER in 
 
        yes)
        if [[ "$OS_VER" == "1" ]]; then
            echo -ne "You choose OEL7. Install pg_probackup...\n"
            echo "rpm -ivh https://repo.postgrespro.ru/pg_probackup/keys/pg_probackup-repo-oraclelinux.noarch.rpm >/dev/null"
            echo "yum install -y pg_probackup-$PG_VER >/dev/null"
            echo "yum install -y pg_probackup-$PG_VER-debuginfo >/dev/null"
            echo "Pg_probackup successfully installed!\n"
        elif [[ "$OS_VER" == "2" ]]; then
            echo -ne "You choose CentOS7. Install pg_probackup...\n"
            echo "rpm -ivh https://repo.postgrespro.ru/pg_probackup/keys/pg_probackup-repo-centos.noarch.rpm >/dev/null"
            echo "yum install -y pg_probackup-$PG_VER >/dev/null"
            echo "yum install -y pg_probackup-$PG_VER-debuginfo >/dev/null"
            echo "Pg_probackup successfully installed!\n"
        elif [[ "$OS_VER" == "3" ]]; then
            echo -ne "You choose OEL8. Install pg_probackup...\n"
            echo "rpm -ivh https://repo.postgrespro.ru/pg_probackup/keys/pg_probackup-repo-oraclelinux.noarch.rpm >/dev/null"
            echo "dnf install -y pg_probackup-$PG_VER >/dev/null"
            echo "dnf install -y pg_probackup-$PG_VER-debuginfo >/dev/null"
            echo "Pg_probackup successfully installed!\n"
        elif [[ "$OS_VER" == "4" ]]; then
            echo -ne "You choose CentOS8. Install pg_probackup...\n"
            echo "rpm -ivh https://repo.postgrespro.ru/pg_probackup/keys/pg_probackup-repo-centos.noarch.rpm >/dev/null"
            echo "dnf install -y pg_probackup-$PG_VER >/dev/null"
            echo "dnf install -y pg_probackup-$PG_VER-debuginfo >/dev/null"
            echo "Pg_probackup successfully installed!\n"
        elif [[ "$OS_VER" == "5" ]]; then
            echo -ne "You choose RHEL7. Install pg_probackup...\n"
            echo "rpm -ivh https://repo.postgrespro.ru/pg_probackup/keys/pg_probackup-repo-rhel.noarch.rpm >/dev/null"
            echo "yum install -y pg_probackup-$PG_VER >/dev/null"
            echo "yum install -y pg_probackup-$PG_VER-debuginfo >/dev/null"
            echo "Pg_probackup successfully installed!\n"
        elif [[ "$OS_VER" == "6" ]]; then
            echo -ne "You choose RHEL8. Install pg_probackup...\n"
            echo "rpm -ivh https://repo.postgrespro.ru/pg_probackup/keys/pg_probackup-repo-rhel.noarch.rpm >/dev/null"
            echo "dnf install -y pg_probackup-$PG_VER >/dev/null"
            echo "dnf install -y pg_probackup-$PG_VER-debuginfo >/dev/null"
            echo "Pg_probackup successfully installed!\n"
        else
            echo "Error, you don't choose OS"
            exit
        fi
        echo "Create pgproback user...\n"
        echo "useradd pgproback$PGVER -G postgres"
        sleep 3
        echo "User created!"
        echo "Add entry to pg_hba.conf...\n"
        echo "host replication pgproback 0.0.0.0/0 md5"
        sleep 3
        echo "Entry added!"
        echo "Launch SQL script...\n"
        sleep 3
        echo "Script done!\n"
        echo "Installation completed successfully!"
        ;; 
 
        no) 
        echo "Script stopped\n" 
        ;; 
 
        *) 
        echo "Wrong answer\n" 
        ;; 
esac