# ================================
# K-MEANS CLUSTERING DEMONSTRATION
# ================================

# Importing required libraries

# RandomState is a random number generator class from numpy.
# (NOTE: It is not actually used in this code, so it can be removed.)
from numpy.random import RandomState  

# numpy is used for numerical operations and array handling
import numpy as np  

# matplotlib is used for plotting graphs and visualizing data
import matplotlib.pyplot as plt  

# KMeans is a clustering algorithm from sklearn
# It is used to divide data into 'k' number of clusters
from sklearn.cluster import KMeans  



# =====================================
# STEP 1: GENERATING RANDOM DATA POINTS
# =====================================

# Setting random seed ensures reproducibility.
# This means every time you run the code,
# the same 100 random points will be generated.
np.random.seed(43)

# np.random.rand(100, 2) generates:
# 100 rows (100 data points)
# 2 columns (2 features per data point -> x and y)
# Each value is between 0 and 1
X = np.random.rand(100, 2)

# Now X is a 100x2 matrix:
# Example:
# [[0.11, 0.60],
#  [0.13, 0.24],
#  ...
# ]
# Each row represents a 2D point in space.



# =====================================
# STEP 2: APPLYING K-MEANS CLUSTERING
# =====================================

# Creating KMeans object:
# n_clusters = 3 → we want 3 clusters
# random_state = 43 → ensures same centroid initialization each run
kmeans = KMeans(n_clusters=3, random_state=43)

# .fit(X) trains the model using dataset X.
# Internally, KMeans algorithm does:
#
# 1. Randomly choose 3 initial centroids.
# 2. Compute distance of each point to all centroids.
# 3. Assign each point to the nearest centroid.
# 4. Recalculate centroid positions by taking mean of assigned points.
# 5. Repeat steps 2–4 until centroids stop changing (convergence).
kmeans.fit(X)



# =====================================
# STEP 3: EXTRACTING RESULTS
# =====================================

# cluster_centers_ stores coordinates of final centroids.
# Shape will be (3,2) because we have 3 clusters and 2 features.
centers = kmeans.cluster_centers_

# labels_ stores cluster assignment for each data point.
# It is an array of length 100.
# Each value is either 0, 1, or 2.
labels = kmeans.labels_

# Example:
# labels = [0, 2, 1, 0, 1, 2, ...]
# This means:
# First point → cluster 0
# Second point → cluster 2
# Third point → cluster 1



# =====================================
# STEP 4: SAVING DATASET TO CSV FILE
# =====================================

# np.savetxt saves the array X into a CSV file.
# "Random_data.csv" → file name
# delimiter="," → values separated by comma
np.savetxt("Random_data.csv", X, delimiter=",")

# After running, a file named Random_data.csv
# will be created in the same directory.



# =====================================
# STEP 5: VISUALIZING THE CLUSTERS
# =====================================

# Plotting the data points

# X[:, 0] → All x-coordinates
# X[:, 1] → All y-coordinates
#
# c=labels → Color each point according to its cluster label
# cmap='viridis' → Color scheme used for visualization
plt.scatter(X[:, 0], X[:, 1], c=labels, cmap='viridis')


# Plotting the centroids

# centers[:, 0] → x-coordinates of centroids
# centers[:, 1] → y-coordinates of centroids
#
# c='red' → centroid color is red
# marker='x' → display as 'X'
# s=200 → size of marker
plt.scatter(centers[:, 0], centers[:, 1], 
            c='red', 
            marker='x', 
            s=200)


# Adding title to the graph
plt.title("K-Means Clustering (k=3)")

# Displaying the final plot window
plt.show()



# =====================================
# SUMMARY OF WHAT THIS PROGRAM DOES
# =====================================
#
# 1. Generates 100 random 2D data points.
# 2. Applies K-Means clustering with k=3.
# 3. Divides points into 3 groups based on distance.
# 4. Computes final centroids.
# 5. Saves dataset into CSV file.
# 6. Displays colored cluster visualization.
#
# Mathematical Objective of K-Means:
# Minimize sum of squared distances:
#
#     Σ || x - μ ||²
#
# Where:
# x  = data point
# μ  = centroid of cluster
#
# Time Complexity:
# O(n * k * d * i)
# n = number of data points
# k = number of clusters
# d = dimensions
# i = iterations
#
