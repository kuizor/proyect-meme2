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
			** Memes - Exceptuando index y create.
			** Users - Exceptuando Create y usuario:admin.
				- Index: Header = [Authorization] = Token token=[token]
	
# 3 - Los usuarios pueden crear los Memes.
		* Para crear memes, debe ingresar el Json de la siguiente ruta: /memes.
			con el metodo POST.
			{
			    "id":"Dv99KQ",
			    "text_top":"mensaje TOP",
			    "text_buttom":"mensaje Down"
			}

# 4 - Los memes pueden ser categorizados. /categories
# 5 - Los memes pueden ser tageados. /tags
# 6 - Los memes pueden ser enviado por correo electrónico a traves de la Ruta: /email.
		{
			"Email":"email@dom.dom",
			"link":"MemeEnlace"
		}
# 7 - Los usuarios puedan elegir si su meme es privado o no, en caso de que un meme sea público, este puede 	ser listado por cualquier usuario.
# 8 - Los memes públicos pueden ser rankeados.
# 9 - Los usuarios no registrados solo pueden ver un listado de los memes más populares.



La base dedatos esta alojada en un servidor remoto con POSTGRES
