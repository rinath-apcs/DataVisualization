public class PieChart {
  private float[] goalData;
  private float[] drawData = {0.0, 0.0, 0.0, 0.0, 0.0};
  private float greaterRadius;
  private float avgRadius;
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
c
  public PieChart(float[] d, float gR, float iR, float c) {
    update(d);
    greaterRadius = gR;
    innerRadius = iR;
    avgRadius = (iR + gR)/ 4.0;
    center = c;
  }

  private void draw() {
    float pos = 0;

    strokeWeight(10);

    for (int i = 0; i < drawData.length; i++) {
      fill(colors[i]);
      float end = pos + (drawData[i] / 100.0) * 2.0 * PI;
      float textPos = (end + pos) / 2.0;
      arc(center, center, greaterRadius, greaterRadius, pos, end);
      fill(255);
      textAlign(CENTER, CENTER);
      text((i + 1) + ".0" ,  cos(textPos) * avgRadius + center, sin(textPos) * avgRadius + center);
      text(goalData[i] + "%", cos(textPos) * (innerRadius - 5.0) + center, sin(textPos) * (innerRadius - 5.0) + center);
      pos = end;
    }
  
    fill(200);
    ellipse(center, center, innerRadius, innerRadius);
  }
  
  public void update(float[] data) {
    goalData = data;
  }
  
  public void tick() {
    for (int i = 0; i < drawData.length; i++) {
      if (drawData[i] < goalData[i]) {
        drawData[i] += 0.1;
      } else if (drawData[i] > goalData[i]+0.2) {
        drawData[i] -= 0.1;
      }  
    }
    
    draw();
  }
  
}
