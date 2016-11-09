String[] dataSplit;
String[] data;
float centerPointX = 92796f;
float centerPointY = 436960f;
float minZ;
float maxZ;

float xcoord;
float ycoord;
float zcoord;

float drawdistance = 1000;

FloatList zcoordData = new FloatList();

float minX = centerPointX - drawdistance;
float maxX = centerPointX + drawdistance;
float minY = centerPointY - drawdistance;
float maxY = centerPointY + drawdistance;

void setup() {
  size(1100, 1100);
  data = loadStrings("test.csv");
  splitData();
}


void draw() {

  fill(255, 0, 0);
  for (int i = 0; i < data.length; i++) {
    //todo waterlevel ascending
  }
}

void splitData() {

  for (int i = 0; i < data.length; i++) {
    dataSplit = splitTokens(data[i], ", ");
    xcoord = float(dataSplit[0]);
    ycoord = float(dataSplit[1]);
    zcoord = float(dataSplit[2]);

    if (minZ > zcoord) {
      minZ = zcoord;
    }

    if (maxZ < zcoord) {
      maxZ = zcoord;
    }

    float mapx= map(xcoord, minX, maxX, 0, 1100);
    float mapy= map(ycoord, minY, maxY, 1100, 0 );
    float mapz= map(zcoord, minZ, maxZ, 0, 300);

    stroke(color(mapz, mapz, mapz));
    fill(color(mapz, mapz, mapz));
    rect(mapx, mapy, 20, 20);
  }
}