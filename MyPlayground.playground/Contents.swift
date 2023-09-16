import UIKit

/* Variables y Constantes */
// Variable
var codigo = 0
codigo = 5

// Constante
let nombre = "Hugo"
// nombre = "Carlos" <--- Error

/* Anotaciones: Implicitas y explicitas */
// Implicitas
var estado = "Soltero"
var sueldo = 6500.70
    
// Explicitas
var entero : Int = 0
var decimal : Double
var cadena : String
var booleano : Bool

/* Impresión en consola */
print("Codigo: ", codigo)
print("Nombre: ", nombre)
print("Entero: ", entero)


/* Condicionales */
if codigo == 0{
    print("Codigo es incorrecto")
}else if codigo == 3{
    print("Codigo es incorrecto")
}else{
    print("Codigo correcto")
}

switch codigo {
    case 0: print("Cero")
    case 1: print("Uno")
    default: print("Otro")
}


/* Bucles */
// For
for x in 1...10{
    print(x)
}
//While
while codigo == 5 {
    print("While buble")
    codigo += 1
    if(codigo > 5){
        print("Break command")
        break
    }
}
// Do While
repeat{
    print("Do While", codigo)
    codigo += 1
}while codigo < 7


/* Tipos de datos */
// Array
var data : [String] = ["Hugo", "Donie"]
data.append("Salas")
data.append("Luperdi")
print("Array:", data)
// Conjuntos (Obvia las repeticiones)
var courses : Set<String> = ["Java", "C#", "MySql"]
courses.insert("SQL")
courses.insert("Kotlin")
courses.insert("Java")
print(courses)
// Diccionarios (Key: Description) (Clave: Valor)
var products : [Int : String] = [ : ]
products[10] = "Laptop"
print(products)
// Tupla
var info = (10, "Programa", 548.3, true)
print(info.0)
print(info.1)
print(info.2)
print(info.3)


/* Métodos - Funciones */
// Void
func methodVoid(){
    print("Metodo void")
}
methodVoid();

// Void con parametros
func methodVoidWithParamaters(cod : Int){
    print("Método void con parametros:", cod)
}
methodVoidWithParamaters(cod: 17);

// Con retorno y parametros
func methodWithReturn(numero: Int) -> Double {
    switch numero{
        case 1: return 20;
        case 2: return 55.5;
        default: return 20.99;
    }
}
let numReturned = methodWithReturn(numero: 5)
print(numReturned)

// Metodo con parametros con nombre opcionales, usar guión bajo
func methodWithSimpleParameters(_ numero: Int) -> Double {
    switch numero{
        case 1: return 20;
        case 2: return 55.5;
        default: return 20.99;
    }
}
let simpleParams = methodWithSimpleParameters(5)
print(simpleParams)

// Parámetros con Alias
func methodWithAliasParameters(num numero : Int) -> Double{
    switch numero{
        case 1: return 20;
        case 2: return 55.5;
        default: return 20.99;
    }
}
let aliasParams = methodWithAliasParameters(num: 1)
print(aliasParams)


/* Controlar valores Null */
// Retornar null
func methodNull(name: String) -> String? {
    if(name == "vacio"){
            return nil
    }else{
        return name
    }
}
var controlNullable = methodNull(name: "vacio")
print("Valor:", controlNullable as Any)

// Asegurar un valor diferente a null
func methodWithValue(name: String) -> String? {
    if(name == "vacio"){
            return nil
    }else{
        return name
    }
}
controlNullable = methodNull(name: "Hugo")
print("Valor:", controlNullable!)


/* Clase y Estructura */
// Estructura (No necesita constructor)
struct Course {
    var code : Int
    var name : String
}

// Crear variable con un tipo de Clase
var c1 = Course(code: 1, name: "Git")
// Asignar variable
var c2 = c1
// Actualizar valores
c2.name = "Java"
print(c1,c2)


// Clase (Requiere constructor)
class Book {
    var code : Int
    var name : String
    // Constructor (self = this)
    init(code : Int, name : String){
        self.code = code
        self.name = name
    }
}

var b1 = Book(code: 1, name: "C#")
var b2 = b1
b2.name = "Python"
print(b1.name, b2.name)
