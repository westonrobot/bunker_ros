Header header

int8 MOTOR_ID_FRONT = 0
int8 MOTOR_ID_REAR_LEFT = 1
int8 MOTOR_ID_REAR_RIGHT = 2

# motion state
float64 linear_velocity
float64 angular_velocity

# base state
uint8 base_state
uint8 control_mode
uint16 fault_code
float64 battery_voltage

# motor state
BunkerMotorState[2] motor_states
