#!/usr/bin/env bash

USERS=$(htpasswd -nb $1 $2)

echo "users=${USERS}" > users.env