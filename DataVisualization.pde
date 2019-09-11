final float[][] scores = 
{
  // 1.0, 2.0, 3.0, 4.0, 5.0
  {23.7, 22.0, 23.5, 18.7, 12.1}, // 2019
  {25.8, 23.1, 22.5, 18.2, 10.4}, // 2018
  {25.1, 23.5, 22.6, 17.9, 10.9}, // 2017
  {24.5, 23.4, 22.5, 17.9, 11.7}  // 2016
};

final int[] years = {2019, 2018, 2017, 2016};

void setup() {
  size(300, 300);
  
  background(200);
  
  pieChart(scores[0]);
}

void draw() {

}

void pieChart(float[] data) {
  float pos = 0;
  for (int i = 0; i < data.length; i++) {
    float val = data[i];

    fill(i*51,55+i*40,150-i*30);
    float end = pos + (val / 100.0) * 2.0 * PI;
    arc(150.0, 150.0, 150, 150, pos, end);
    pos = end;
  }
  
  fill(200);
  circle(150.0, 150.0, 100.0);
}
