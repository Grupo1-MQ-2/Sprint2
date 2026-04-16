const int PINO_SENSOR_MQ2 = A2;

const int  VALOR_MINIMO = 100;
const int  VALOR_MAXIMO = 2000;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int ValorSensor = analogRead(PINO_SENSOR_MQ2);

  float porcentagem = ((float) (ValorSensor - VALOR_MINIMO) / (VALOR_MAXIMO - VALOR_MINIMO)) * 100;

  if (porcentagem < 0) {
    porcentagem = 0;
  } else if (porcentagem > 100) {
    porcentagem = 100;
  }

  // Serial.print("Valor saída do sensor: ");
  Serial.println(ValorSensor);
  // Serial.print(" -> Porcentagem: ");
  // Serial.print(porcentagem);
  // Serial.println("%");

  delay(1000);
}
