# E-commerce Agro

Este é um aplicativo `mobile desenvolvido em Flutter`, com o objetivo de conectar comerciantes e compradores de produtos agropecuários. 

## Demonstração em Vídeo

[Demonstração em Vídeo](https://drive.google.com/file/d/19pfODdaAfRErWHc_X1xkEqWjtrUVWnIf/view?usp=sharing)

## Exibição da aplicação

![Del My Product](img_readme/del_my_product.png)
![Detail My Product](img_readme/detail_my_product.png)
![Detail My Product 1](img_readme/detail_my_product1.png)
![Detail Product](img_readme/detail_product.png)
![Detail Product 2](img_readme/detail_product2.png)
![List My Product](img_readme/list_my_product.png)
![List Product](img_readme/list_product.png)
![List Product 2](img_readme/list_product2.png)
![Login](img_readme/login.png)
![Register Product](img_readme/register_product.png)
![Register Product 1](img_readme/register_product1.png)
![Register User](img_readme/register_user.png)
![Register User 1](img_readme/register_user1.png)
![Search Product](img_readme/search_product.png)
![Sobre](img_readme/sobre.png)

## A seguir está o Repositório da API

[Link da API](https://github.com/Wenderson-Oscar/api_ecommerce_agro)

## Tutorial de como utilizar

Iremos `clonar` o repositório:

```
git clone https://github.com/Wenderson-Oscar/E-Commerce_Agro.git
```

No terminal, execute o seguinte comando para `instalar as dependências`:

```
flutter pub get
```

Depois de configurar a `API` e iniciar o servidor no link acima, iremos configurar o ip no flutter

vai em todos os arquivos que contem o ip, exemplo: ```Uri.parse('http://0.0.0.0:8000/login/')```

modifique o `0.0.0.0` pelo ip da sua maquina

Para saber o ip da sua maquina digite `ipconfig` ou `hostname -I` no terminal

execute o seguinte comando para iniciar o aplicativo:

```
flutter run -d chrome
```
