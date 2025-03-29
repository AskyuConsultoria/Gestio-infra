PUBLIC_IP=$1


cat << EOF > default.conf
server { 
    listen 80;
    server_name $PUBLIC_IP;

    root /var/www/html/public;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    location /askyu {
        proxy_pass http://localhost:8080/askyu;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF
