#!/usr/bin/env python
import rospy, sys, actionlib, time, json
from patrol_planner.srv import PathLoad, PathLoadResponse, GPSGoal, GPSGoalResponse, GetPlan, GetPlanResponse, GetPlanRequest, Save, SaveResponse
from robo_waiter.srv import Tl_gl, Tl_glResponse, Park, ParkResponse, Obstacle, ObstacleResponse
from patrol_planner.msg import Milestone
from robo_waiter.msg import Tabled, Mile
from std_msgs.msg import Bool, String
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Pose, Twist, PoseWithCovarianceStamped
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from math import sqrt
from math import cos, sin, hypot
import rospkg, ast
from shapely.geometry import Point
from shapely.geometry.polygon import Polygon
rospack = rospkg.RosPack()
separation_distance = 1
tl_list = []
tl_xy_list = []
pl_list = []
init_pose = []
config_file_path = rospack.get_path('robo_waiter') + "/scripts/tab/config/"
map_orientation = origin_latitude = origin_longitude = response = path_name = ml_xy_list = xy_list = current_x = current_y = current_z = current_w = None
path_name1 = res =  table_name = mile_name = kg = direction = home_point = parking_point = Robot_name = None
table_bl = one = False
duration = None
vel_z = 0.5

def path_load_cb (file_name1,file_name2,file_name3):
    global response, tl_list,tl_xy_list, res
    f = open (config_file_path + file_name1, "r")
    f1 = open (config_file_path + file_name2, "r")
    f2 = open (config_file_path + file_name3, "r")
    b = json.load(f)
    b1 = json.load(f1)
    b2 = json.load(f2)


    res = PathLoadResponse ()
    for i in b1['table_points']:
        str_list = eval(i)
        table = Tabled ()
        table.name = str (str_list [4])
        table.x = x = float (str_list [0])
        table.y = y = float (str_list [1])
        table.z = z = float (str_list [2])
        table.w = w = float (str_list [3])
        res.milestone_list.append (table)
        tl_xy_list.append([x,y,z,w])
    
    generate_markers (tl_xy_list, 1, 0, 255, 0, 0.2, 0.2, 0.2, tl_marker)

    response = PathLoadResponse ()
    for i in b2['milestone']:
        str_list = eval(i)
        milestone = Milestone ()
        milestone.name = str (str_list [4])
        milestone.x = float (str_list [0])
        milestone.y = float (str_list [1])
        milestone.z = float (str_list [2])
        milestone.w = float (str_list [3])
        response.milestone_list.append (milestone)

    get_milestone_xy (response)    


    gps_coordinates = []
    for i in b['waypoint']:
        str_list = eval(i)
        lat_long_heading = [float (str_list [0]), float (str_list [1]), float (str_list [2]),float (str_list [3])]
        gps_coordinates.append (lat_long_heading)
    get_xy_list (gps_coordinates)
    rospy.loginfo ("Converted GPS Path to xy coordinates in map")
    reference("call")


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
    global table_bl, direction, duration, delivery, one, ard, kg
    action_goal = MoveBaseGoal ()
    action_goal.target_pose.header.frame_id = "map"
    action_goal.target_pose.header.stamp = rospy.Time.now ()
    action_goal.target_pose.pose.position.x = x
    action_goal.target_pose.pose.position.y = y
    action_goal.target_pose.pose.orientation.z = z
    action_goal.target_pose.pose.orientation.w = w
    goal_handle = client.send_goal (action_goal)
    wait = client.wait_for_result() 

    if client.get_state() == 2:
        print "abort"
    if client.get_state() == 3:

        if kg == "mile":
            print "stop called"
            dt = String()
            data = {}
            data['command'] = "STOP"
            dt.data = str.encode(json.dumps(data))
            ard.publish(dt)

        elif table_bl and (direction == "LEFT" or "RIGHT"):
            print "turn called"
            turn(direction,duration)
        else:
            print "after del"
            dt = Bool()
            dt.data=True
            delivery.publish(dt)


def goal_cb (req):
    global kg, mile_name
    if (response == None):
        rospy.logwarn ("Did not load any Path, No milestones found")
    else:
        resp = GPSGoalResponse()
        goal_x = None
        for i in range (0, len (response.milestone_list)):
            if response.milestone_list[i].name == req.milestone_name:
                print "home"
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
    global kg, table_name, direction, duration, table_bl, one
    direction = req.direction
    duration = req.duration
    if (res == None):
        rospy.logwarn ("Did not load any Path, No milestones found")
    else:
        one = False
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
    new_pose = None
    start_pose = [req.start.pose.position.x, req.start.pose.position.y, req.start.pose.orientation.z, req.start.pose.orientation.w ]
    goal_pose = [req.goal.pose.position.x, req.goal.pose.position.y, req.goal.pose.orientation.z, req.goal.pose.orientation.w ]

    if goal_pose not in xy_list:
        print "not goal"
        actual_goal_pose = goal_pose
        if kg == "table":
            new_pose,a,b = find_nearest_ml (actual_goal_pose)
            goal_pose,a,b = find_nearest_point (new_pose)
            cg = True
        elif kg == "mile":
            goal_pose,a,b = find_nearest_point (actual_goal_pose)
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
        if kg == "table":
            path.append(new_pose)
            path.append (actual_goal_pose)
        elif kg == "mile":
            path.append(actual_goal_pose)

    generate_markers (path, 0, 0, 255, 0, 0.2, 0.1, 0.1, path_pub)
    response = generate_pose_list (path)
    return response

def turn(dir1, dur):
    global cmd, delivery, vel_z
    vel = Twist()

    if dir1 == "LEFT":
        vel.angular.z = vel_z
        cmd.publish(vel)
        rospy.sleep(dur)
        vel.angular.z = 0.0
        cmd.publish(vel)
    elif dir1 == "RIGHT":
        vel.angular.z = -vel_z
        cmd.publish(vel)
        rospy.sleep(dur)
        vel.angular.z = 0.0
        cmd.publish(vel)

    dt = Bool()
    dt.data=True
    delivery.publish(dt)


def action(msg):
    global table_bl, direction, duration, kg, ard
    if msg.data:


        if kg == "mile":
            print "stop called"
            dt = String()
            data = {}
            data['command'] = "STOP"
            dt.data = str.encode(json.dumps(data))
            ard.publish(dt)

        elif (direction == "LEFT" or direction == "RIGHT"):
            turn(direction, duration)
        else:
            dt = Bool()
            dt.data=True
            delivery.publish(dt)            


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


def home_pt(msg):
    global home_point, table_bl

    table_bl = False


    if msg.data and home_point != None:
        rospy.wait_for_service('/milestone/goal')
        ml = rospy.ServiceProxy('/milestone/goal', GPSGoal)
        ml (str(home_point))
    else:
        log.publish("return home error")
        rospy.loginfo("return home error")



def pose_cb(msg):
    global parking_point, one

    point = Point(msg.position.x, msg.position.y)

    if parking_point != None:
        polygon_vertices = ast.literal_eval(parking_point)
        polygon_shapely = Polygon(polygon_vertices)
        if (polygon_shapely.contains(point)) and not one:
            dt = String()
            data = {}
            data['command'] = "PARKING"
            dt.data = str.encode(json.dumps(data))
            ard.publish(dt)
            one = True

def home_pose(Robot_name): #robot initial pose publisher
    global init_pose, pose_pub

    pos = PoseWithCovarianceStamped()
    pos.header.stamp = rospy.Time.now()
    pos.header.frame_id = 'map'

    g = False

    try:
        for i in init_pose:
            if i['name'] == Robot_name:
                x = i['x']
                y = i['y']
                z = i['z']
                w = i['w']
                g = True
                pos.pose.pose.position.x = float(x)
                pos.pose.pose.position.y = float(y)
                pos.pose.pose.orientation.z = float(z)
                pos.pose.pose.orientation.w = float(w)
                pose_pub.publish(pos)
                rospy.loginfo("initialpose published")
        if g:
            log.publish("initialpose_published")
            node.publish("ready")
        else:
            log.publish("given robot name not in list")

    except Exception as e:
        log.publish(str(e))
        rospy.logwarn("home" + str(e))

def table_call(msg):
    tl = rospy.ServiceProxy('/table/goal', Tl_gl)
    tl (table_name=msg.table_name,direction=msg.table_direction,duration=msg.table_duration)



def reference(msg=None):
    global home_point, parking_point, init_pose, Robot_name
    try:
        with open (config_file_path + "pickup_point.json") as e:
            f = json.load(e)
            home_point = f['pickup_point']
        with open (config_file_path + "parking_point.json") as e:
            f = json.load(e)
            parking_point = f['parking_points']
        with open (config_file_path + "robot_info.json") as e:
            f = json.load(e)
            init_pose = f['robot_info']
            home_pose(Robot_name)
        

    except Exception as error:
        log.publish(str(error))
        rospy.logwarn("ref" + str(error))       




if __name__ == "__main__":
    rospy.init_node ("robo_waiter")
    try:
        path_pub = rospy.Publisher ("/path_marker", Marker, queue_size = 20)
        pub = rospy.Publisher ("/all_path", Marker, queue_size = 20)
        cmd = rospy.Publisher ("/robot_base/cmd_vel", Twist, queue_size = 1)
        ard = rospy.Publisher ("/arduino/inbound", String, queue_size = 1)
        log = rospy.Publisher ("/logger/info", String, queue_size = 1)
        node = rospy.Publisher ("/node/check1", String, queue_size = 1)
        pose_pub = rospy.Publisher ("/initialpose", PoseWithCovarianceStamped, queue_size = 1)
        delivery = rospy.Publisher ("/table/delivery", Bool, queue_size = 1)
        ml_marker = rospy.Publisher ("/ml_marker", Marker, queue_size = 10)
        tl_marker = rospy.Publisher ("/tl_marker", Marker, queue_size = 10)
        client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
        client.wait_for_server ()
        rospy.Subscriber("/target_table", Mile, table_call)
        rospy.Subscriber("/file_init", Bool, reference)
        rospy.Subscriber("/table_action", Bool, action)
        rospy.Subscriber("/robot_pose", Pose, pose_cb)
        rospy.Subscriber("/again_home", Bool, home_pt)
        rospy.Service ("/file_init", GPSGoal, reference)
        rospy.Service ("/milestone/goal", GPSGoal, goal_cb)
        rospy.Service ("/table/goal", Tl_gl, table_cb)
        rospy.Service ("/milestone/plan", GetPlan, find_plan)
        rospy.loginfo ("Ready to receive goals")
        #print "ready"
        #rospy.wait_for_service("/robot_name")
        #req_name  = rospy.ServiceProxy('/robot_name', Park)
       # k = req_name (True)
        #rospy.loginfo(k.reply)
        #Robot_name = str(k.reply)
        Robot_name = "Robot1"
        path_load_cb(file_name1="waypoint.json",file_name2="table_points.json",file_name3="milestone.json")
        rospy.spin()
    except Exception as e:
        print (e)
        rospy.logwarn("main" + str(e))
