# Web Interface Explanation

This document describes the structure and operation of the files that make up the web interface for the TurtleBot 3 robot, explaining line by line the purpose of each section.

## 1. Prerequisites

* Knowledge of HTML, CSS, and JavaScript
* Knowledge of ROS (topics, nodes)

## 2. Web Interface Files

* `index.html`
* `styles.css`
* `index.js`

## 3. Explanation of the `index.html` File

### 3.1 Line 1

```html
<!DOCTYPE html>
```

Indicates to the browser which version of HTML the page is written in.

### 3.2 Line 2

```html
<html lang="en">
```

Indicates to the browser that it is reading an `.html` file, also defining the primary language of the page (in this case, English).

### 3.3 Lines 3-13

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TurtleBot 3 Web Interface</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/roslib@1/build/roslib.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/easeljs@1/lib/easeljs.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/eventemitter2@6/lib/eventemitter2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/ros2d@0/build/ros2d.js"></script>
</head>
```

Contains technical information about the page that is not displayed directly on it, enclosed within the `head` tag. The details of each line are described below:

| Line(s) | Code | Description |
|---|---|---|
| 4 | `<meta charset="UTF-8">` | Indicates character encoding |
| 5 | `<meta name="viewport" content="width=device-width, initial-scale=1.0">` | Indicates viewport dimensions and zoom level to the browser |
| 6 | `<title>TurtleBot 3 Web Interface</title>` | Indicates the tab title corresponding to the page |
| 7-8 | `<link rel="stylesheet" ...>` | Indicates `.css` files related to the page, used for styling |
| 9-12 | `<script src="...roslib..."></script>` etc. | Indicates `.js` library files used to execute JavaScript on the page. In this case, `roslibjs`, `ros2djs`, and their respective dependencies are used |

### 3.4 Lines 16-208

Contains the content displayed on the page, enclosed within the `body` tag.

#### 3.4.1 Lines 18-205

Defines the separation of displayed content using a main `div` container, inside which the different sections of the page are located, each organized in its own `div` container.

| Lines | Section | Description |
|---|---|---|
| 19-21 | Header | `<div class="grid-item-header">` — Page title: "TurtleBot 3 Web Interface" |
| 24-31 | Camera | Robot camera section |
| 33-68 | Map | Robot environment map section |
| 71-116 | Indicators | Linear and angular velocity, stability and proximity alarms |
| 118-196 | Control | Manual/automatic control of the robots (see details in 3.4.1.5) |
| 201 | Script | `.js` file used to execute JavaScript and interact with each section of the page |

#### 3.4.2 Control section details (lines 118-196)

| Lines | Description |
|---|---|
| 119 | Section title |
| 121-195 | `div` container that horizontally organizes the robot control types |
| 122-155 | `div` container for the manual control section |
| 157-194 | `div` container for robot selection and automatic control section |

## 4. Explanation of the `style.css` File

Defines the visual appearance of each section and component on the page. Most rules follow the same pattern: they apply styling characteristics to elements within a `div` container with a specific class or `id`.

| Lines | Tag, Class, or ID | Description |
|---|---|---|
| 1-9 | `body` | General rules applied to all elements inside `body` |
| 11-16 | `h2` | Styling for section titles across the page |
| 18-25 | `.grid-container` | Styling for the main page section container |
| 27-37 | `.grid-item-header` | Styling for the page title |
| 40-45 | `.grid-item` | Styling for the page section containers |
| 47-50 | `.top-item` | Styling for containers of top page sections |
| 52-55 | `.low-item` | Styling for containers of bottom page sections |
| 58-62 | `.indicators` | Styling for the indicators section container |
| 64-72 | `.indicator-box` | Styling for the container grouping indicators |
| 74-78 | `.indicator-box-hbox` | Styling for content within the container grouping Roll angle value and linear velocity |
| 81-84 | `.indicator-label` | Styling for indicator labels |
| 86-89 | `.indicator-value` | Styling for values of indicator labels |
| 91-93 | `.first-label` | Styling for the label corresponding to Roll angle |
| 95-97 | `.item1` | Styling for Roll and Pitch angle values |
| 99-102 | `.item2` | Styling for the linear velocity label |
| 104-106 | `.item3` | Styling for linear and angular velocity values |
| 108-111 | `.item4` | Styling for the angular velocity label |
| 113-115 | `.item5` | Styling for the linear velocity label |
| 117-119 | `.item6` | Styling for the Yaw angle label |
| 121-126 | `.buttons-container` | Styling for manual and automatic control containers |
| 128-132 | `.vbox-buttons` | Styling for the container holding rotation and stop buttons in manual control |
| 134-140 | `.button` | Styling for manual control buttons |
| 142-145 | `.button:hover` | Appearance of buttons when hovered over |
| 158-162 | `.horizontal-container` | Organization of manual and automatic control containers |
| 164-169 | `.vertical-container` | Styling for automatic control labels and inputs |
| 171-176 | `.horizontal-container-pose` | Organization of automatic control labels and inputs |
| 178-180 | `.navigation-container` | Organization of automatic control labels and inputs |
| 182-188 | `.navigation-button` | Styling for automatic control buttons |
| 190-195 | `.nav-button` | Organization of automatic control buttons |
| 197-203 | `.input-field` | Styling for automatic control input fields |
| 205-209 | `.canvas-container` | Organization of the map container |
| 211-213 | `.label` | Styling and organization of map axis labels |
| 215-222 | `.vertical-label-container` | Organization of $y$-axis map values |
| 224-230 | `.horizontal-label-container` | Organization of $x$-axis map values |
| 232-236 | `#x-label` | Styling for $x$-axis map values |
| 238-241 | `#y-label` | Styling for $y$-axis map values |
| 243-246 | `.goal-status` | Styling for text in the automatic control section indicating whether navigation was started, completed, or canceled |
| 248-255 | `.grouped-fields` | Organization of the robot checkboxes container |
| 257-260 | `.field` | Organization of robot checkboxes |
| 262-264 | `.radio-checkbox input[type="radio"]:checked + label` | Styling for selected robot checkbox labels |
| 266-268 | `#robot1` | Checkbox color for the first robot |
| 270-272 | `#robot2` | Checkbox color for the second robot |
| 283-285 | `.radio-checkbox label::before` | Styling for robot checkboxes |
| 287-291 | `.legend` | Organization and styling for robot labels in the map section |

## 5. Explanation of the `index.js` File

### 5.1 Rosbridge Connection (lines 2-19)

| Lines | Description |
|---|---|
| 2-6 | Connecting the web page to the Rosbridge server |
| 8-11 | Console confirmation of connection |
| 13-15 | Console confirmation of error |
| 17-19 | Console confirmation of disconnection from Rosbridge server |

### 5.2 General Topic Variables (lines 23-88)

| 5.2.x | Lines | Topic | Description |
|---|---|---|---|
| 5.2.1 | 23-27 | `/clock` | Constant variable storing the simulation clock topic |
| 5.2.2 | 30-34 | `/tb3_1/map` | Environment map (`OccupancyGrid` messages) |
| 5.2.3 | 38-42 | `/tb3_1/odom` | Odometry of the first robot. Used in indicators section |
| 5.2.4 | 44-48 | `/tb3_2/odom` | Odometry of the second robot. Used in indicators section |
| 5.2.5 | 51-55 | `/tb3_1/odom` | Odometry of the first robot. Used in map section |
| 5.2.6 | 57-61 | `/tb3_2/odom` | Odometry of the second robot. Used in map section |
| 5.2.7 | 66-70 | `/tb3_1/scan` | LiDAR sensor data of the first robot. Used in indicators |
| 5.2.8 | 72-76 | `/tb3_2/scan` | LiDAR sensor data of the second robot. Used in indicators |
| 5.2.9 | 78-82 | `/tb3_1/imu` | Velocity and orientation of the first robot. Used in indicators |
| 5.2.10 | 84-88 | `/tb3_2/imu` | Velocity and orientation of the second robot. Used in indicators |

### 5.3 Velocity Command Isolation (lines 92-134)

Variable and functions that allow isolating velocity command transmissions for each robot.

### 5.4 Autonomous Navigation Variables (lines 139-214)

Used in the manual/automatic control section:

| 5.4.x | Lines | Topic | Service | Description |
|---|---|---|---|---|
| 5.4.1 | 139-143 | `/tb3_1/start_navigation` | - | Boolean to start autonomous navigation of the first robot |
| 5.4.2 | 145-149 | `/tb3_2/start_navigation` | - | Boolean to start autonomous navigation of the second robot |
| 5.4.3 | 152-156 | `/tb3_1/pose_x` | - | $x$ position of target coordinate for the first robot |
| 5.4.4 | 158-162 | `/tb3_1/pose_y` | - | $y$ position of target coordinate for the first robot |
| 5.4.5 | 164-168 | `/tb3_1/pose_yaw` | - | Yaw angle of target coordinate for the first robot |
| 5.4.6 | 170-174 | `/tb3_2/pose_x` | - | $x$ position of target coordinate for the second robot |
| 5.4.7 | 176-180 | `/tb3_2/pose_y` | - | $y$ position of target coordinate for the second robot |
| 5.4.8 | 182-186 | `/tb3_2/pose_yaw` | - | Yaw angle of target coordinate for the second robot |
| 5.4.9 | 191-195 | `/tb3_1/navigation_status` | - | Text indicating whether navigation of the first robot was successful or canceled |
| 5.4.10 | 197-201 | `/tb3_2/navigation_status` | - | Text indicating whether navigation of the second robot was successful or canceled |
| 5.4.11 | 204-208 | - | `/tb3_1/navigate_to_pose/_action/cancel_goal` | Cancels autonomous navigation of the first robot |
| 5.4.12 | 210-214 | - | `/tb3_2/navigate_to_pose/_action/cancel_goal` | Cancels autonomous navigation of the second robot |

### 5.5 Robot DOM Elements (lines 220-221)

Variables storing elements with `id` `robot1` and `robot2`, corresponding to the first and second robot.

### 5.6 First Robot Control Function (lines 227-420)

Adds information for the first robot to the page and enables manual control through subscription and publication to its respective topics.

| Lines | Description |
|---|---|
| 229-235 | Unsubscribing from topics that do not belong to the first robot |
| 238 | Selecting the velocity command topic, using functions/variables from 5.3 |
| 241-250 | Variables and functions to adjust the video feed from `web-video-server` in the camera section |
| 252-254 | Text fields corresponding to RPY angles of the first robot |
| 256 | Text field corresponding to the proximity alarm of the first robot |
| 259-277 | Subscription to `/tb3_1/scan`: organizes LiDAR data into a list, removes null values, and adds text indicating if the robot is within $0.2\text{ m}$ of an obstacle |
| 279-280 | Text fields corresponding to linear and angular velocities of the first robot |
| 284-285 | Linear and angular velocity command variables, initialized to $0.00\text{ m/s}$ and $0.00\text{ rad/s}$ |
| 290-301 | `Twist` message type containing the velocity command for the first robot, constructed using the above variables |
| 303-343 | Manual control buttons and event handlers: increase/decrease velocity and publish the `Twist` message to the corresponding topic |
| 345-358 | Subscription to odometry (5.2.3): gets real-time linear/angular velocity and updates text fields |
| 360-404 | Subscription to IMU (5.2.9): converts quaternions to Euler angles and updates text fields in real time |
| 406-418 | Subscription to navigation status (5.4.9): displays on the page whether autonomous navigation succeeded or was canceled |

### 5.7 Second Robot Control Function (lines 422-610)

Executes the same processes as the function in 5.6, applied to the second robot.

### 5.8 Environment Map (lines 621-875)

| Lines | Description |
|---|---|
| 621-739 | Variables and functions to create the area housing the environment map on the page |
| 742-864 | Subscription to map (5.2.2): receives message cells, resizes map to available area size, represents robots as colored circles, and draws their real-time trajectories via simultaneous subscription to odometry (5.2.5) |
| 867-868 | $x$ and $y$ position variables, initialized to $0$ |
| 872-875 | Subscription to odometry (5.2.6) updating the above variables, used in the process of lines 742-864 |

### 5.9 Note

The process in lines 872-875 runs inside the process of lines 742-864.

### 5.10 Automatic Control / Navigation to Coordinates (lines 883-1010)

| Lines | Description |
|---|---|
| 883-885 | Text input fields for target coordinates in automatic control ($x$, $y$, $\theta$) |
| 887-963 | Function that takes target coordinates, starts autonomous navigation of the selected robot, and draws a yellow circle on the map marking the target destination |
| 965-1010 | Function that sends a request to cancel autonomous navigation of the selected robot, stops it, and processes the request response |