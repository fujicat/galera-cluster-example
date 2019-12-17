# Galera Cluster verification environment

Docker container for Galera Cluster verification.  
There are node01 to node05, node01 to node04 have been replicated, and node05 has mysql not started.

Start and stop the service with supervisorctl.
- Start: `supervisorctl start mysqld`
- Stop: `supervisorctl stop mysqld`

Each node's mysql is listening on the host computer with port number 11101 to 11105.  
A database has been created with the name `galera_test` for verification, and you can connect with user name:` galera` and password: `password`.

```
mysql -u galera -ppassword -P 11101
```