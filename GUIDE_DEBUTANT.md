# Guide Débutant — Botanica Iris

Ce guide explique comment installer les outils et lancer le projet, même si tu n'as jamais fait de R.

---

## Étape 1 — Installer R

R est le langage de programmation qu'on utilise dans ce projet.

1. Va sur ce site : **https://cran.r-project.org/bin/macosx/**
2. Télécharge la version pour ton Mac
3. Ouvre le fichier téléchargé et suis les instructions d'installation

---

## Étape 2 — Installer RStudio

RStudio c'est le logiciel qui te permet d'écrire et d'exécuter du code R facilement. C'est un peu comme Word mais pour coder.

1. Va sur ce site : **https://posit.co/download/rstudio-desktop/**
2. Clique sur "Download RStudio Desktop"
3. Télécharge le fichier `.dmg` (Mac) et installe-le

> Si tu es sur Mac avec Homebrew, tu peux aussi faire dans le terminal :
> ```
> brew install r
> brew install --cask rstudio
> ```

---

## Étape 3 — Récupérer le projet

1. Va sur GitHub : **https://github.com/louis-varennes/Project_R1_Name**
2. Clique sur le bouton vert **"Code"**
3. Clique sur **"Download ZIP"**
4. Décompresse le fichier ZIP sur ton Bureau

---

## Étape 4 — Ouvrir le projet dans RStudio

1. Ouvre RStudio
2. Clique sur **File > Open File**
3. Navigue jusqu'au dossier que tu as décompressé
4. Sélectionne le fichier **`botanica_iris.R`** et clique sur Ouvrir

Tu devrais voir le code s'afficher dans la partie gauche de RStudio.

---

## Étape 5 — Installer les packages nécessaires

Les packages sont des boîtes à outils supplémentaires pour R. On en a besoin 4.

En haut du fichier `botanica_iris.R`, tu vois ces lignes commentées (avec un `#` devant) :

```r
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("reshape2")
# install.packages("GGally")
```

**Ce que tu dois faire :**
1. Sélectionne ces 4 lignes
2. Supprime le `#` devant chaque ligne
3. Sélectionne les 4 lignes et appuie sur **Cmd + Enter** (Mac) ou **Ctrl + Enter** (Windows)
4. Attends que l'installation soit terminée (1-2 minutes)
5. Remets les `#` devant chaque ligne (pour ne pas les réinstaller à chaque fois)

---

## Étape 6 — Lancer le code

### Option A — Tout lancer d'un coup
1. Appuie sur **Cmd + A** (Mac) ou **Ctrl + A** (Windows) pour tout sélectionner
2. Appuie sur **Cmd + Enter** (Mac) ou **Ctrl + Enter** (Windows) pour tout exécuter
3. Les graphiques apparaissent dans le panneau **Plots** en bas à droite

### Option B — Lancer bloc par bloc (recommandé pour apprendre)
1. Sélectionne quelques lignes de code
2. Appuie sur **Cmd + Enter** / **Ctrl + Enter**
3. Regarde ce qui s'affiche dans la console en bas

---

## Comment est organisé RStudio ?

```
┌─────────────────────┬─────────────────────┐
│                     │                     │
│   Ton code R        │   Environnement     │
│   (botanica_iris.R) │   (variables)       │
│                     │                     │
├─────────────────────┼─────────────────────┤
│                     │                     │
│   Console           │   Plots             │
│   (résultats)       │   (graphiques)      │
│                     │                     │
└─────────────────────┴─────────────────────┘
```

- **Haut gauche** : ton fichier de code
- **Haut droite** : les variables chargées en mémoire
- **Bas gauche** : la console où s'affichent les résultats
- **Bas droite** : les graphiques générés

---

## Ce que fait le code

Le code est divisé en 4 étapes :

**Étape 1** — Charge le dataset IRIS (déjà intégré dans R, pas besoin de fichier externe) et affiche sa structure

**Étape 2** — Calcule des statistiques : moyennes, médianes, corrélations entre les variables

**Étape 3** — Crée les graphiques : histogrammes, boxplots, scatter plots

**Étape 4** — Affiche un résumé des conclusions dans la console

---

## Le dataset IRIS c'est quoi ?

C'est un tableau de **150 fleurs** avec leurs mesures :

| Colonne | Description |
|---------|-------------|
| `Sepal.Length` | Longueur du sépale (cm) |
| `Sepal.Width` | Largeur du sépale (cm) |
| `Petal.Length` | Longueur du pétale (cm) |
| `Petal.Width` | Largeur du pétale (cm) |
| `Species` | L'espèce : setosa, versicolor ou virginica |

Le but : déterminer si on peut identifier l'espèce d'une fleur juste avec ses mesures.

---

## En cas de problème

**Erreur "impossible de trouver la fonction"**
→ Tu as oublié de charger un package. Exécute les lignes `library()` en haut du fichier.

**Les graphiques n'apparaissent pas**
→ Clique sur l'onglet **Plots** en bas à droite de RStudio.

**Erreur lors de l'installation d'un package**
→ Vérifie que tu as bien une connexion internet et réessaie.
