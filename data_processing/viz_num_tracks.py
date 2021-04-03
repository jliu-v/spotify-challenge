#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# viz_num_tracks.py
# Created on March 31, 2021 at 23:03

import matplotlib.pyplot as plt
import numpy as np


# num_tracks = np.loadtxt('num_tracks.txt')
# u, indices = np.unique(num_tracks, return_index=True)
#
# plt.hist(num_tracks, bins=len(u))
# plt.ylabel('Number')
# plt.title('Number of Tracks')
#
# plt.show()


num_tracks = np.loadtxt('mappings_track_uri.csv',delimiter=',',skiprows=1,usecols=[2])
num_tracks = np.floor(num_tracks/100)
u, indices = np.unique(num_tracks, return_index=True)

plt.hist(num_tracks, bins=len(u))
plt.ylabel('Number')
plt.title('Number of Tracks')

plt.show()