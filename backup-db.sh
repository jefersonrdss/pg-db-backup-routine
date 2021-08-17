#!/bin/bash
#
# Author: Jeferson Rodrigues <jefersonr.santos@outlook.com>
# Created_at: 2021-08-17
# Updated_at: 2021-08-17
#
# Rotina de backup (create and delete) da base de dados
# PostgreSQL 13x
# ---------------------------------------------------------
#
# Args --create or --delete
arg=$1

# backup dir
backup_dir="/var/lib/postgresql/backup-db"

# backup file name
backup_file=backup-db_`date +%Y%m%d%H%M`.tar

# database name
database_name="database"

# Create backup
if [ $arg = "--create" ];
then
    echo "`date '+%Y-%m-%d %H:%M:%S'` Iniciando backup da base de dados"
    echo "`date '+%Y-%m-%d %H:%M:%S'` Acessando diretório do backup ($backup_dir)"
    cd $backup_dir
    echo "`date '+%Y-%m-%d %H:%M:%S'` Executando backup..."
    seconds_before=`date +%s`

    # pg_dump exec
    pg_dump -Ft $database_name > $backup_file
    seconds_after=`date +%s`

    timer_exec=`expr "$seconds_after" - "$seconds_before"`
    echo "`date '+%Y-%m-%d %H:%M:%S'` Backup finalizado"
    echo "`date '+%Y-%m-%d %H:%M:%S'` Duração: $timer_exec segundos"
    echo "`date '+%Y-%m-%d %H:%M:%S'` Tamanho do arquivo de backup: `du -sh $backup_file |cut -c 1-5`"
    echo "`date '+%Y-%m-%d %H:%M:%S'` Arquivo de backup gerado: $backup_file"
    echo -e "`date '+%Y-%m-%d %H:%M:%S'` Finalizado\n"


# Delete backup
elif [ $arg = "--delete" ];
then
    echo "`date '+%Y-%m-%d %H:%M:%S'` Iniciando remoção do arquivo de backup"
    echo "`date '+%Y-%m-%d %H:%M:%S'` Acessando diretório do backup ($backup_dir)"
    cd $backup_dir
    backup_file_delete=`ls backup-db_*.tar`

    echo "`date '+%Y-%m-%d %H:%M:%S'` Arquivo que será removido: $backup_file_delete"
    echo "`date '+%Y-%m-%d %H:%M:%S'` Tamanho do arquivo que será removido: `du -sh $backup_file_delete |cut -b 1-5`"

    # delete file exec
    rm -f backup-db_*.tar

    echo "`date '+%Y-%m-%d %H:%M:%S'` Arquivo de backup removido"
    echo -e "`date '+%Y-%m-%d %H:%M:%S'` Finalizado\n"

else
    echo "Argumento inválido. Permitido apenas --create e --delete"
fi