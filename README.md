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

# HomePageScreen

![Captura de Pantalla 1](https://cdn.discordapp.com/attachments/1173755894958395393/1174785044494176256/727bbf00-92d5-4e65-87d5-4cd7c98ea2eb.png?ex=6568dad5&is=655665d5&hm=a51f38b0f9514a3b9781a6b07b5966fd349b4609271edf2909644e4791b6b926)

![Captura de Pantalla 2](https://cdn.discordapp.com/attachments/1173755894958395393/1174785084507836446/3010dfef-3f73-4d25-94bb-d822f2f4dcfa.png?ex=6568dade&is=655665de&hm=b62eef39fa4c0f952d8663ffff5521d93e988adcaadce7da315570160df28c39)

![Captura de Pantalla 3](https://cdn.discordapp.com/attachments/1173755894958395393/1174785226501795852/0f52310e-1bbc-43c1-8c8a-e22a534bf139.png?ex=6568db00&is=65566600&hm=9f28583ef46d55424ed0862436acb04431e80ed20098d5704e35f2ef901bc3bd)

![Captura de Pantalla 4](https://cdn.discordapp.com/attachments/1173755894958395393/1174785274941816893/58b57109-e34c-471d-9a1a-8cee01257770.png?ex=6568db0c&is=6556660c&hm=33aebbf04ff5c59aae40eaaf7c2c388c021d3caf41b12a214d06e485a4447943)

`HomePageScreen` es una versión inicial de una Pokédex en Flutter, sin el uso de un controlador y sin modularización del código. Esta aproximación bruta permite observar la necesidad de incorporar un controlador para mejorar la organización y la estructura del código.

