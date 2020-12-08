// Swiveling stepper
const int swivel_step_pin = 2;
const int swivel_dir_pin = 3;

// Tilting stepper
const int tilt_step_pin = 4;
const int tilt_dir_pin = 5;

// Sliding stepper
const int slide_step_pin = 6;
const int slide_dir_pin = 7;

void move(int step_pin, int dir_pin, int step, int pulses, int dir) {
  for (int i = 0; i < pulses; i++) {
    if (dir == 0) {
    digitalWrite(dir_pin, LOW);
    } else {
      digitalWrite(dir_pin, HIGH);
    }
    digitalWrite(step_pin, HIGH);
    delay(step);
    digitalWrite(step_pin, LOW);
    delay(step);
  }
}

void setup() {
  Serial.begin(9600);
  Serial.setTimeout(1);
  
  // Swivel stepper
  pinMode(swivel_step_pin, OUTPUT);
  pinMode(swivel_dir_pin, OUTPUT);

  // Tilt stepper
  pinMode(tilt_step_pin, OUTPUT);
  pinMode(tilt_dir_pin, OUTPUT);

  // Slide stepper
  pinMode(slide_step_pin, OUTPUT);
  pinMode(slide_dir_pin, OUTPUT);
  
  Serial.print("Set up successful.");
}


void loop() {
  if (Serial.available() > 0) {
    String movement = Serial.readStringUntil('!');
    
    if (movement == "left") {
      int swivel_direction = 1;
      move(swivel_step_pin, swivel_dir_pin, 10, 5, swivel_direction);
    }
    else if (movement == "right") {
      int swivel_direction = 0;
      move(swivel_step_pin, swivel_dir_pin, 10, 5, swivel_direction);
    }
    else if (movement == "up") {
      int tilt_direction = 1;
      move(tilt_step_pin, tilt_dir_pin, 10, 5, tilt_direction);
    }
    else if (movement == "down") {
      int tilt_direction = 0;
      move(tilt_step_pin, tilt_dir_pin, 10, 5, tilt_direction);
    }

    Serial.println("---------------");
    Serial.println(movement);
    
  }
}
