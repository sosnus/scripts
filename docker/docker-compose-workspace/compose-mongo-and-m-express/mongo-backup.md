mongodump
No Auth : 'docker exec <mongodb container> sh -c 'mongodump --archive' > db.dump'

Authenticated : 'docker exec <mongodb container> sh -c 'mongodump --authenticationDatabase admin -u <user> -p <password> --db <database> --archive' > db.dump'

mongorestore
No Auth : 'docker exec -i <mongodb container> sh -c 'mongorestore --archive' < db.dump'

Authenticated : 'docker exec -i <mongodb container> sh -c 'mongorestore --authenticationDatabase admin -u <user> -p <password> --db <database> --archive' < db.dump'
