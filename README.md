# TestVaultMeli
App Mercado Libre.
Por Juan Manuel Moreno Beltran {iOS native}

# Arquitectura
Lineamientos de los principios Clean Architeture
[https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

Patrón de arquitectura VIPER principios SOLID
[https://medium.com/build-and-run/clean-architecture-en-ios-viper-893c8c3a75a4](https://medium.com/build-and-run/clean-architecture-en-ios-viper-893c8c3a75a4)

Entity
Product | ProductList
)))

Business Use Case
GetProductListUseCase
)))

Interface
ProductListViewController | ProductListInteractor | ProductListPresenter | ProductListRouter
)))


# Issues

## Cómo asegurar la calidad del proyecto
Aplicación principios, patrones,verificación buenas prácticas, evitación de redundancias cíclicas por ende fugas de memoria, Instruments

## Layouts
Uso de variations for traits en vistas de Producto

## Memoria
Aplicación SOLID D

# TODO

## Splash Delay
Hallar la forma de demorar el mostrar contenido después del splash.

Este código demora la ejecución de la app el tiempo requerido; sin embargo implica demorar la ejecución de más piezas, opción que no da un performance de calidad a la app

```
Thread.sleep(forTimeInterval: 3.0)
```
Este código demora la pieza SceneDelegate; sin embargo funciona en versiones anteriores a iOS 13. En adelante muestra una app oscura durante la demora.

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            // your code here
            guard let aScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: aScene)
            let navigator = UINavigationController(rootViewController: RecipeListViewController(features: RecipeListFeaturesRequestListAndFavorites()))
            window?.rootViewController = navigator
            window?.makeKeyAndVisible()
        }

## Device testing
En este momento no dispongo de una cuenta de Apple Developer activa para hacer pruebas con device para permisos y memory leaks con Instruments
