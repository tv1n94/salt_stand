#Install nginx
nginx:
  pkg:
    - installed
  #start nginx service
  service:
    - running
    #check version nginx and state file /etc/nginx/nginx.conf
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

#Add new file
/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 644

#Add index.html template
/var/www/html/index.nginx-debian.html:
  file.managed:
    - source: salt://nginx/index.html.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

#restart nginx 
systemd-resolved:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx