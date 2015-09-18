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
Digitos = [1-9]
Numeros = ({Cero}|{Digitos})
Punto = "."
Comillas = \"
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

%xstates A B

%%

/*Reglas*/
{Tipo}{Espacio} {System.out.println("Token: " + yytext()); yybegin(A);}
/*Sin asignacion*/
<A> 
{
    {Identificador} {System.out.println("Token: " + yytext());} 
    {Coma}  { }
    {FinLinea} {yybegin(YYINITIAL);}
    {Espacio}{Igual}{Espacio} {System.out.println("Token: " + yytext()); yybegin(B);}
}

<B>
{
    {Flotante} {System.out.println("Real: " + yytext());}
    {Int}   {System.out.println("Entero: " + yytext());}
    {Boolean}  {System.out.println("Boleano: " + yytext());}
    {FinLinea} {yybegin(YYINITIAL);}
}
{Ignorar} { }
. { }