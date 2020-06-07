int voltage_in = 5;
int known_resistance = 10000;
float cs_Area = 0.00006563;
float distance = 0.0001;

void setup() {
  Serial.begin(9600);
  analogReference(DEFAULT);
  pinMode(A0, INPUT);
}

void loop() {
  int sensorValue = analogRead(A1);
  float voltage_out = sensorValue * (5.0 / 1023.0);
  if (voltage_out >= 0.1) { // Filtering random noise ugh ( This seems like a lot ( 2% of possible measurements) but remember that this will only happen if you have super clean water)
    Serial.print("FROM A1:");
    Serial.println(voltage_out);
    
    float buff = (voltage_in / voltage_out) - 1; // Close voltage assumption
    float predicted_resistance = buff * known_resistance;
    
    Serial.print("PREDICTED R:");
    Serial.println(predicted_resistance);
    //Assuming constant resistivity and cross-sectional area, (done to make the integration easier alr give me a break), p = Omega*Cross-sectional Area / distance between electrodes
    float resistivity = predicted_resistance * cs_Area / distance;
    Serial.print("RESISTIVITY: ");
    Serial.println(resistivity);
//    send_to_py(random(20,30), random(20,30), resistivity);
  }
}

void send_to_py(float temp, float humidity, float resistivity)
{
  Serial.print("TEMP:");
  Serial.println(temp);
  Serial.print("HUMIDITY:");
  Serial.println(humidity);
  Serial.print("RESISTIVITY:");
  Serial.println(resistivity);
}
