
# coding: utf-8

# # Chargement du dataset

# In[61]:

#Charger les données 
import pandas as pd
data = {'X': [33, 88, 81, 74, 94, 86, 59, 83, 65, 72, 50, 81],
        'Y': [52, 74, 90, 78, 90, 75, 49, 79, 77, 84, 63, 77]}
df = pd.DataFrame(data, columns=['X', 'Y'])


# In[62]:

#Afficher le graphe Y vs x
import matplotlib.pyplot as plt
get_ipython().magic(u'matplotlib inline')
plt.plot(df.X, df.Y, 'ro')
plt.xlabel('Note examen intra')
plt.ylabel('Note examen final')
plt.show()


# # Shape des données

# In[63]:

#Afficher le ou les prédicteurs et  la cible à prédire
print df.shape


# # Description du dataset

# In[64]:

#Afficher le dataset
df


# # Selection de feature-prédicteur

# In[65]:

#Selectionner le prédicteur


# Le prédicteur est le note de l'examen intra, puisqu'il a eu lieu avant l'examen final

# # Décomposition en apprentissage/test (Train/test)

# In[66]:

# Décomposer les données prédicteurs en training/testing  ou training (à vous de choisir la stratégie)

# Comme le dataset est tres petit, nous allons prendre tout le dataset en apprentissage et un tier de dataset comme test.
train = df[0:12]
test  = df[8:12]


# # Développer le modèle linéaire

# In[67]:

# Créer l'objet linear regression  
from sklearn import linear_model
regression = linear_model.LinearRegression()


# # Procéder à l'apprentissage du modèle

# In[68]:

# Faire apprendre le model en utilisant le set
regression.fit(train.X.reshape(-1, 1), train.Y)


# # Affichage des coefficients estimés

# In[69]:

# Affichage de slope et intercept

print "slope: ", regression.coef_, "intercept: ", regression.intercept_


# # Affichage de l'erreur RSS

# In[70]:

# mean square error
from sklearn.metrics import mean_squared_error
mean_squared_error(train.Y, regression.predict(train.X.reshape(-1, 1)))


# # Prédiction avec le modèle obtenu

# In[71]:

#Predire la note de l'examen final
print "Un étudiant qui a reçu 86 à l'examen intra va probablement obtenir comme note à l'examen final:"
print regression.predict(86)


# In[ ]:



