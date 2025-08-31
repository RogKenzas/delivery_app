# Shipping Record Interface - Documentation

## Vue d'ensemble

L'interface "Shipping Record" est une interface professionnelle et moderne qui respecte exactement le design fourni. Elle permet aux utilisateurs de visualiser, filtrer et gérer leurs enregistrements d'expédition.

## Fonctionnalités

### 1. Interface utilisateur
- **Header** : Titre "Shipping Record" avec menu d'options (trois points)
- **Filtres** : Onglets pour filtrer par statut (All, Complete, In Delivery, Pending)
- **Liste des enregistrements** : Cartes détaillées pour chaque expédition
- **Navigation** : Barre de navigation inférieure avec 5 onglets

### 2. Cartes d'enregistrement
Chaque carte affiche :
- Icône 3D box avec couleur selon le statut
- ID Number et statut
- Numéro de suivi
- Date d'expédition
- Localisation
- Boutons d'action (Track, View Details)

### 3. Statuts et couleurs
- **Pending** : Gris (#666666)
- **In Delivery** : Orange (#FF7A00) - notre couleur primaire
- **Complete** : Vert (#4CAF50)
- **Cancelled** : Rouge (#F44336)

## Architecture technique

### Modèles de données
- `ShippingRecord` : Modèle principal avec tous les champs nécessaires
- `ShippingEvent` : Modèle pour l'historique des événements
- `ShippingStatus` : Enum pour les différents statuts
- `ShippingFilter` : Enum pour les filtres

### Services
- `ShippingService` : Service complet pour l'API backend
- Gestion des erreurs et timeouts
- Support de la pagination et recherche
- CRUD complet (Create, Read, Update, Delete)

### Composants UI
- `ShippingFilterTabs` : Onglets de filtre
- `ShippingRecordCard` : Cartes d'enregistrement
- `ShippingRecordScreen` : Écran principal

## API Backend

### Endpoints
```
GET    /shipping-records          - Liste des enregistrements
GET    /shipping-records/{id}     - Détails d'un enregistrement
POST   /shipping-records          - Créer un enregistrement
PUT    /shipping-records/{id}     - Mettre à jour un enregistrement
DELETE /shipping-records/{id}     - Supprimer un enregistrement
GET    /shipping-records/track/{trackingNumber} - Suivre un enregistrement
GET    /shipping-records/{id}/events - Historique des événements
GET    /shipping-records/search   - Recherche d'enregistrements
```

### Paramètres de requête
- `status` : Filtrer par statut
- `page` : Numéro de page pour la pagination
- `limit` : Nombre d'éléments par page
- `q` : Terme de recherche

### Structure de réponse
```json
{
  "data": [
    {
      "id": "JK126K532",
      "trackingNumber": "34589762",
      "dateShipped": "2024-07-13T00:00:00.000Z",
      "location": "Aldo",
      "status": "inDelivery",
      "destination": "Douala",
      "recipientName": "John Doe",
      "recipientPhone": "+237612345678",
      "description": "Package description",
      "weight": 2.5,
      "carrier": "Express Delivery",
      "estimatedDelivery": "2024-07-15T00:00:00.000Z",
      "actualDelivery": null,
      "events": [
        {
          "description": "Package picked up",
          "timestamp": "2024-07-13T10:00:00.000Z",
          "location": "Aldo",
          "status": "picked_up"
        }
      ]
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "pages": 5
  }
}
```

## Configuration

### Variables d'environnement
```bash
API_BASE_URL=https://api.seed.com
API_KEY=your_api_key_here
```

### Fichier de configuration
`lib/config/app_config.dart` contient toutes les configurations :
- URLs d'API
- Timeouts
- Tailles de pagination
- Configuration des retry et cache

## Installation et utilisation

### 1. Installer les dépendances
```bash
flutter pub get
```

### 2. Configurer l'API
Modifier `lib/config/app_config.dart` ou définir les variables d'environnement.

### 3. Lancer l'application
```bash
flutter run
```

### 4. Accéder à l'interface
Cliquer sur "See All" dans l'écran d'accueil ou naviguer directement vers `ShippingRecordScreen`.

## Personnalisation

### Couleurs
Les couleurs sont définies dans `lib/theme/design_system.dart` :
- `AppColors.brandPrimary` : Orange principal (#FF7A00)
- `AppColors.neutralBlack` : Noir neutre (#101010)

### Typographie
Utilisation de Google Fonts (Poppins) avec des tailles et poids optimisés.

### Espacement
Système d'espacement cohérent défini dans `AppSpacing`.

## Gestion des erreurs

- Timeouts configurables
- Retry automatique (3 tentatives)
- Messages d'erreur utilisateur
- Fallback vers les données locales

## Performance

- Pagination pour les grandes listes
- Cache des données
- Lazy loading des images
- Optimisation des rebuilds avec `setState`

## Tests

L'interface est prête pour l'intégration de tests :
- Tests unitaires pour les modèles
- Tests de widget pour les composants UI
- Tests d'intégration pour l'API

## Support et maintenance

- Code modulaire et maintenable
- Documentation complète
- Gestion des erreurs robuste
- Architecture scalable pour le backend

---

**Note** : Cette interface respecte exactement le design fourni et est optimisée pour une expérience utilisateur professionnelle. Tous les composants sont prêts pour l'intégration backend et suivent les meilleures pratiques Flutter.
