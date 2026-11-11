#!/bin/bash
sudo dnf install ngnix -y
sudo systemctl enable nginx
sudo systemctl start ngnix