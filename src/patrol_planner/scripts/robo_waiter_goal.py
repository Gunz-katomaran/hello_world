#!/usr/bin/env python
import rospy, sys, actionlib, time, json
from patrol_planner.srv import PathLoad, PathLoadResponse, GPSGoal, GPSGoalResponse, GetPlan, GetPlanResponse, GetPlanRequest
from patrol_planner.srv import Tl_gl, Tl_glResponse, Save, SaveResponse, Park, ParkResponse, Obstacle, ObstacleResponse
from patrol_planner.msg import Milestone, Tabled
from std_msgs.msg import Bool
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Pose, Twist
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from math import sqrt
from math import cos, sin, hypot
import rospkg
rospack = rospkg.RosPack()
marker_count = 0
path_is_closed = True
separation_distance = 1
tl_list = []
tl_xy_list = []
pl_list = []
config_file_path = rospack.get_path('robo_waiter') + "/config/"
map_orientation = origin_latitude = origin_longitude = response = path_name = ml_xy_list = xy_list = current_x = current_y = current_z = current_w = None
path_name1 = res =  table_name = mile_name = kg = home_point = parking_point = goal_status = direction = None
parking = home_pt_b = table_bl = one = False
duration = None

def path_load_cb ():
    global response, path_name, path_name1, tl_list,tl_xy_list, res
    path_name = "re"
    path_name1 = "re"
    f = open (config_file_path + path_name + "coord.txt", "r")
    f1 = open (config_file_path + path_name1 + "ts.txt", "r")
    data = f.read ()
    data1 = f1.read ()
    b = json.loads(data)
    b1 = json.loads(data1)

    res = PathLoadResponse ()
    for i in range (0, len (b1)):
        str_list = str(b1[i])
        str_list = str_list.split (",")
        table = Tabled ()
        table.name = str_list [4]
        table.x = x = float (str_list [0])
        table.y = y = float (str_list [1])
        table.z = z = float (str_list [2])
        table.w = w = float (str_list [3])
        res.milestone_list.append (table)
        tl_xy_list.append([x,y,z,w])
    
    generate_markers (tl_xy_list, 1, 0, 255, 0, 0.2, 0.2, 0.2, tl_marker)



    response = PathLoadResponse ()
    gps_coordinates = []
    for i in range (0, len (b)):
        str_list = str(b[i])
        str_list = str_list.split (",")
        if len (str_list) == 5:
            milestone = Milestone ()
            milestone.name = str_list [4]
            milestone.x = float (str_list [0])
            milestone.y = float (str_list [1])
            milestone.z = float (str_list [2])
            milestone.w = float (str_list [3])
            response.milestone_list.append (milestone)
        lat_long_heading = [float (str_list [0]), float (str_list [1]), float (str_list [2]),float (str_list [3])]
        gps_coordinates.append (lat_long_heading)
    get_xy_list (gps_coordinates)
    get_milestone_xy (response)
    rospy.loginfo ("Converted GPS Path to xy coordinates in map %s", path_name+"coord")


def get_milestone_xy (resp):
    global ml_xy_list
    ml_xy_list =[]
    for i in range (0, len(resp.milestone_list)):
        x, y = resp.milestone_list[i].x, resp.milestone_list[i].y
        z, w = resp.milestone_list[i].z, resp.milestone_list[i].w
        ml_xy_list.append ([x,y,z,w])
    generate_markers (ml_xy_list, 1, 255, 0, 0, 0.2, 0.2, 0.2, ml_marker)


def generate_markers(xyzw_list, marker_type, r,g,b, length, breadth, height, publisher_var):
    #marker_array = MarkerArray ()
    for i in range (0, len (xyzw_list)):
        marker = Marker ()
        marker.header.frame_id = "map"
        marker.header.stamp = rospy.Time.now()
        marker.ns = "xy"+ str(i)
        marker.id = i
        marker.type = marker_type	
        marker.action = 0
        marker.pose.position.x = xyzw_list[i][0]
        marker.pose.position.y = xyzw_list[i][1]
        marker.pose.orientation.z = xyzw_list[i][2]
        marker.pose.orientation.w = xyzw_list[i][3]
        marker.lifetime = rospy.Duration(0)
        marker.color.r = r
        marker.color.g = g
        marker.color.b = b
        marker.color.a = 1
        marker.scale.x = length
        marker.scale.y = breadth
        marker.scale.z = height
        #time.sleep (0.1)
        #print i
        publisher_var.publish (marker)

        
def get_xy_list (gps_list):
    global xy_list
    xy_list = []
    for i in range (0, len(gps_list)):
        x, y = gps_list[i][0], gps_list[i][1]
        z, w = gps_list[i][2], gps_list[i][3]
        xy_list.append ([x,y,z,w])
    generate_markers (xy_list, 1, 0, 0, 255, 0.1, 0.1, 0.1, pub)




def send_goal (x, y, z, w):
    global parking, goal_status, table_bl, direction, duration, delivery, one
    action_goal = MoveBaseGoal ()
    action_goal.target_pose.header.frame_id = "map"
    action_goal.target_pose.header.stamp = rospy.Time.now ()
    action_goal.target_pose.pose.position.x = x
    action_goal.target_pose.pose.position.y = y
    action_goal.target_pose.pose.orientation.z = z
    action_goal.target_pose.pose.orientation.w = w
    goal_handle = client.send_goal (action_goal)
    wait = client.wait_for_result()
    if wait:
        print "wait"
        

    print (client.get_state())

    if client.get_state() == 2:
        print "abort"
        goal_status = "abort"
    if client.get_state() == 3:
            if table_bl and direction != None:
                turn(direction,duration)
            elif kg == "mile":
                dt = String()
                data = {}
                data['command'] = "STOP"
                dt.data = str.encode(json.dumps(data))
                ard.publish(dt)
            else:
                dt = Bool()
                delivery.publish(dt.data=True)

        print "reached"
        goal_status = "ok"
        if not parking:
            parking = True
        elif parking:
            one = False
            parking = False

def goal_cb (req):
    global kg, mile_name, home_pt_b
    if (response == None) or (not home_pt_b):
        rospy.logwarn ("Did not load any Path, No milestones found")
    else:
        resp = GPSGoalResponse()
        goal_x = None
        for i in range (0, len (response.milestone_list)):
            if response.milestone_list[i].name == req.milestone_name:
                kg = "mile"
                mile_name = req.milestone_name
                goal_x = response.milestone_list[i].x
                goal_y = response.milestone_list[i].y
                goal_z = response.milestone_list[i].z
                goal_w = response.milestone_list[i].w
        if goal_x == None:
            rospy.logwarn ("No such Milestone in %s", path_name)
            resp.goal_sent_status = False
        else:
            x,y = goal_x, goal_y
            z,w = goal_z, goal_w
            send_goal (x,y,z,w)
            resp.goal_sent_status = True
        return resp

def table_cb (req):
    global kg, table_name, home_pt_b, direction, duration, table_bl
    direction = req.direction
    duration = req.duration
    if (res == None) or (not home_pt_b):
        rospy.logwarn ("Did not load any Path, No milestones found")
    else:
        resp = Tl_glResponse()
        goal_x = None
        for i in range (0, len (res.milestone_list)):
            if res.milestone_list[i].name == req.table_name:
                kg = "table"
                table_name = req.table_name
                goal_x = res.milestone_list[i].x
                goal_y = res.milestone_list[i].y
                goal_z = res.milestone_list[i].z
                goal_w = res.milestone_list[i].w
        if goal_x == None:
            rospy.logwarn ("No such table in %s", path_name1)
            resp.goal_sent_status = False
        else:
            x,y = goal_x, goal_y
            z,w = goal_z, goal_w
            table_bl = True
            send_goal (x,y,z,w)
            resp.reply = "request_received"
        return resp



def find_nearest_ml (goal_pose):
    x1 = goal_pose [0]
    y1 = goal_pose [1]
    distance_list = []
    for i in range (0, len (ml_xy_list)):
        x2 = ml_xy_list [i][0]
        y2 = ml_xy_list [i][1]
        distance_list.append (hypot (x2-x1, y2-y1))
    min_index = distance_list.index(min(distance_list))
    sorted_dist = sorted (distance_list)
    second_min = distance_list.index(sorted_dist [1])
    print "ml"
    #print ("min index", min_index)
    return ml_xy_list [min_index], min_index, second_min

def find_nearest_point (start_pose):
    x1 = start_pose [0]
    y1 = start_pose [1]
    distance_list = []
    for i in range (0, len (xy_list)):
        x2 = xy_list [i][0]
        y2 = xy_list [i][1]
        distance_list.append (hypot (x2-x1, y2-y1))
    min_index = distance_list.index(min(distance_list))
    sorted_dist = sorted (distance_list)
    second_min = distance_list.index(sorted_dist [1])
    #print ("min index", min_index)
    return xy_list [min_index], min_index, second_min


def check_radius (start_pose, nearest_point_index, second_nearest_point_index):
    x0 = start_pose [0]
    y0 = start_pose [1]

    x1 = xy_list [nearest_point_index] [0]
    y1 = xy_list [nearest_point_index] [1]

    x2 = xy_list [second_nearest_point_index] [0]
    y2 = xy_list [second_nearest_point_index] [1]

    d1 = hypot (x1-x0, y1-y0)
    d2 = hypot (x2-x0, y2-y0)

    print (" Robot distance from nearest point", nearest_point_index, " and second nearest point ", second_nearest_point_index, " are ", d1, d2,  d1 <= separation_distance and d2 <= separation_distance)
    if d1 <= separation_distance and d2 <= separation_distance:
        return True
    else:
        return False

def find_exact_goal (goal):
    for i in range (0, len(ml_xy_list)):
        if (abs (ml_xy_list [i] [0] - goal [0]) <= 0.0001) and (abs (ml_xy_list [i] [1] - goal [1]) <= 0.0001):
            return ml_xy_list [i]
    return goal

def find_plan (req):
    cg = False
    start_pose = [req.start.pose.position.x, req.start.pose.position.y, req.start.pose.orientation.z, req.start.pose.orientation.w ]
    goal_pose = [req.goal.pose.position.x, req.goal.pose.position.y, req.goal.pose.orientation.z, req.goal.pose.orientation.w ]
    #actual_goal_pose = goal_pose

    if goal_pose not in xy_list:
        print "not goal"
        actual_goal_pose = goal_pose
        goal_pose,a,b = find_nearest_ml (actual_goal_pose)
        cg = True

    else:
        print "goal"
        goal_pose = find_exact_goal (goal_pose)
        cg = False

    if start_pose not in xy_list:
        nearest_point, nearest_point_index_actual, second_nearest_point_index = find_nearest_point (start_pose)
        goal_index = xy_list.index (goal_pose)
        path_start = xy_list.index (nearest_point)
        robot_near_path = check_radius (start_pose, nearest_point_index_actual, second_nearest_point_index)
        
    else:
        nearest_point = start_pose
        path_start = xy_list.index(start_pose)
    path_end = xy_list.index(goal_pose)

    if cg:
        path_end = path_end + 1

    if path_start > path_end:
        print "loop"
        first_half = xy_list[path_start::]
        second_half = xy_list[0:path_end]
        path = first_half + second_half

    else:
        print "not loop"
        path = xy_list[path_start:path_end]



    
    if cg:
        print "append"
        path.append (actual_goal_pose)

    generate_markers (path, 0, 0, 255, 0, 0.2, 0.1, 0.1, path_pub)
    response = generate_pose_list (path)
    return response

def turn(dir, dur):
    global cmd, delivery
    vel = Twist()

    if direction == "LEFT":
        vel.rotation.z = 0.2
        cmd.publish(vel)
        rospy.sleep(duration)
        vel.rotation.z = 0.0
        cmd.publish
    elif direction == "RIGHT":
        vel.rotation.z = -0.2
        cmd.publish(vel)
        rospy.sleep(duration)
        vel.rotation.z = 0.0
        cmd.publish

    dt = Bool()
    delivery.publish(dt.data=True)


def action(msg):
    global table_bl, direction, duration, kg
    if msg.data and table_bl:
        if direction != None:
            turn(direction, duration)

        elif kg == "mile":
            dt = String()
            data = {}
            data['command'] = "STOP"
            dt.data = str.encode(json.dumps(data))
            ard.publish(dt)
        else:
            dt = Bool()
            delivery.publish(dt.data=True)            


def generate_pose_list (xyzw_list):
    response = GetPlanResponse ()
    for i in range (0, len (xyzw_list)):
        p = Pose ()
        p.position.x = xyzw_list [i] [0]
        p.position.y = xyzw_list [i] [1]
        p.orientation.z = xyzw_list [i] [2]
        p.orientation.w = xyzw_list [i] [3]
        response.pose_list.append (p)
    return response

def hpt(req):
    global home_point, home_pt_b

    home_point = req.name
    home_pt_b = True
    return SaveResponse(status="added")

def home_pt(msg):
    global parking, home_point, table_bl

    table_bl = False

    resp = GPSGoalResponse()

    if msg.data and parking and home_point != None:
        ml = rospy.ServiceProxy('/milestone/goal', GPSGoal)
        ml (home_point)
        resp.goal_sent_status = True

    else:
        resp.goal_sent_status = False

    return resp



def hp(req):
    global parking_point, response, pl_list
    parking_point = req.name
    for i in range (0, len (response.milestone_list)):
        if response.milestone_list[i].name == parking_point:
            x = response.milestone_list[i].x
            y = response.milestone_list[i].y
            z = response.milestone_list[i].z
            w = response.milestone_list[i].w
            pl_list.append([x,y,z,w])
    return SaveResponse(status="saved")

def pose_cb(msg):
    global pl_list, parking, one
    x = msg.position.x
    y = msg.position.y

    if parking:
        x1 = pl_list[0][0]
        y1 = pl_list[0][1]
        distance = sqrt((x1-x)**2 + (y1-y)**2)
        if distance <= 0.1 and not one:
            dt = String()
            data = {}
            data['command'] = "PARKING"
            dt.data = str.encode(json.dumps(data))
            ard.publish(dt)
            one = True


def mess(msg):
    print "parked"
    return ParkResponse(reply="ok")

def park(msg):
    global parking
    if not parking:
        parking = msg.data
    elif parking:
        parking = False

if __name__ == "__main__":
    rospy.init_node ("robo_waiter")
    try:
        path_pub = rospy.Publisher ("/path_marker", Marker, queue_size = 10)
        pub = rospy.Publisher ("/all_path", Marker, queue_size = 10)
        cmd = rospy.Publisher ("/robot_base/cmd_vel", Twist, queue_size = 1)
        ard = rospy.Publisher ("/arduino/inbound", String, queue_size = 1)
        delivery = rospy.Publisher ("/table/delivery", Bool, queue_size = 1)
        ml_marker = rospy.Publisher ("/ml_marker", Marker, queue_size = 10)
        tl_marker = rospy.Publisher ("/tl_marker", Marker, queue_size = 10)
        client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
        client.wait_for_server ()
        rospy.Subscriber("/table_action", Bool, action)
        rospy.Subscriber("/robot_pose", Pose, pose_cb)
        rospy.Subscriber("/parking", Bool, park)
        rospy.Subscriber("/again_home", Bool, home_pt)
        rospy.Service ("/parking_point", Save, hp)
        rospy.Service ("/home_point", Save, hpt)
        rospy.Service ("/milestone/goal", GPSGoal, goal_cb)
        rospy.Service ("/table/goal", Tl_gl, table_cb)
        rospy.Service ("/milestone/plan", GetPlan, find_plan)
        rospy.Service("/parking", Park, mess)
        rospy.loginfo ("Ready to receive goals")
        path_load_cb()
        rospy.spin()
    except Exception as e:
        rospy.loginfo(e)
