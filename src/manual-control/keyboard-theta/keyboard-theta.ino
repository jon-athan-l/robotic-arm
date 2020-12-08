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

int prev_swivel_theta = 0;
int prev_tilt_theta = 0;
int prev_slide_theta = 0;

int swivel_theta;
int tilt_theta;
int slide_theta;

int swivel_delta;
int swivel_direction;

int tilt_delta;
int tilt_direction;

int slide_delta;
int slide_direction;

void loop() {
  if (Serial.available() > 0) {
    swivel_theta = Serial.readStringUntil(' ').toInt();
    tilt_theta = Serial.readStringUntil(' ').toInt();
    slide_theta = Serial.readStringUntil('!').toInt();
    
    swivel_delta = swivel_theta - prev_swivel_theta;
    if (swivel_delta <= 0) {
      swivel_direction = 1;
    } else {
      swivel_direction = 0;
    }
    tilt_delta = tilt_theta - prev_tilt_theta;
    if (tilt_delta <= 0) {
      tilt_direction = 1;
    } else {
      tilt_direction = 0;
    }
    slide_delta = slide_theta - prev_slide_theta;
    if (slide_delta <= 0) {
      slide_direction = 1;
    } else {
      slide_direction = 0;
    }

    Serial.println("---------------");
    Serial.println(swivel_delta);
    Serial.println(tilt_delta);
    Serial.println(slide_delta);

    move(slide_step_pin, slide_dir_pin, 10, abs(slide_delta), slide_direction);
    move(swivel_step_pin, swivel_dir_pin, 10, abs(swivel_delta), swivel_direction);
    move(tilt_step_pin, tilt_dir_pin, 10, abs(tilt_delta), tilt_direction);


    prev_swivel_theta = swivel_theta;
    prev_tilt_theta = tilt_theta;
    prev_slide_theta = slide_theta;
    
  }
}
