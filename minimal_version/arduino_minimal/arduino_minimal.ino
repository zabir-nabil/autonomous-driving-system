int a1 = 0;
int a2 = 0;

#define mxsp 115
#define delta 20

int res;
int left_speed;
int right_speed;

//motor right
int enA = 10;
int in1 = 8;
int in2 = 9;
// motor left
int enB = 2;
int in3 = 4;
int in4 = 3;

//Sonar code

const int trigPin = 6;
const int echoPin = 7;

long duration;
int distance;

void setup()
{
  Serial.begin(9600);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Inpu

  pinMode(enA, OUTPUT);
  pinMode(enB, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(in3, OUTPUT);
  pinMode(in4, OUTPUT);
}

void sp_control(int lsp,int  rsp)
{

  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  // set speed to 200 out of possible range 0~255
  analogWrite(enA, rsp);
  // turn on motor B

  delay(10);

  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);
  // set speed to 200 out of possible range 0~255
  analogWrite(enB, lsp);

  delay(10);
}

void avg_dis(int samp)
{
int t_dis = 0;
for(int i=1;i<=samp;i++){
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance= duration*0.034/2;
t_dis += distance;
}
return t_dis/samp;
}

void motor_drive(int res)
{
  if (res == 1)
  {
    sp_control(mxsp, mxsp); // lm rm
  }
  else if (res == 2)
  {
    sp_control(mxsp + delta, mxsp - delta);
  }
  else if (res == 3)
  {
    sp_control(mxsp - delta, mxsp + delta);
  }
  else if(res == 4)
  {

    sp_control(0,0);
    delay(1000);
  }
}
void motor_stop()
{
  Serial.println("No data. Car stopped");
}
void loop()
{


  if (Serial.available() > 0) {

    /* whatever is available from the serial is read here    */
    res = Serial.read();
    motor_drive(res);
    Serial.println(res);

  }

int av_d = avg_dis(10);

if(av_d<=10)
{
  sp_control(0,0);
  Serial.print(1); //fix later
}
else
{
  Serial.print(0); //fix later
}

}
