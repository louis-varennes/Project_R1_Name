# Botanica Iris — Présentation du Projet

---

## C'est quoi ce projet ?

On joue le rôle de **data analysts juniors** dans une équipe de recherche en botanique.

On nous donne un tableau de données sur des fleurs iris et on nous pose une question simple :

> **"Est-ce qu'on peut identifier l'espèce d'une fleur juste en regardant ses mesures ?"**

Pour répondre à cette question, on utilise **R**, un langage de programmation spécialisé en statistiques et analyse de données.

---

## Le dataset IRIS — C'est quoi ?

Un **dataset** c'est simplement un tableau de données. Celui qu'on utilise s'appelle IRIS.

Il contient les mesures de **150 fleurs** appartenant à 3 espèces différentes :

| Espèce | Description |
|--------|-------------|
| **Iris Setosa** | Petite fleur aux pétales minuscules |
| **Iris Versicolor** | Fleur de taille intermédiaire |
| **Iris Virginica** | Grande fleur aux pétales larges |

Pour chaque fleur, on a 4 mesures (en cm) :
- La **longueur** et la **largeur** du **sépale** (la feuille verte sous la fleur)
- La **longueur** et la **largeur** du **pétale** (les pétales colorés)

---

## Étape 1 — On découvre les données

La première chose qu'on fait avant toute analyse, c'est **regarder ce qu'on a**.

On charge le dataset et on pose les questions de base :
- Combien de lignes ? → **150 fleurs**
- Combien de colonnes ? → **5 variables**
- Est-ce qu'il manque des données ? → **Non, le dataset est propre**
- Combien de fleurs par espèce ? → **50 par espèce** (dataset équilibré)

C'est comme recevoir un fichier Excel et faire le tour avant de commencer à travailler dessus.

---

## Étape 2 — On analyse les chiffres

On calcule les **statistiques descriptives** pour résumer les données en quelques chiffres clés.

### Ce qu'on a découvert

| Variable | Moyenne | Min | Max |
|----------|---------|-----|-----|
| Sepal.Length | 5.84 cm | 4.3 cm | 7.9 cm |
| Sepal.Width | 3.06 cm | 2.0 cm | 4.4 cm |
| Petal.Length | 3.76 cm | 1.0 cm | 6.9 cm |
| Petal.Width | 1.20 cm | 0.1 cm | 2.5 cm |

La longueur des pétales varie de **1 cm à 6.9 cm** — un écart énorme qui suggère que les espèces sont très différentes sur cette mesure.

### La corrélation — C'est quoi ?

La corrélation mesure le **lien entre deux variables**.

- **Proche de 1** → quand l'une augmente, l'autre aussi
- **Proche de -1** → quand l'une augmente, l'autre diminue
- **Proche de 0** → aucun lien entre les deux

### Ce qu'on a trouvé

- `Petal.Length` et `Petal.Width` → corrélation de **0.96** (lien quasi parfait)
- `Sepal.Length` et `Petal.Length` → corrélation de **0.87** (lien fort)
- `Sepal.Length` et `Sepal.Width` → corrélation de **-0.12** (aucun lien)

**Conclusion** : les mesures des pétales sont très liées entre elles. Les mesures des sépales le sont beaucoup moins.

---

## Étape 3 — On crée les graphiques

On transforme tous ces chiffres en **images** pour les rendre compréhensibles d'un coup d'œil.

---

### Graphique 1 — La Heatmap de Corrélation

**Ce que c'est** : un tableau coloré qui montre les corrélations entre toutes les variables.

**Comment le lire** :
- Plus c'est **rouge foncé** → plus la corrélation est forte et positive
- Plus c'est **bleu** → corrélation négative
- **Blanc** → aucune corrélation

**Ce qu'on voit** : les cases Petal.Length / Petal.Width sont rouge vif (0.96). Les sépales entre eux sont presque blancs.

---

### Graphique 2 — Les Histogrammes

**Ce que c'est** : des barres qui montrent combien de fleurs ont telle ou telle mesure.

**Ce qu'on voit** :
- Sur les **sépales** : les 3 espèces se mélangent, difficile de les distinguer
- Sur les **pétales** : setosa est clairement séparée à gauche (petits pétales), versicolor et virginica sont plus à droite

---

### Graphique 3 — Les Boxplots

**Ce que c'est** : des boîtes qui résument la distribution des données pour chaque espèce.

```
─────────  ← valeur max
│       │
─────────  ← 3ème quartile (Q3)
│       │
═════════  ← médiane (valeur du milieu)
│       │
─────────  ← 1er quartile (Q1)
│       │
─────────  ← valeur min

    •      ← outlier (valeur anormale)
```

**Ce qu'on voit** :
- Les 3 boîtes des pétales sont **complètement séparées** → les espèces ont des tailles très différentes
- Des **points rouges** apparaissent → ce sont des fleurs anormales (outliers)
  - 2-3 setosa ont des pétales anormalement longs pour leur espèce
  - 1 versicolor a un pétale anormalement court

---

### Graphique 4 — Les Violin Plots

**Ce que c'est** : une version améliorée du boxplot. La forme de la boîte suit la vraie distribution des données.

**En plus du boxplot**, on voit :
- Là où la forme est **large** → beaucoup de fleurs ont cette mesure
- Là où la forme est **fine** → peu de fleurs ont cette mesure
- Le **point blanc** = la moyenne (en plus de la médiane)

---

### Graphique 5 — Le Scatter Plot des Pétales ⭐

**C'est le graphique le plus important du projet.**

**Ce que c'est** : chaque point = une fleur. Sa position dépend de la longueur (axe X) et de la largeur (axe Y) de son pétale. Sa couleur = son espèce.

**Ce qu'on voit** : **3 nuages de points clairement séparés**
- Bleu (setosa) → coin en bas à gauche (pétales minuscules)
- Vert (versicolor) → milieu
- Orange (virginica) → coin en haut à droite (grands pétales)

**Ce que ça prouve** : juste avec la longueur et la largeur du pétale, on peut identifier l'espèce d'une fleur. Setosa est parfaite isolée. Versicolor et Virginica se chevauchent très légèrement.

---

### Graphique 6 — Le Scatter Plot des Sépales

**Ce qu'on voit** : les 3 espèces se **mélangent beaucoup** sur ce graphique.

**Conclusion** : les sépales ne permettent pas d'identifier l'espèce aussi bien que les pétales.

---

### Graphique 7 — Le Pair Plot

**Ce que c'est** : une grille qui regroupe **tous les graphiques précédents en un seul**.

- La **diagonale** → courbes de distribution pour chaque variable
- Le **triangle bas** → tous les scatter plots entre chaque paire de variables
- Le **triangle haut** → les corrélations en chiffres avec des étoiles

**Les étoiles signifient :**
- `***` → résultat très fiable (quasi impossible que ce soit du hasard)
- `**` → fiable
- `*` → acceptable
- rien → pas fiable

---

## Étape 4 — Les Conclusions

### Réponse à la question principale

> **"Peut-on identifier l'espèce d'une fleur juste avec ses mesures ?"**

**Oui.** Et en particulier avec les mesures des pétales.

### Ce qu'on a appris

**1. Setosa est parfaitement identifiable**
Ses pétales sont tellement petits (longueur < 2 cm) qu'il est impossible de la confondre avec les deux autres.

**2. Versicolor et Virginica se ressemblent plus**
Elles partagent des zones communes sur certains graphiques, mais restent bien distinctes sur les pétales.

**3. Les pétales sont les variables clés**
`Petal.Length` et `Petal.Width` sont les deux mesures les plus utiles pour distinguer les espèces. Les sépales apportent moins d'information.

**4. Le dataset est propre et équilibré**
Aucune valeur manquante, 50 fleurs par espèce. Idéal pour l'analyse.

**5. Quelques outliers existent**
Quelques fleurs ont des mesures anormales pour leur espèce. Elles ne remettent pas en cause les conclusions générales.

---

## En résumé

Ce projet montre que **les données peuvent révéler des vérités que l'œil ne voit pas**.

Juste en regardant des chiffres dans un tableau, on a réussi à :
- Comprendre la structure des 3 espèces
- Identifier quelles mesures sont les plus importantes
- Visualiser clairement les différences entre espèces
- Détecter des fleurs anormales

C'est exactement ce que fait un data analyst au quotidien.
