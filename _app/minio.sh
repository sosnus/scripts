# download and prepare client (mc) (without installation)
wget https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
./mc --help

# add minio server to client
./mc config host add mctebe http://tebe.westeurope.cloudapp.azure.com:9000 AKIAIOSFODNN7EXAMPLE wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

# test, info
./mc admin info mctebe

# minio add user
mc admin user add mctebe newuser newuser123


