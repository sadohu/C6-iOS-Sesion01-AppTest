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
print("Book:", b1.name, b2.name)



/* Protocolos (Interfases) */
protocol PMethods{
    func example()
}

/* Herencias */
class Person {
    var code : Int
    var name : String
    // Constructor (self = this)
    init(code : Int, name : String){
        self.code = code
        self.name = name
    }
}
// Clase heredada : Hereda(Padre), Protocolo(Implementación)
class Teacher : Person, PMethods{
    var lastName : String
    
    init(code : Int, name : String, lastName : String){
        self.lastName = lastName
        super.init(code: code, name: name)
    }
    
    func example() {
        print("Ejemplo de protocolo")
    }
    
    func printData(){
        print("Clase Profesor")
    }
}

// Creando objecto de clase Teacher
var bean = Teacher(code: 1, name: "Donie", lastName: "Luperdi")
print("Teacher:", bean.code, bean.name, bean.lastName)



/* Challenge */
/*
 Crear una función que permita el ingreso de un número de tres cifras
 y retorne en una tupla:
 1. Unidad
 2. Decena
 3. Centena
 4. El mayor número formado por los tres números

*/

func challenge1(numero : Int) -> (Int, Int, Int, Int){
    var unidad = numero % 10
    var decena = numero % 100 / 10
    var centena = numero / 100
    
    return (unidad, decena, centena, 0)
}

var result1 = challenge1(numero: 123)
print("1. Unidad:", result1.0)
print("2. Decena:", result1.1)
print("3. Centena:", result1.2)
print("4. Mayor Número:", result1.3)



struct Categoria: Codable {
    var id: Int
    var idCategoria: Int
    var nombre: String
    var tipo: String
    var imagen: String
}

// Crear un arreglo de objetos Categoria
let categorias: [Categoria] = [
    Categoria(id: 1, idCategoria: 1, nombre: "Categoria1", tipo: "TipoA", imagen: "imagen1.jpg"),
    Categoria(id: 2, idCategoria: 1, nombre: "Categoria1", tipo: "TipoB", imagen: "imagen2.jpg"),
    Categoria(id: 3, idCategoria: 2, nombre: "Categoria2", tipo: "TipoC", imagen: "imagen3.jpg"),
    Categoria(id: 4, idCategoria: 3, nombre: "Categoria3", tipo: "TipoD", imagen: "imagen4.jpg"),
    Categoria(id: 5, idCategoria: 2, nombre: "Categoria2", tipo: "TipoE", imagen: "imagen5.jpg"),
]

//// Crear un diccionario para agrupar por idCategoria
//var categoriasAgrupadas: [Int: [Categoria]] = [:]
//
//// Iterar a través de las categorías y agruparlas por idCategoria
//for categoria in categorias {
//    if var categoriasDelMismoId = categoriasAgrupadas[categoria.idCategoria] {
//        categoriasDelMismoId.append(categoria)
//        categoriasAgrupadas[categoria.idCategoria] = categoriasDelMismoId
//    } else {
//        categoriasAgrupadas[categoria.idCategoria] = [categoria]
//    }
//}
//
//// Ahora tienes un diccionario donde las categorías se agrupan por idCategoria
//
//// Obtener un arreglo con un elemento por idCategoria
//var categoriasFiltradas: [Categoria] = []
//
//for (_, categoriasConMismoId) in categoriasAgrupadas {
//    if let primeraCategoria = categoriasConMismoId.first {
//        categoriasFiltradas.append(primeraCategoria)
//    }
//}
var categoriasFiltradas: [Int : Categoria] = [:]

for categoria in categorias {
    if categoriasFiltradas[categoria.idCategoria] == nil {
        categoriasFiltradas[categoria.idCategoria] = categoria
    }
}

// Convertir el diccionario en un arreglo de elementos únicos
let categoriasUnicas = Array(categoriasFiltradas.values)


var listasd : [Int:[Categoria]] = [:];



func getCategoriasPorSeccion(_ list: [Categoria]) -> [Int: [Categoria]] {
    var categoriasPorSeccion: [Int: [Categoria]] = [:]

    for categoria in list {
        if categoriasPorSeccion[categoria.idCategoria] == nil {
            categoriasPorSeccion[categoria.idCategoria] = [categoria]
        } else {
            categoriasPorSeccion[categoria.idCategoria]?.append(categoria)
        }
    }

    return categoriasPorSeccion
}

listasd = getCategoriasPorSeccion(categorias);
let seccion = Array(listasd.values)
let ids = Array(listasd.keys);
print(ids);
print("=========")

for x in 0...2 {
    print(seccion[x])
    print("=========")
}


let categorias2: [Categoria] = listasd[3]!;






func getCategoriasFrom() -> [Categoria]{
    var list : [Categoria] = [];
    
    let URLAPI = "https://puedeser.onrender.com/medicamento/lista";
    let url = URL(string: URLAPI);
    let task = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
        do{
            if(error == nil){
                // [Medicamento] hace referencia a más de un objeto, de ser solo uno indicar solo como: Medicamento
                let decodeData = try JSONDecoder().decode([Categoria].self, from: data!);
                list = decodeData;
                print(list);
            }
        }catch{
            print(error.localizedDescription);
        }
    }
    
    // Inicar tarea
    task.resume();
    return list;
}

var list = getCategoriasFrom();
print(list);
