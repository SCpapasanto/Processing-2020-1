PImage mapImage;

//Crea una tabla que guarda los datos del archivo .tsv
Table dataTable;

//numero de filas en el archivo
int rowCount;

//fuente
PFont letraFuente;

// ubicacion de los circulos
float x = 0;
float y = 0;

//diametro de la elipse
float diametro = 9;

//segundo

//guarda el valor de la columna 3
int columna3 = 0;
//valor maximo y minimo de la columna 3 del archivo
float dataMinColumna3 = 0;
float dataMaxColumna3 = 0;


//tercero
/*
//guarda el valor de la columna 4
float columna4 = 0;
//valor maximo y minimo de la columna 4 del archivo
float dataMinColumna4 = 0;
float dataMaxColumna4 = 0;
//se utiliza para dar el color segun el valor de la columna 4
*/
float aproxColor = 0;
//da el color a cada circulo

color colorIntermedio;


//cuarto

//guarda el valor de la columna 5
float columna5 = 0;
//valor maximo y minimo de la columna 4 del archivo
float dataMinColumna5 = 0;
float dataMaxColumna5 = 0;
//el alpha-color de cada circulo
float transparencia = 0; 


//quinto

//guarda el nombre de la fila
String nombreEstado;



void setup() 
{
  size(702, 514);  
  
  letraFuente = loadFont("Fipps-18.vlw");
  
  mapImage = loadImage("bogota.jpg");
  
  dataTable = loadTable("culo.tsv");
 
  // da el numero de filas del archivo
  rowCount = dataTable.getRowCount();
  println(rowCount);
  
  //recorre el archivo 
  for (int i = 0; i < rowCount; i++) 
  //{
    
    //segundo
    
    columna3 = dataTable.getInt(i, 3); // column 3
    //determina el valor max y minimo de la columna 3
    if (columna3 > dataMaxColumna3) 
    {
      dataMaxColumna3 = columna3;
    }
    if (columna3 < dataMinColumna3) 
    {
      dataMinColumna3 = columna3;
    }
    
    
    
    //tercero
    /*
    columna4 = dataTable.getFloat(i, 4); // column 4
    //determina el valor max y minimo de la columna 4
    if (columna4 > dataMaxColumna4) 
    {
      dataMaxColumna4 = columna4;
    }
    if (columna4 < dataMinColumna4) 
    {
      dataMinColumna4 = columna4;
    }
    */
    
    //cuarto
    /*
    columna5 = dataTable.getFloat(i, 5); // column 5
    //determina el valor max y minimo de la columna 5
    if (columna5 > dataMaxColumna5) 
    {
      dataMaxColumna5 = columna5;
    }
    if (columna5 < dataMinColumna5) 
    {
      dataMinColumna5 = columna5;
    }
    */
    
  //}
  
}

void draw() 
{  
  
  background(255);
  image(mapImage, 0, 0);
  textFont(letraFuente, 12);
  fill(0,0,0);
  textAlign(BOTTOM);
  text("Calidad del aire en Bogota", 225, 40);
  
  
  //suaviza el borde del circulo  
  smooth();
  
  // Loop through the rows of the locations file and draw the points  
  for (int i = 0; i < rowCount; i++) 
  {
    x = dataTable.getFloat(i, 1);  // column 1
    y = dataTable.getFloat(i, 2);  // column 2
    
    //segundo
    
    columna3 = dataTable.getInt(i, 3);  // column 3
    diametro = map(columna3, dataMinColumna3, dataMaxColumna3, 10, 60);
    
  
    //tercero
    
      // column 4
    aproxColor = map(columna3, dataMinColumna3, dataMaxColumna3, 0, 1);
    colorIntermedio = lerpColor(#A2F545,#C90000,aproxColor);
    fill(colorIntermedio,190);
    
    
    //cuarto
    /*
    columna5 = dataTable.getFloat(i, 5);  // column 5
    transparencia = map(columna5, dataMinColumna5, dataMaxColumna5, 0, 255);
    fill(colorIntermedio,transparencia);
    */
            
    noStroke();
    
    
    ellipse(x, y, diametro, diametro);
    
    //quinto
    
    nombreEstado = dataTable.getString(i, 0);
    if (dist(x, y, mouseX, mouseY) < 20) 
    {
      fill(0);
      textAlign(CENTER);
      // Show the data value and the state abbreviation in parentheses
      text(nombreEstado + ": " + columna3, x, y);
      println(nombreEstado);
    }
    
    
  }
}
