public class PieChart {
  private float[] goalData;
  private float[] drawData = {0.0, 0.0, 0.0, 0.0, 0.0};
  private float greaterRadius;
  private float innerRadius;
  private float center;

  private final color[] colors = 
  {
      #FF2121, //1.0
      #FCB31A, //2.0
      #E9EF1B, //3.0
      #1BF051, //4.0
      #1BCBF0, //5.0
  };

  public PieChart(float[] d, float gR, float iR, float c) {
    goalData = d;
    greaterRadius = gR;
    innerRadius = iR;
    center = c;
  }

  private void draw() {
    float pos = 0;

    strokeWeight(10);

    for (int i = 0; i < drawData.length; i++) {
      fill(colors[i]);
      float end = pos + (drawData[i] / 100.0) * 2.0 * PI;
      arc(center, center, greaterRadius, greaterRadius, pos, end);
      pos = end;
    }
  
    fill(200);
    circle(center, center, innerRadius);
  }
  
  public void update(float[] data) {
    goalData = data;
  }
  
  public void tick() {
    for (int i = 0; i < drawData.length; i++) {
      if (drawData[i] < goalData[i]) {
        drawData[i] += 0.1;
      } else if (drawData[i] > goalData[i]) {
        drawData[i] -= 0.1;
      }  
    }
    
    draw();
  }
  
}
