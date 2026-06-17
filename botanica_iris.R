# =============================================================================
# BOTANICA IRIS - Analyse Exploratoire du Dataset IRIS
# Projet La Plateforme
# =============================================================================

# Installation des packages nécessaires (à faire une seule fois)
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("reshape2")
# install.packages("GGally")

library(ggplot2)
library(dplyr)
library(reshape2)
library(GGally)


# =============================================================================
# ÉTAPE 1 : EXPLORATION ET PRÉPARATION DES DONNÉES
# =============================================================================

# --- Chargement du dataset ---
# Le dataset IRIS est intégré dans R, pas besoin de fichier externe
data(iris)

# --- Observation générale ---
# Affiche les 6 premières lignes du tableau
head(iris)

# Affiche les 6 dernières lignes
tail(iris)

# Dimensions du dataset : nombre de lignes et colonnes
dim(iris)

# Structure : types de chaque variable
str(iris)

# Résumé statistique rapide de toutes les colonnes
summary(iris)

# --- Types de variables ---
# Les 4 premières colonnes sont numériques (mesures en cm)
# La 5ème colonne "Species" est un facteur (variable catégorielle)
# On vérifie les 3 espèces présentes
levels(iris$Species)

# Nombre d'observations par espèce (50 par espèce, dataset équilibré)
table(iris$Species)

# --- Détection des valeurs manquantes ---
# colSums compte le nombre de NA par colonne
colSums(is.na(iris))

# Résultat attendu : 0 pour toutes les colonnes (dataset propre)


# =============================================================================
# ÉTAPE 2 : STATISTIQUES DESCRIPTIVES ET ANALYSE DES RELATIONS
# =============================================================================

# --- Tendance centrale et dispersion ---

# Moyenne de chaque variable numérique
colMeans(iris[, 1:4])

# Médiane
apply(iris[, 1:4], 2, median)

# Écart-type (mesure de dispersion)
apply(iris[, 1:4], 2, sd)

# Quartiles (Q1 et Q3)
apply(iris[, 1:4], 2, quantile, probs = c(0.25, 0.75))

# Statistiques détaillées par espèce avec dplyr
iris %>%
  group_by(Species) %>%
  summarise(
    moy_sepal_long  = mean(Sepal.Length),
    med_sepal_long  = median(Sepal.Length),
    sd_sepal_long   = sd(Sepal.Length),
    moy_petal_long  = mean(Petal.Length),
    med_petal_long  = median(Petal.Length),
    sd_petal_long   = sd(Petal.Length)
  )

# --- Matrice de corrélation ---
# On calcule la corrélation entre les 4 variables numériques
# Valeur proche de 1 = forte corrélation positive
# Valeur proche de -1 = forte corrélation négative
# Valeur proche de 0 = pas de corrélation
matrice_corr <- cor(iris[, 1:4])
print(round(matrice_corr, 2))

# --- Heatmap de la corrélation ---
# On transforme la matrice en format long pour ggplot2
corr_long <- melt(matrice_corr)

ggplot(corr_long, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2)), size = 4) +
  scale_fill_gradient2(
    low = "#3B82F6", mid = "white", high = "#EF4444",
    midpoint = 0, limit = c(-1, 1), name = "Corrélation"
  ) +
  labs(
    title = "Heatmap de Corrélation - Dataset IRIS",
    x = "", y = ""
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# =============================================================================
# ÉTAPE 3 : VISUALISATION ET IDENTIFICATION DES TENDANCES
# =============================================================================

# --- Histogrammes ---
# Répartition de la longueur des sépales par espèce
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(bins = 20, alpha = 0.7, position = "identity") +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Répartition de la Longueur des Sépales par Espèce",
    x = "Longueur du Sépale (cm)",
    y = "Fréquence"
  ) +
  theme_minimal()

# Répartition de la longueur des pétales par espèce
ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(bins = 20, alpha = 0.7, position = "identity") +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Répartition de la Longueur des Pétales par Espèce",
    x = "Longueur du Pétale (cm)",
    y = "Fréquence"
  ) +
  theme_minimal()

# --- Boxplots ---
# Permet de visualiser la médiane, les quartiles et les outliers

# Boxplot : longueur des sépales
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot(alpha = 0.8, outlier.color = "red", outlier.size = 2) +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Boxplot - Longueur des Sépales par Espèce",
    x = "Espèce",
    y = "Longueur du Sépale (cm)"
  ) +
  theme_minimal()

# Boxplot : longueur des pétales
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot(alpha = 0.8, outlier.color = "red", outlier.size = 2) +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Boxplot - Longueur des Pétales par Espèce",
    x = "Espèce",
    y = "Longueur du Pétale (cm)"
  ) +
  theme_minimal()

# Boxplot : largeur des pétales
ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) +
  geom_boxplot(alpha = 0.8, outlier.color = "red", outlier.size = 2) +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Boxplot - Largeur des Pétales par Espèce",
    x = "Espèce",
    y = "Largeur du Pétale (cm)"
  ) +
  theme_minimal()

# --- Violin Plots ---
# Combine la forme de la distribution + la boîte en un seul graphique

# Violin plot : longueur des pétales
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin(alpha = 0.7) +
  geom_boxplot(width = 0.1, alpha = 0.9, outlier.color = "red", outlier.size = 2) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "white") +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Violin Plot - Longueur des Pétales par Espèce",
    subtitle = "La forme montre la distribution, le trait noir = médiane, le point blanc = moyenne",
    x = "Espèce",
    y = "Longueur du Pétale (cm)"
  ) +
  theme_minimal()

# Violin plot : largeur des pétales
ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) +
  geom_violin(alpha = 0.7) +
  geom_boxplot(width = 0.1, alpha = 0.9, outlier.color = "red", outlier.size = 2) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "white") +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Violin Plot - Largeur des Pétales par Espèce",
    subtitle = "La forme montre la distribution, le trait noir = médiane, le point blanc = moyenne",
    x = "Espèce",
    y = "Largeur du Pétale (cm)"
  ) +
  theme_minimal()

# --- Scatter Plot ---
# Relation entre longueur et largeur des pétales
# C'est le graphique le plus discriminant pour séparer les espèces
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  scale_color_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Scatter Plot - Longueur vs Largeur des Pétales",
    subtitle = "Les 3 espèces sont clairement séparées sur ce graphique",
    x = "Longueur du Pétale (cm)",
    y = "Largeur du Pétale (cm)"
  ) +
  theme_minimal()

# Scatter Plot : sépales (moins discriminant)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  scale_color_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(
    title = "Scatter Plot - Longueur vs Largeur des Sépales",
    subtitle = "Les espèces se chevauchent davantage sur les sépales",
    x = "Longueur du Sépale (cm)",
    y = "Largeur du Sépale (cm)"
  ) +
  theme_minimal()


# --- Pair Plot ---
# Affiche tous les scatter plots possibles entre les 4 variables en une seule image
# C'est le graphique le plus complet pour visualiser toutes les relations d'un coup
ggpairs(
  iris,
  aes(color = Species, alpha = 0.7),
  columns = 1:4
) +
  scale_color_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  scale_fill_manual(values = c("#3B82F6", "#10B981", "#F59E0B")) +
  labs(title = "Pair Plot - Toutes les relations entre variables") +
  theme_minimal()


# =============================================================================
# ÉTAPE 4 : SYNTHÈSE ET CONCLUSIONS
# =============================================================================

# --- Résumé des insights clés ---
cat("
=== SYNTHÈSE DE L'ANALYSE BOTANICA IRIS ===

1. STRUCTURE DU DATASET
   - 150 observations, 5 variables
   - 3 espèces : setosa, versicolor, virginica (50 chacune)
   - Aucune valeur manquante

2. CORRÉLATIONS FORTES
   - Petal.Length / Petal.Width : corrélation ~0.96 (très forte)
   - Petal.Length / Sepal.Length : corrélation ~0.87 (forte)
   - Sepal.Length / Sepal.Width : corrélation ~-0.11 (quasi nulle)

3. DIFFÉRENCES ENTRE ESPÈCES
   - Iris setosa : pétales très petits, clairement séparée des deux autres
   - Iris versicolor : valeurs intermédiaires
   - Iris virginica : pétales et sépales les plus grands

4. OUTLIERS DÉTECTÉS
   - Quelques outliers sur les boxplots de Sepal.Width pour setosa
   - Versicolor présente des valeurs extrêmes sur Sepal.Width

5. CLASSIFICATION POSSIBLE ?
   - Oui : les mesures des pétales suffisent presque à identifier l'espèce
   - Le scatter plot Petal.Length vs Petal.Width montre 3 clusters distincts
   - Setosa est parfaitement séparée ; versicolor et virginica se chevauchent légèrement
")
