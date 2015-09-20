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
int EsAc = 0;
%}

Menu = "Principal"
Clase = "clase"

Cero = 0
Digitos = [1-9]
Numeros = ({Cero}|{Digitos})
Punto = "."
Comillas = \"
ParL = "("
ParR = ")"
Var = "variable"
Entero = "entero"
Real = "real"
Igual = "="
Coma = \,
Boleano = "boleano"
Cadena  = "cadena"
Espacio = " "
Signo = ("-"|"+")?
LetrasMi = [a-z]
LetrasMa = [A-Z]
Tipo = ({Entero}|{Real}|{Boleano}|{Cadena})
TLetras = ({LetrasMi}|{LetrasMa})
True = "verdadero"
False = "falso"
Identificador = {LetrasMi}({TLetras}|{Numeros})*
Int = {Signo}(({Digitos}({Cero}|{Digitos})*)|{Cero})
EInt = {Signo}{Cero}({Cero}|{Digitos})*
Flotante = {Signo}(({Digitos}({Cero}|{Digitos})*)|{Cero}){Punto}({Cero}|{Digitos})*{Digitos}
EFloat = ({Entero}|({Signo}{Cero})){Punto}({Cero}|{Digitos})*{Cero}+
String = ({TLetras}|.)*
Boolean = ({True}|{False})
FinLinea = \r|\n|\n\r|\r\n
Espacios = [ \t]
Ignorar = {FinLinea} | {Espacios}

%xstates V1 V2 P1

%%

/*Reglas*/
{Tipo}{Espacio} {System.out.println("Token: " + yytext()); yybegin(V1);}
{Entero}{Espacio}{Menu} {System.out.println("Clase Principal"); yybegin(P1);}
/*Sin asignacion*/

<P1>
{
    {ParL} {System.out.println("Encontre parentesis: " + yytext());}
    {ParR} {System.out.println("Encontre parentesis: " + yytext());}
    "\t" {System.out.println("Dentro de la clase Principal");}
    {Tipo}{Espacio} {EsAc = P1; System.out.println("Token: " + yytext()); yybegin(V1);}
    {Ignorar} { }
    . { }
}

<V1> 
{
    {Identificador} {System.out.println("Token: " + yytext());} 
    {Coma}  { }
    {FinLinea} {yybegin(EsAc);}
    {Espacio}{Igual}{Espacio} {System.out.println("Token: " + yytext()); yybegin(V2);}
}

<V2>
{
    {Flotante} {System.out.println("Real: " + yytext());}
    {Int}   {System.out.println("Entero: " + yytext());}
    {Boolean}  {System.out.println("Boleano: " + yytext());}
    {FinLinea} {yybegin(EsAc);}
}
{Ignorar} { }
. { }