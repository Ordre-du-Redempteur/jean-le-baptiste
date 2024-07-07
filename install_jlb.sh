#!/bin/bash

sudo cp jean-le-baptiste.sh /usr/local/bin/jean-le-baptiste.sh
sudo chmod +x /usr/local/bin/jean-le-baptiste.sh
sudo cp bible_fr_courrant.json /usr/local/bin/bible_fr_courrant.json
sudo cp jean-le-baptiste.service /etc/systemd/system/jean-le-baptiste.service

sudo systemctl daemon-reload
sudo systemctl enable jean-le-baptiste.service

sudo systemctl start jean-le-baptiste.service

sudo systemctl status jean-le-baptiste.service
