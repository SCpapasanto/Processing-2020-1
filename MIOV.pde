//crea una tabla que guarda los datos del archivo .csv
Table table;

//me da el valor maximo 
int maxDato;

//numero de filas en el archivo
int rowCount;

//segundo
String [] tiempo; 

//tercero
//creo arreglos, que guardan los valores de cada columna
int [] kennedy;
int datoKennedy = 0;


//cuarto
int [] suba;
int datoSuba = 0;


//quinto

int [] usme;
int datoUsme = 0;
int [] bosa;
int datoBosa = 0;
/*
int [] usme;
int datoUsme = 0;
int [] bosa;
int datoBosa = 0;
int [] usme;
int datoUsme = 0;
int [] bosa;
int datoBosa = 0;
*/


void setup() 
{
  size(600,400);
  
  table = loadTable("taba.csv", "header");
  
  //numero de filas en el archivo
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");
  
  //segundo
  tiempo = new String [rowCount];
  
  //tercero
  kennedy = new int [rowCount];
  
  //cuarto
  suba = new int [rowCount];
  
  //quinto
  usme = new int [rowCount];
  bosa = new int [rowCount];
    
  //segundo  
  
  for(int i = 0; i < rowCount; i++)
  {
    //creamos un objeto que guarda la información de las filas de la tabla
    TableRow row = table.getRow(i);
    
    //guardamos la información de la fila "tiempo" en un arreglo
    tiempo[i]= row.getString("tiempo");
    
    //tercero
    //guardamos la información de la fila "KennedyProveedorSuscripcion" en un arreglo
    kennedy[i]= row.getInt("Kennedy");
    
    //cuarto
    //guardamos la información de la fila "SubaProveedorSuscripcion" en un arreglo
    suba[i]= row.getInt("Suba");
    
    //quinto
    usme[i]= row.getInt("Usme");
    bosa[i]= row.getInt("Bosa");
            
    //tercero    
    //determina el valor max de todas las columnas
    
    datoKennedy = kennedy[i];
    if (datoKennedy > maxDato) 
    {
      maxDato = datoKennedy;
    }
    
    
    
    //cuarto
    
    datoSuba = suba[i];
    if (datoSuba > maxDato) 
    {
      maxDato = datoSuba;
    }
    
    
    //quinto
    
    datoUsme = usme[i];
    if (datoUsme > maxDato) 
    {
      maxDato = datoUsme;
    }
       
    datoBosa = bosa[i];
    if (datoBosa > maxDato) 
    {
      maxDato = datoBosa;
    }
    
    
  //segundo  
  }  
  
  
  //tercero
  println(maxDato + " es el valor maximo de todas las columnas");
  
  
    
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
  rect(55, 80, 450, 220);
    
  
  //lineas veticales, cada linea es un dato del archivo que se dibujará en el espacio
  strokeWeight(1);
  stroke(0);
  
  //son 14 lineas verticales correspondiente a los 14 datos de cada columna de la tabla 
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
  for (int i = 0; i < maxDato; i+=110000) 
  {
      //se replican las lineas, en las pocisiones dentro del espacio del diagrama
      float y = map(i, 0, maxDato, 300, 80);
      line(75, y, 475, y);
      
      //texto con el valor de cada linea
      fill(255);
      //se coloca el texto en cada linea
      text(i, 0, y);
  }  
    
  //tercero A
  
  //scatter de kennedy
  noStroke();
  fill(#FAFF00,190);
  
  
  //tercero B
  
  // puntos kennedy
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++)  //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(kennedy[i], 0, maxDato, 300, 100);
      //ellipse(x, y,10,10); 
      rect(x, y,10,300-y); //alto - el punto y
      //println(i + "  " + kennedy[i]  + "  " + x  + "  " + y);
  }
  
  
  //tercero C
  
  //poligono kennedy
  beginShape();
  for (int i = 0; i < rowCount; i++)  //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(kennedy[i], 0, maxDato, 300, 100); 
      vertex(x, y); 
  }
  /*vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);*/
  
  
  //cuarto A
  
  // puntos MOVISTAR
  noStroke();
  fill(#FF0303,190);
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(suba[i], 0, maxDato, 300, 100);
      //ellipse(x, y, 10,10);
      rect(x-32, y,10,300-y); //alto - el punto y
      //println(i + "  " + suba[i]  + "  " + x  + "  " + y);
  } 
   
  
  //cuarto B
  
  //poligono MOVISTAR
  beginShape();
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i , 0, rowCount-1, 55, 475);  //desde la 0 hasta la 13
      float y = map(suba[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  /*vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);*/
  
  
  //quinto A
  
  // puntos TIGO
  noStroke();
  fill(#3C03FF,190);
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(usme[i], 0, maxDato, 300, 100);
      //ellipse(x, y, 10,10);
      rect(x-16, y,10,300-y); //alto - el punto y
      //println(i + "  " + usme[i]  + "  " + x  + "  " + y);
  }    
  
  //poligono Usme
  beginShape();
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475);   //desde la 0 hasta la 13
      float y = map(usme[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  /*vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);*/
  
  
  //quinto B
  
  //puntos Bosa
  noStroke();
  fill(#03FF32,190);
  //recorre 14 veces
  for (int i = 0; i < rowCount; i++) //desde la 0 hasta la 13
  {
      float x = map(i, 0, rowCount-1, 55, 475); //desde la 0 hasta la 13
      float y = map(bosa[i], 0, maxDato, 300, 100);
      //ellipse(x,y,10,10);
      rect(x-8, y,10,300-y); //alto - el punto y
      //println(i + "  " + bosa[i]  + "  " + x  + "  " + y);
  }
    
  //poligono Bosa
  beginShape();
  for (int i = 0; i < rowCount; i++) 
  {
      float x = map(i, 0, rowCount-1, 55, 475);
      float y = map(bosa[i], 0, maxDato, 350, 100);
      vertex(x, y); 
  }
  /*vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);*/ 
  
  
  
}
