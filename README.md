# Esta App es una practica realizada en el curso de capacitacion *[Academia HACK](http://academiahack.com.ve/)

Consta de varias funciones:

# 1- Manejo de usuarios - Ruta: /users.
	* Index.
	* Show -id. 
		ruta: /users/id.
	* Create header["Content-Type"]=["application/json"].
		```json
		{
		    "user":{
		        "login":"Jose",
		        "password":"123"
		    }
		}
		```
	* Update.
		ruta: /users/id.
	* Destroy.

# 2- Autenticación:
		* Para loguearse la ruta es: /login=?login=[USER]&password=[PASSWORD] (Sin corchetes).
		* Para desloguearse la ruta es: /logout.
		* Modulos Autenticados:
			** Memes - Exceptuando index.
				- Crear meme.
			** Users - Exceptuando Create y usuario:admin.
				- Index: Header = [Authorization] = Token token=[token]
	



Puedan verse los memes más comunes para ser cool.
Los usuarios puedan crear los memes via MemeGenerator y ser guardados en el sistema.
Los memes puedan ser categorizados.
Los memes puedan ser tageados.
Los memes puedan ser enviado por correo electrónico.
Los memes puedan ser enviados a una red social de su preferencia (Facebook está prohibido por su ranciedad).
Los usuarios puedan elegir si su meme es privado o no, en caso de que un meme sea público, este puede ser listado por cualquier usuario.
Los memes públicos pueden ser rankeados.
Los usuarios no registrados solo pueden ver un listado de los memes más populares.


Para poder loguearse se debe acceder de la siguiente manera:
http://localhost:3000/login?login=[TU USUARIO]&password=[TU PASSWORD]

Para pruebas:
Usuario: Miguel
Password: 123

_______________________-
Json:
```json
{
  "src_image_id": "MDyuQg",
  "private": false,
  "captions_attributes": [
    {
      "text": "top text",
      "top_left_x_pct": 0.05,
      "top_left_y_pct": 0,
      "width_pct": 0.9,
      "height_pct": 0.25
    },
    {
      "text": "bottom text",
      "top_left_x_pct": 0.05,
      "top_left_y_pct": 0.75,
      "width_pct": 0.9,
      "height_pct": 0.25
    }
  ]
}
```
enlace:
[Authentication](authentication.md)