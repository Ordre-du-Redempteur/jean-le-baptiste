#!/bin/bash

sudo cp jean-le-baptiste.sh /usr/local/bin/jean-le-baptiste.sh
sudo chmod +x /usr/local/bin/jean-le-baptiste.sh
sudo cp jean-le-baptiste.service /etc/systemd/system/jean-le-baptiste.service

systemctl daemon-reload
systemctl enable jean-le-baptiste.service

systemctl start jean-le-baptiste.service
systemctl status jean-le-baptiste.service
