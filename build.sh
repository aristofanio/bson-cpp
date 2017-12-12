#!/bin/bash
cd build
./configure LDFLAGS=-L/opt/local/lib CXXFLAGS=-std=c++11 LIBS=-lboost_system-mt