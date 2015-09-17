/* Imports */
package Principal;

%%
/*Opciones y declaraciones */
%class Alexico
%unicode
%type String
%line
%column


%{
/*Codigo*/
%}

Cero = 0
Digitos = (1-9)
Numeros = ({Cero}|{Digitos})
Punto = "."
Comillas = \"
Var = "variable"
Entero = "entero"
Real = "real"
Igual = "="
Boleano = "boleano"
Cadena  = "cadena"
Espacio = " "
Signo = ("-"|"+"|{Espacio})
LetrasMi = (a-z)
LetrasMa = (A-Z)
Tipo = ({Entero}|{Real}|{Boleano}|{Cadena})
TLetras = ({LetrasMi}|{LetrasMa})
True = "verdadero"
False = "falso"
Identificador = {LetrasMi}({TLetras}|{Numeros})*
Int = {Signo}{Digitos}({Cero}|{Digitos})*
EInt = {Signo}{Ceros}({Cero}|{Digitos})*
Float = ({Entero}|({Signo}{Cero})){Punto}({Cero}|{Digitos})*{Digitos}
EFloat = ({Entero}|({Signo}{Cero})){Punto}({Cero}|{Digitos})*{Cero}+
String = ({TLetras}|.)*
Boolean = ({True}|{False})(1)
FinLinea = \r|\n|\n\r|\r\n
Espacios = [ \t]
Salto = \n\r
Ignorar = {FinLinea} | {Espacios}

%xstates A1 A2 B

%%

/*Reglas*/

{Ignorar} { }
{Tipo} {yybegin(A1);}

<A1> 
{
    {Identificador}{Espacio}{Salto} {System.out.println("Variable Aceptable "); yybegin(YYINITIAL);} 
}

