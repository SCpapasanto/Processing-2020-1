//crea una tabla que guarda los datos del archivo .csv
Table table;

//me da el valor maximo 
int maxDato;

//numero de filas en el archivo
int rowCount;

//segundo
String [] tiempo; 

//tercero
//creo arreglos, que guardan los valores de cada publico
int [] particular;
int datoparticular = 0;


//cuarto
int [] publico;
int datopublico = 0;


//quinto
/*
int [] tigo;
int datoTigo = 0;
int [] uff;
int datoUff = 0;
*/

void setup() 
{
  size(600,400);
  
  table = loadTable("vehiculos_datos.csv", "header");
  
  //numero de filas en el archivo
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");
  
  //segundo
  tiempo = new String [rowCount];
  
  //tercero
  particular = new int [rowCount];
  
  //cuarto
  publico = new int [rowCount];
  
  //quinto
  //tigo = new int [rowCount];
  //uff = new int [rowCount];
    
  //segundo  
  
  for(int i = 0; i < rowCount; i++)
  {
    //creamos un objeto que guarda la información de las filas de la tabla
    TableRow row = table.getRow(i);
    
    //guardamos la información de la fila "tiempo" en un arreglo
    tiempo[i]= row.getString("Ano");
    
    //tercero
    //guardamos la información de la fila "particularProveedorSuscripcion" en un arreglo
   particular[i]= row.getInt("Particular");
    
    //cuarto
    //guardamos la información de la fila "publicoProveedorSuscripcion" en un arreglo
    publico[i]= row.getInt("Publico");
    
    //quinto
    //tigo[i]= row.getInt("TigoProveedorSuscripcion");
    //uff[i]= row.getInt("UffProveedorSuscripcion");
            
    //tercero    
    //determina el valor max de todas las publicos
    
    datoparticular = particular[i];
    if (datoparticular > maxDato) 
    {
      maxDato = datoparticular;
    }
    
    
    
    //cuarto
    
    datopublico = publico[i];
    if (datopublico > maxDato) 
    {
      maxDato = datopublico;
    }
    
    
    //quinto
    /*
    datoTigo = tigo[i];
    if (datoTigo > maxDato) 
    {
      maxDato = datoTigo;
    }
       
    datoUff = uff[i];
    if (datoUff > maxDato) 
    {
      maxDato = datoUff;
    }
    */
    
  //segundo  
  }  
  
  
  //tercero
  println(maxDato + " es el valor maximo de todas las publicos");
  
  
    
}

void draw()
{
  
    drawScatter();            
}


void drawScatter()
{
  noStroke();
  
  //cuadro gris de contexto en donde se colocan los valores
  fill(100);
  rect(0, 70, 560, 242);
  
  //cuadro blanco en donde se coloca el digrama de curvas
  fill(255);
  rect(55, 80, 420, 220);
    
  
  //lineas veticales, cada linea es un dato del archivo que se dibujará en el espacio
  strokeWeight(1);
  stroke(0);
  
  //son 14 lineas verticales correspondiente a los 14 datos de cada publico de la tabla 
  for (int i = 0; i < rowCount; i++) // desde la 0 hasta la 13
  {
      //se replican las lineas 14 veces, en las pocisiones dentro del espacio del diagrama
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      line(x, 80, x, 300);
      
      //segundo
      //se coloca el texto en cada linea
     fill(0);
      //text(tiempo[i], x, 320);
      
      
      //segundo A
      
      pushMatrix();
      translate(x,320);
      rotate(PI/2);
      //se coloca el texto en cada linea
      text(tiempo[i], 0, 0);
      popMatrix();
      
  }
   
  //tercero
  
  //son las lineas horizonales correspondiente a el max dato dividido la cantidad de lineas que quiero ver   
  //13121911/8 = 1640238
  //2000000
  for (int i = 0; i < maxDato; i+=2000000) 
  {
      //se replican las lineas, en las pocisiones dentro del espacio del diagrama
      float y = map(i, 0, maxDato, 300, 80);
      line(55, y, 475, y);
      
      //texto con el valor de cada linea
      fill(255);
      //se coloca el texto en cada linea
      text(i, 0, y);
  }  
    
  //tercero A
  
  //scatter de particular
  noStroke();
  fill(10,7,240,190);
  
  
  //tercero B
  
  // puntos particular
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++)  //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(particular[i], 0, maxDato, 300, 100);
      //ellipse(x, y,10,10); 
      //rect(x, y,10,300-y); //alto - el punto y
      //println(i + "  " + particular[i]  + "  " + x  + "  " + y);
  }
  
  
  //tercero C
  
  //poligono particular
  beginShape();
  for (int i = 0; i < rowCount; i++)  //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(particular[i], 0, maxDato, 300, 100); 
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);
  
  
  //cuarto A
  
  // puntos publico
  noStroke();
  fill(7,229,30,190);
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(publico[i], 0, maxDato, 300, 100);
      ellipse(x, y, 10,10);
      //rect(x, y,10,300-y); //alto - el punto y
      println(i + "  " + publico[i]  + "  " + x  + "  " + y);
  } 
   
  
  //cuarto B
  
  //poligono publico
  beginShape();
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i , 0, rowCount-1, 55, 475);  //desde la 0 hasta la 13
      float y = map(publico[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);
  
  
  //quinto A
  /*
  // puntos TIGO
  noStroke();
  fill(255,25,219,170);
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(tigo[i], 0, maxDato, 300, 100);
      ellipse(x, y, 10,10);
      //rect(x, y,10,300-y); //alto - el punto y
      //println(i + "  " + tigo[i]  + "  " + x  + "  " + y);
  }    
  
  //poligono Tigo
  beginShape();
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475);   //desde la 0 hasta la 13
      float y = map(tigo[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);
  */
  
  //quinto B
  /*
  //puntos Uff
  noStroke();
  fill(226,234,7);
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(uff[i], 0, maxDato, 300, 100);
      ellipse(x,y,10,10);
      //rect(x, y,10,300-y); //alto - el punto y
      //println(i + "  " + Uff[i]  + "  " + x  + "  " + y);
  }
    
  //poligono Uff
  beginShape();
  for (int i = 0; i < rowCount; i++) 
  {
      float x = map(i, 0, rowCount-1, 55, 475);
      float y = map(uff[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE); 
  */
  
  
}
