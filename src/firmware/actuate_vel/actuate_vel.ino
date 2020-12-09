// Swiveling stepper
const int swivel_step_pin = 2;
const int swivel_dir_pin = 3;

// Tilting stepper
const int tilt_step_pin = 4;
const int tilt_dir_pin = 5;

// Sliding stepper
const int slide_step_pin = 6;
const int slide_dir_pin = 7;

// Velocity deltas
const int lateral_velocity_delta = 0.02;
const int vertical_velocity_delta = 0.02;

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

float lateral_velocity = 0;
float vertical_velocity = 0;
String prev_movement = "stay";

void loop() {
  if (Serial.available() > 0) {
    String movement = Serial.readStringUntil('!');
    
    if (movement == "left") {
      prev_movement = "left";
      lateral_velocity = min(0.1, lateral_velocity_delta);
    }
    else if (movement == "right") {
      prev_movement = "right";
      lateral_velocity += lateral_velocity_delta;
    }
    else if (movement == "up") {
      prev_movement = "up";
      vertical_velocity += vertical_velocity_delta;
    }
    else if (movement == "down") {
      prev_movement = "down";
      vertical_velocity += vertical_velocity_delta;
    }

    Serial.println("---------------");
    Serial.println(movement);
  } else {
    lateral_velocity = max(0.01, lateral_velocity / 2.0)
    vertical_velocity = max(0.01, lateral_velocity / 2.0)
  }

  if lateral_velocity > 0.01 {
    float delay = 1 / lateral_velocity;
    move(swivel_step_pin, swivel_dir_pin, 10, 5, swivel_direction);
  }
  else if vertical_velocity > 0.01 {
    float delay = 1 / vertical_velocity;
    move(tilt_step_pin, tilt_dir_pin, 10, 5, tilt_direction);
  }

}
