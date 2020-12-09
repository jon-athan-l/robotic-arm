// Swiveling stepper
const int swivel_step_pin = 2;
const int swivel_dir_pin = 3;

// Tilting stepper
const int tilt_step_pin = 4;
const int tilt_dir_pin = 5;

// Sliding stepper
const int slide_step_pin = 6;
const int slide_dir_pin = 7;

// Velocity deltas (for end movement dampening)
const float lateral_velocity_delta = 0.06;
const float vertical_velocity_delta = 0.06;

// Max/min velocities
const float min_vel = 0.03;
const float max_vel = 0.36;

// Frame size
const float lateral_radius = 640;
const float vertical_radius = 360;

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

int prev_axis = -1;
float prev_movement = -1;

float linear_map(int axis, float movement) {
  if (axis == 0) {
    return ((movement / lateral_radius) * max_vel) + (((lateral_radius - movement) / lateral_radius) * min_vel);
  } else {
    return ((movement / vertical_radius) * max_vel) + (((vertical_radius - movement) / vertical_radius) * min_vel);
  }
}

void loop() {
  if (Serial.available() > 0) {
    int axis = Serial.readStringUntil(' ').toInt();
    float movement = Serial.readStringUntil('!').toInt();

    if (not ((axis == prev_axis) and (movement == prev_movement))) {
      if (axis == 0) {
        if (movement < 0) {
          prev_lateral_movement = "right";
        } else {
          prev_lateral_movement = "left";
       }
        float normalized_movement = abs(movement);
        lateral_velocity = linear_map(axis, normalized_movement);
      }
      else if (axis == 1) {
        if (movement < 0) {
          prev_vertical_movement = "down";
        } else {
          prev_vertical_movement = "up";
        }
        float normalized_movement = abs(movement);
        vertical_velocity = linear_map(axis, normalized_movement);
      }
      
      prev_axis = axis;
      prev_movement = movement;
    }
  } else {
    // Smoothly bring the velocity down to 0
    lateral_velocity = max(min_vel, lateral_velocity - lateral_velocity_delta);
    vertical_velocity = max(min_vel, lateral_velocity - vertical_velocity_delta);
  }
  // Adding 0.01 seems to account for incorrect float equivalencies? i.e. ~min_vel > min_vel == True.
  if (lateral_velocity > min_vel + 0.01) {
    Serial.println(lateral_velocity);
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
