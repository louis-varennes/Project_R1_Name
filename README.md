# Botanica Iris 🌸

Analyse exploratoire du dataset IRIS avec R et ggplot2.

## Objectif

Explorer le dataset IRIS pour comprendre les relations entre les variables et déterminer si les mesures de fleurs permettent d'identifier leur espèce.

## Dataset

Le dataset IRIS contient **150 observations** réparties en 3 espèces :
- Iris Setosa
- Iris Versicolor
- Iris Virginica

Chaque fleur est décrite par 4 mesures (en cm) :
- Longueur du sépale (`Sepal.Length`)
- Largeur du sépale (`Sepal.Width`)
- Longueur du pétale (`Petal.Length`)
- Largeur du pétale (`Petal.Width`)

## Structure du projet

```
Project_R1_Botanica/
├── botanica_iris.R     # Code R principal (4 étapes)
├── README.md           # Ce fichier
└── plots/              # Graphiques générés
```

## Étapes de l'analyse

### Étape 1 — Exploration des données
- Chargement et observation du dataset
- Analyse des types de variables
- Détection des valeurs manquantes (aucune trouvée)

### Étape 2 — Statistiques descriptives
- Moyennes, médianes, écart-types par espèce
- Matrice de corrélation
- Heatmap des corrélations

### Étape 3 — Visualisations
- Histogrammes de répartition par espèce
- Boxplots et Violin plots pour détecter les outliers
- Scatter plots pour analyser les relations entre variables
- Pair plot complet (GGally)

### Étape 4 — Conclusions
- `Petal.Length` et `Petal.Width` sont les variables les plus discriminantes
- Iris Setosa est parfaitement séparable des deux autres espèces
- Iris Versicolor et Virginica se chevauchent légèrement

## Packages utilisés

- `ggplot2` — visualisation
- `dplyr` — manipulation des données
- `reshape2` — transformation de la matrice de corrélation
- `GGally` — pair plot

## Lancer le projet

1. Ouvrir `botanica_iris.R` dans RStudio
2. Installer les packages (lignes commentées en haut du fichier)
3. Exécuter le code bloc par bloc ou entièrement (`Cmd + A` puis `Cmd + Enter`)
