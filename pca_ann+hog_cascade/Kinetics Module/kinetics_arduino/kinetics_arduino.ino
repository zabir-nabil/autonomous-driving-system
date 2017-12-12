int max_speed;
int delta;

//motor right
int enA = 10;
int in1 = 8;
int in2 = 9;

// motor left
int enB = 2;
int in3 = 4;
int in4 = 3;

//Sonar code



void setup()
{
  Serial.begin(9600);


  pinMode(enA, OUTPUT);
  pinMode(enB, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(in3, OUTPUT);
  pinMode(in4, OUTPUT);

  max_speed = 50;
  delta = 5;
}

void sp_control(int lsp, int  rsp)
{

  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  // set speed to 200 out of possible range 0~255
  analogWrite(enA, rsp);
  // turn on motor B

  delay(5);

  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);
  // set speed to 200 out of possible range 0~255
  analogWrite(enB, lsp);

  delay(5);
}

void sp_control_r(int lsp, int  rsp)
{

  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  // set speed to 200 out of possible range 0~255
  analogWrite(enA, rsp);
  // turn on motor B

  delay(5);

  digitalWrite(in3, LOW);
  digitalWrite(in4, HIGH);
  // set speed to 200 out of possible range 0~255
  analogWrite(enB, lsp);

  delay(5);
}


void motor_drive(int res)
{
  if (res == 1)
  {
    sp_control(max_speed, max_speed); // lm rm
  }
  else if (res == 2)
  {
    sp_control(max_speed - delta, (max_speed + delta));
  }
  else if (res == 3)
  {
    sp_control(max_speed + delta, (max_speed - delta));
  }
  else if (res == 4)
  {
    sp_control_r(max_speed, max_speed);
  }
  else if (res == 36)
  {
    sp_control(0, 0);
    delay(2000);
  }
  else if (res >= 5 && res <= 35)
  {
    delta = res;
  }
  else if (res >= 50 && res <= 100)
  {
    max_speed = res;
  }

}

void loop()
{
  int res = 0;

  if (Serial.available() > 0) {

    //    /* whatever is available from the serial is read here    */
    res = Serial.read();
    motor_drive(res); //BW division
  }
  else
  {
    //motor_drive(36); // 36 -> Stop
  }


  //sp_control(70, 70);


}
