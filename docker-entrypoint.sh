#!/bin/bash

bash -c "/usr/sbin/riak start"
tail -f /var/log/riak/*
