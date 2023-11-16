# Esta es una version de una Pokédex de una forma bruta, sin controlador y sin separar codigo para observar como de necesario un controller para organizarse

# Esta es la estuctura de la app

![Estructura de la Aplicación](https://cdn.discordapp.com/attachments/1173755894958395393/1174783340830797824/DIAGRAMA.drawio_1.png?ex=6568d93e&is=6556643e&hm=472dccf43c7881eb19d1403d65feb169fc48176008e1b62bcada198c45099407&raw=true)

# HomePageScreen

`HomePageScreen` es un widget de pantalla principal en una aplicación Flutter. Hereda de `StatefulWidget` y contiene la lógica principal utilizando el estado (`_HomePageScreenState`) para manejar cambios en la interfaz de usuario.

## _HomePageScreenState

`_HomePageScreenState` es el estado de la pantalla principal, destacando:

- **Listas:** `listadoPokedex` y `listadoPokemon` almacenan información sobre Pokémon y la Pokédex, respectivamente.

- **AudioPlayer:** Utilizado para reproducir un sonido al cargar la página.

- **`pokemon`:** Almacena información sobre un Pokémon seleccionado.

- **Métodos `initState`, `playLoadingAudio`, y `loadPokedexData`:** Utilizados para inicializar el estado, reproducir audio de carga y cargar datos de la Pokédex, respectivamente.

- **Widgets de AppBar y ListView:** Muestra la interfaz de usuario principal, incluida la AppBar y una lista de botones elevados (`ElevatedButton`) que representan diferentes generaciones de Pokémon.

- **`LoadingPage`:** Widget personalizado que muestra un indicador de carga cuando `listadoPokedex` está vacío.

- **`InfoPokemon`:** Widget personalizado importado desde '../widgets/info_pokemon_widget.dart', encargado de la visualización de la información detallada de un Pokémon.

- **Diferentes widgets de AppBar:** Se utilizan diferentes configuraciones de la AppBar según si se selecciona una generación o un Pokémon específico.

- **`Image.asset`:** Se utiliza para mostrar imágenes, como el título de la AppBar y las imágenes de las generaciones de Pokémon.

- **`ListView.builder`:** Se utiliza para construir una lista de botones (`ElevatedButton`) o tarjetas (`Card`) de Pokémon, según la selección del usuario.

- **Otras widgets comunes de Flutter:** `Scaffold`, `SafeArea`, `IconButton`, `Text`, `Row`, `Column`, `SizedBox`, etc.

Este código representa una pantalla interactiva que proporciona información detallada sobre Pokémon, permitiendo a los usuarios explorar diferentes generaciones y ver detalles específicos de cada Pokémon.
