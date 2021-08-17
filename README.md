## PostgreSQL 13x Backup Database | Shell Script
### Passo a passo para usar o script<br><br>
#

O script deve ser executado com o usuário <strong>postgres</strong>
```sh
su - postgres
```

Dentro do diretório home do usuário postgres, crie a pasta <strong>backup-db</strong>
```sh
mkdir backup-db # o script backup-db.sh precisa estar dentro desta pasta

# permissão de execução
chmod 600 backup-db.sh
```

Para criar o backup, execute o comando:
```sh
/var/lib/postgresql/backup-db/backup-db.sh --create
```

Para deletar o backup, execute o comando:
```sh
/var/lib/postgresql/backup-db/backup-db.sh --delete
```

```js
/**
 * Script: PostgreSQL 13x Database Backup Routine
 * Author: Jeferson Rodrigues
 * Email: jefersonr.santos@outlook.com
 * Created at: 2021-08-17
 * Updated at: 2021-08-17
 * 
 * Script desenvolvido com Shell Script
 */
 ```