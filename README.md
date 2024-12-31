
# FakeStore iOS App

Un'applicazione Swift UI che mostra prodotti dall'API Fake Store con funzionalità di ricerca.

## Funzionalità

- Visualizzazione prodotti in una griglia responsive
- Ricerca prodotti per categoria
- Visualizzazione categorie disponibili
- Card prodotto con immagini, titoli e prezzi
- Risultati di ricerca in tempo reale

## Dettagli Tecnici

### Architettura
- SwiftUI per i componenti UI
- Implementazione pattern MVVM
- Caricamento asincrono delle immagini
- Integrazione API RESTful

### Endpoint API
- Tutti i prodotti: `https://fakestoreapi.com/products`
- Ricerca per categoria: `https://fakestoreapi.com/products/category/`
- Lista categorie: `https://fakestoreapi.com/products/categories`

### Componenti Principali
- `ContentView`: Vista principale con interfaccia di ricerca e griglia prodotti
- `ProductViewModel`: Gestisce le chiamate API e la gestione dei dati
- `Product`: Modello per i dati del prodotto
- `ProductCard`: Componente riutilizzabile per la visualizzazione del prodotto

## Requisiti
- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Per Iniziare
1. Clona il repository
2. Apri `fakeStoreiOS.xcodeproj` in Xcode
3. Compila ed esegui il progetto
