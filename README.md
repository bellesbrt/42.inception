Comando para criação do .env: 

echo '
CERTS_PATH=/etc/ssl/certs/localhost.crt
CERTS_KEY=/etc/ssl/private/localhost.key
WORDPRESS_ROOT_PASSWORD=123456ROOT
WORDPRESS_USER=user42
WORDPRESS_PASSWORD=123456
WORDPRESS_DATABASE=db42' > .env
