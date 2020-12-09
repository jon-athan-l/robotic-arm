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
const float lateral_velocity_delta = 0.07;
const float vertical_velocity_delta = 0.02;

// Max/min velocities
const float min_vel = 0.07;
const float max_vel = 0.21;

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

float lateral_velocity = min_vel;
float vertical_velocity = min_vel;
String prev_lateral_movement = "stay";
String prev_vertical_movement = "stay";

void loop() {
  if (Serial.available() > 0) {
    String movement = Serial.readStringUntil('!');
    
    if (movement == "left") {
      prev_lateral_movement = "left";
      lateral_velocity = min(max_vel, lateral_velocity + lateral_velocity_delta);
    }
    else if (movement == "right") {
      prev_lateral_movement = "right";
      lateral_velocity = min(max_vel, lateral_velocity + lateral_velocity_delta);
    }
    else if (movement == "up") {
      prev_vertical_movement = "up";
      vertical_velocity = min(max_vel, vertical_velocity + vertical_velocity_delta);
    }
    else if (movement == "down") {
      prev_vertical_movement = "down";
      vertical_velocity = min(max_vel, vertical_velocity + vertical_velocity_delta);
    }

    Serial.println("---------------");
    Serial.println(movement);
  }
  else {
    lateral_velocity = max(min_vel, lateral_velocity - (2 * lateral_velocity_delta));
    vertical_velocity = max(min_vel, lateral_velocity - (2 * vertical_velocity_delta));
  }
  if (lateral_velocity > min_vel + 0.01) {
    int swivel_direction;
    float cycle_delay = 1 / lateral_velocity;
    if (prev_lateral_movement == "left") {
      swivel_direction = 1;
    } else {
      swivel_direction = 0;
    }
    move(swivel_step_pin, swivel_dir_pin, int(cycle_delay), 10, swivel_direction);
  }
  else if (vertical_velocity > min_vel + 0.01) {
    int tilt_direction;
    float cycle_delay = 1 / vertical_velocity;
    if (prev_vertical_movement == "up") {
      tilt_direction = 1;
    } else {
      tilt_direction = 0;
    }
    move(tilt_step_pin, tilt_dir_pin, int(cycle_delay), 10, tilt_direction);
  }

}
