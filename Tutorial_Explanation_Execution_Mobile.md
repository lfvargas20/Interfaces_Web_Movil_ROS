# TurtleBot4 Control & Video Application Documentation

This project enables controlling a TurtleBot4 in simulation through a mobile application. The app is designed to provide real-time control, data visualization (such as position and velocity), and video streaming from an RGB camera.

---

## 🚀 Objectives
The purpose of this application is to allow users to:
- Control the robot using buttons.
- Display data such as robot velocity, position, and orientation.
- Integrate real-time video streaming from an RGB camera.

---

## 🛠️ Tools

- **Backend**: ROS 2 Humble.
- **Mobile Frontend**: Flutter - Visual Studio Code.
- **Other ROS 2 Packages**:
  - Nav2
  - Turtlebot4_bringup
  - web_video_server
  - rosbridge_server

---

## 📝 Requirements

- ROS 2 Humble and all required packages installed.
- Network connection between the mobile application and the ROS server.
- Flutter installed for executing the mobile frontend.

---

## ⚙️ Installation

### 1. **ROS 2 Humble Configuration**

#### 1.1 **Install and Configure rosbridge_server**

Install the `rosbridge_server` package in your ROS 2 environment:

```bash
sudo apt install ros-humble-rosbridge-server
```

To start the rosbridge WebSocket server using the default launch file in ROS 2, run the following command:
```bash
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```
This command activates the server on default port `9090`.

---

#### 1.2 **Install and Configure web_video_server**

Install the `web_video_server` package in your ROS 2 environment:
```bash
sudo apt install ros-humble-web-video-server
```
To run the node directly, use the following command:
```bash
ros2 run web_video_server web_video_server
```
This starts the video server on the default port (`8080`). You can access the video stream in your web browser using the following address:
```bash
http://<HOST_IP>:8080/stream?topic=/oakd/rgb/preview/image_raw
```
Make sure to replace `<HOST_IP>` with the IP address of the machine running the server (or `localhost` if running on the same machine).

---

### 2. **Flutter Installation** 

Visit the official Flutter installation guide at https://docs.flutter.dev/get-started/install and select your operating system (Linux in this case).

![image](https://github.com/user-attachments/assets/e45c982f-148f-47bc-8245-d1f7d556162a)

Then choose **Desktop** to install it on your computer.

![image](https://github.com/user-attachments/assets/55623010-269c-47d3-98b2-bf60e64a7f48)

Here you can review the software and hardware requirements needed to install and run Flutter.

#### Hardware Requirements to Install Flutter #### 
![image](https://github.com/user-attachments/assets/3ced0dce-55aa-4ccb-b597-5197324c30e8)

#### Software Requirements to Install Flutter #### 
To write and compile Flutter code for Linux desktop, you must have the required Linux version and software packages listed below.

Install the following packages: `curl`, `git`, `unzip`, `xz-utils`, `zip`, `libglu1-mesa`
```bash
sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
```

To develop Linux desktop applications, install these development packages: `clang`, `cmake`, `ninja-build`, `pkg-config`, `libgtk-3-dev`, `libstdc++-12-dev`

```bash
sudo apt-get install \
      clang cmake git \
      ninja-build pkg-config \
      libgtk-3-dev liblzma-dev \
      libstdc++-12-dev
```

#### Install the Flutter SDK #### 
To install Flutter, download the Flutter SDK archive, move it to your preferred directory, and extract it:

1. Download the installation bundle to get the latest stable version of the Flutter SDK.
![image](https://github.com/user-attachments/assets/7e50d7aa-7df4-4f44-af62-6e44ecc60aab)

2. Extract the archive into your target directory using the following command:
```bash
tar -xf ~/Downloads/flutter_linux_3.27.3-stable.tar.xz 
```

3. Move the extracted Flutter folder to the `/opt/` directory:
```bash
sudo mv flutter /opt/
```

#### Add Flutter to PATH #### 
Open your shell configuration file:
```bash
nano ~/.bashrc
```

Add the following line at the end of the file:
```bash
export PATH="$PATH:/opt/flutter/bin"
```

Verify that Flutter is properly installed by checking its version:
```bash
flutter --version
```
The output confirms your Flutter installation and details the framework, engine, and tool versions.

![image](https://github.com/user-attachments/assets/18fce2ca-455e-485c-8a7a-5de09b45973b)

#### Flutter Doctor ####
The `flutter doctor` command is a diagnostic tool included with Flutter to verify the status of your development environment and ensure everything is configured properly.

![image](https://github.com/user-attachments/assets/c0849a98-fafa-4c4d-b24a-45c40a8527af)

In this case, we can observe missing requirements, including **Android Studio**, which is essential for Flutter mobile app development.

---

### 3. **Android Studio Installation**

1. Visit the official Android Studio website and download the `.tar.gz` package from https://developer.android.com/studio.
   ![image](https://github.com/user-attachments/assets/5020bfd1-8d45-44bb-bc10-5ed0b2c91dcd)

2. Click **"Download Android Studio Ladybug"** and accept the terms and conditions.

[Screen recording from 26-01-25 18:04:52.webm](https://github.com/user-attachments/assets/8ce518ff-007d-4ae9-ae43-98ad21098457)

3. Extract the downloaded package:
```bash
tar -xvzf ~/Downloads/android-studio-2024.2.2.13-linux.tar.gz 
```

4. Launch the Android Studio installer and complete the setup wizard:
```bash
/opt/android-studio/bin/studio.sh
```

5. Add Android Studio to PATH so it can be launched from any terminal location:
```bash
nano ~/.bashrc
```

6. Add the following line at the end of the file:
```bash
export PATH="$PATH:/opt/android-studio/bin"
```

7. Save changes and reload your shell configuration:
```bash
source ~/.bashrc
```

8. Run `flutter doctor` again to verify complete installation:
![image](https://github.com/user-attachments/assets/21218cc9-6ce3-4003-ad0f-f6d5a63d9933)

---

### Setting Up a Mobile Device in Developer Mode as an Emulator/Target ### 

While software emulators in Flutter are helpful for simulating mobile devices across various resolutions and OS versions, testing on a physical smartphone is ideal for evaluating real performance, touch gestures, sensor integration, and network conditions.

[Emulator.webm](https://github.com/user-attachments/assets/3fe0d5be-e438-4175-a0ec-ae315fd68dba)

---

### 4. **Run the Application**

Fetch required dependencies specified in `pubspec.yaml` by executing:
```bash
cd ~/Interfaces_Web_Movil_ROS/interfaces/turtlebot4_app-main
```

```bash
flutter pub get 
```
![image](https://github.com/user-attachments/assets/f955f7d5-4e07-4c00-a12f-1976f712bb56)

To use a physical mobile device, enable Developer Mode and USB Debugging as described previously, connect the phone via USB cable, and accept the debugging prompt on your device.

Run the application with:
```bash
flutter run
```

[Screen recording from 27-01-25 02:13:54.webm](https://github.com/user-attachments/assets/4ecf508e-8a34-4e8e-badf-a1e27a6f5c20)

---

## Command Tutorial to Run the Application

Execute the terminal commands in the following order:

```bash
ros2 launch turtlebot4_ignition_bringup turtlebot4_ignition.launch.py
```

```bash
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```

```bash
ros2 run web_video_server web_video_server
```

## Video Tutorial: https://youtu.be/6dWMH1nb9WA

---

## 🗂️ Project Structure

The project is organized into several directories and files:

- `lib/screens`: Main application screen views.
- `lib/widgets`: Reusable UI widgets for robot controls and data display.
- `lib/utils`: Services such as WebSocket management for ROS communication and pose/velocity tracking.
- `main.dart`: Entry point executed when launching the application.

---

## 📜 Code Explanation

### WebSocket Connection

The code defines a class named `WebSocketService` that manages WebSocket connections, offering a centralized mechanism to connect, send messages, and disconnect.

#### Imports:
- `package:web_socket_channel/web_socket_channel.dart`: Manages WebSocket channels.
- `dart:convert`: Encodes and decodes JSON payloads.

#### Class `WebSocketService`:
Manages WebSocket communications with a ROS server using a Singleton pattern to maintain a single active connection instance.

### Execution Summary:

#### Private Constructor:
- `WebSocketService._internal({required this.serverUrl})`: Private constructor that initializes the WebSocket connection.

#### Factory Constructor:
- `factory WebSocketService({required String serverUrl})`: Returns the existing Singleton instance (`_instance`) or creates a new one if it does not exist yet.

#### Method `_connect()`:
- `_connect()`: Establishes the WebSocket connection channel using the provided URL.

#### Getter `channel`:
- `WebSocketChannel get channel`: Exposes the connected WebSocket channel.

#### Method `sendMessage()`:
- `sendMessage(Map<String, dynamic> message)`: Converts a map into JSON format and transmits it over the WebSocket channel.

#### Method `closeConnection()`:
- `closeConnection()`: Closes the WebSocket connection and releases network resources.

[WebSocketService Code](https://github.com/greicyd/turtlebot4_app/blob/main/lib/utils/websocket_service.dart)

---

### Robot Control

The code defines a widget called `RobotButtons` that enables manual motion control of the robot using UI buttons. The widget is a `StatelessWidget`.

#### Imports:
- `package:flutter/material.dart`: Flutter UI elements.
- `../utils/websocket_service.dart`: Service handling WebSocket communication.

#### Class `RobotButtons`:

##### Constructor:
- `RobotButtons({Key? key, required this.webSocketService})`: Takes a `WebSocketService` instance to send control messages.

##### Methods:
- `_moveForward()`: Sends a publish message to `/cmd_vel` with positive linear $x$ velocity.
- `_moveBackward()`: Sends a publish message to `/cmd_vel` with negative linear $x$ velocity.
- `_turnLeft()`: Sends a publish message with positive angular $z$ velocity.
- `_turnRight()`: Sends a publish message with negative angular $z$ velocity.
- `_stop()`: Resets all linear and angular velocity fields to $0$.

##### `build` Method:
- `Column`: Lays out buttons vertically.
- `ElevatedButton`: Clickable control buttons.
- `onPressed`: Binds buttons to motion functions (`_moveForward`, `_turnLeft`, `_stop`, `_turnRight`, `_moveBackward`).

[RobotButtons Code](https://github.com/greicyd/turtlebot4_app/blob/main/lib/widgets/robot_buttons.dart)

---

### Pose and Velocity Management

The `PoseAndVelocityManager` class manages simulated pose, orientation, and velocity data by subscribing to ROS topics through WebSockets.

#### Imports:
- `dart:convert`: JSON encoding/decoding.
- `../utils/websocket_service.dart`: Handles WebSocket communication.

#### Class `PoseAndVelocityManager`:

##### Member Variables:
- `TruthPosePosition` & `TruthPoseOrientation`: Store position and orientation text strings.
- `linearVelocityX`, `linearVelocityY`, `linearVelocityZ` & `angularVelocityX`, `angularVelocityY`, `angularVelocityZ`: Hold numerical linear and angular velocity values.

##### Method `subscribeToTopics()`:
Subscribes to `/odom` via WebSocket:
- Sends `{"op": "subscribe", "topic": "/odom"}`.
- Listens to stream messages via `webSocketService.channel.stream.listen()`.
- Decodes JSON and updates pose and velocity state via `updatePosition()` and `updateVelocity()`.

[PoseAndVelocityManager Code](https://github.com/greicyd/turtlebot4_app/blob/main/lib/utils/pose_val.dart)

---

### Data Visualization Widgets

Defines widgets for cards and sliders showing pose, orientation, and velocity values.

#### 1. `buildPositionCard(String position)`
Displays an icon, descriptive text, and the position value inside a styled `Card`.

#### 2. `buildOrientationCard(String orientation)`
Displays a rotation icon, label, and orientation string inside a `Card`.

#### 3. `buildVelocityControls(...)`
Renders sliders to adjust linear and angular speeds dynamically.

#### 4. `buildSlider(String label, double value, Function(double) onChanged)`
A generic slider widget operating in the $[-2.0, 2.0]$ range.

[Data Widgets Code](https://github.com/greicyd/turtlebot4_app/blob/main/lib/widgets/datos.dart)

---

### Robot Control Page

`TurtleBotControlPage` is a `StatefulWidget` serving as the main control hub.

#### Overview:
- `initState()`: Initializes `WebViewController` for camera streaming, connects `WebSocketService`, and subscribes to ROS topics.
- `dispose()`: Closes connections gracefully when navigating away.
- `build()`: Combines `WebViewWidget` (video), `RobotButtons`, `SingleChildScrollView`, and data cards (`buildPositionCard`, `buildOrientationCard`, `buildVelocityControls`) into a responsive layout.

[TurtleBotControlPage Code](https://github.com/greicyd/turtlebot4_app/blob/main/lib/screens/control_page.dart)

---

### Main Entry Point

The `main.dart` file sets up the root `MyApp` widget, configures the app theme, and sets `TurtleBotControlPage` as the home screen.

[Main Code](https://github.com/greicyd/turtlebot4_app/blob/main/lib/main.dart)

---

## Expected Results

## Functional Project Video: https://youtu.be/BrllJuRdWXA

---

## 🧪 Testing and Validation

To test and validate the application:

1. Verify connection status between ROS 2 and the mobile application.
2. Ensure sent motion commands accurately reflect in the Gazebo simulation.
3. Test real-time RGB video streaming performance from the camera feed.