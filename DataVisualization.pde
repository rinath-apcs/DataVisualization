final float[][] scores = 
{
  // 1.0, 2.0, 3.0, 4.0, 5.0
  {23.7, 22.0, 23.5, 18.7, 12.1}, // 2019
  {25.8, 23.1, 22.5, 18.2, 10.4}, // 2018
  {25.1, 23.5, 22.6, 17.9, 10.9}, // 2017
  {24.5, 23.4, 22.5, 17.9, 11.7}  // 2016
};

final int[] years = {2019, 2018, 2017, 2016};

int selected;

PieChart pie;

void setup() {
  size(500, 500);
  
  background(200);
  
  selected = 0;
  
  pie = new PieChart(scores[0], 300, 200, 250);
}

void draw() {
  pie.tick();
  pie.update(scores[selected]);
  
}

void mouseClicked() {
  selected = (selected + 1) % 4;
}
