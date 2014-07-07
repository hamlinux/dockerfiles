# rampantmonkey/nginx

Image for nginx.
By default this images runs nginx on port 80 with files stored in `/var/www`.

Example usage:

    docker run -d -p 80:80  -v /data/logs:/var/log/nginx -v /data/www:/var/www rampantmonkey/nginx
