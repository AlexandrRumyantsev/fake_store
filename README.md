# Fake Store

Flutter-приложение для интернет-магазина с использованием Fake Store API.

## Описание

Приложение реализует каталог товаров с пагинацией, онбординг и навигацию между экранами. Архитектура построена на принципах Clean Architecture. Подход layer-first, с разделением на слои data, domain, presentation.

## Технологии

- **Flutter**: 3.32.2 (stable)
- **State Management**: Provider + ChangeNotifier
- **Dependency Injection**: GetIt
- **Networking**: Dio + Retrofit
- **Serialization**: json_serializable

## Структура проекта

```
lib/
├── data/             # Data layer (repositories, data sources, models)
├── domain/           # Domain layer (entities, use cases, repository interfaces)
├── presentation/     # Presentation layer (pages, view models)
├── di/               # Dependency injection
└── infrastructure/   # API configuration
```

## Установка и запуск
```bash
git clone https://github.com/your-username/fake_store.git
cd fake_store
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```
