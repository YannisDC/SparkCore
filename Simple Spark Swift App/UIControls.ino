// -----------------------------------
// Controlling LEDs using an iPhone app
// Created by Yannis De Cleene on 17/11/14.
// -----------------------------------

// name the pins
int led1 = D0;
int led2 = D1;
int red = A4;
int green = A5;
int blue = A6;

void setup()
{
   //Register our Spark function here
   Spark.function("led", ledControl);
   Spark.function("rgb", rgbControl);

   // Configure the pins to be outputs
   pinMode(led1, OUTPUT);
   pinMode(led2, OUTPUT);
   pinMode(red, OUTPUT);
   pinMode(green, OUTPUT);
   pinMode(blue, OUTPUT);

   // Initialize both the LEDs to be OFF
   digitalWrite(led1, LOW);
   digitalWrite(led2, LOW);
   analogWrite(red, 0);
   analogWrite(green, 0);
   analogWrite(blue, 0);
}



void loop()
{
   // Nothing to do here
}


// This function gets called whenever there is a matching API request
// the command string format is l<led number>,<state>
// for example: l1,HIGH or l1,LOW
//              l2,HIGH or l2,LOW

int ledControl(String command)
{
   int state = 0;
   //find out the pin number and convert the ascii to integer
   int pinNumber = (command.charAt(1) - '0') - 1;
   //Sanity check to see if the pin numbers are within limits
   if (pinNumber < 0 || pinNumber > 1) return -1;

   // find out the state of the led
   if(command.substring(3,7) == "HIGH") state = 1;
   else if(command.substring(3,6) == "LOW") state = 0;
   else return -1;

   // write to the appropriate pin
   digitalWrite(pinNumber, state);
   return 1;
}

int rgbControl(String command)
{

  int loc1 = 0;
  int loc2 = 0;
  int loc3 = 0;
  int targetRed, targetGreen, targetBlue;

  loc1 = command.indexOf(",");
  targetRed = command.substring(0,loc1).toInt();
  analogWrite(red, targetRed);

  loc2 = command.indexOf(",",loc1+1);
  targetGreen = command.substring(loc1+1,loc2).toInt();
  analogWrite(green, targetGreen);

  loc3 = command.indexOf(",",loc2+1);
  targetBlue = command.substring(loc2+1,loc3).toInt();
  analogWrite(blue, targetBlue);
  
  return 1;
}