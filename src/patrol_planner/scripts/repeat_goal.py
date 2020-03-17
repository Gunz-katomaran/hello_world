#!/usr/bin/env python

import rospy
from patrol_planner.srv import Tl_gl, Tl_glResponse, Save, SaveResponse, Park, ParkResponse, Obstacle, ObstacleResponse
from patrol_planner.srv import PathLoad, PathLoadResponse, GPSGoal, GPSGoalResponse, GetPlan, GetPlanResponse, GetPlanRequest

a = True

def g(i):
    global a
    while a:
        ft = rospy.ServiceProxy("/milestone/goal", GPSGoal)
        ch = ft (milestone_name=i)

        if ch.goal_sent_status:
            print "goal_ok"
            cg = ft (milestone_name="a")
        else:
            a = False
            print "goal_failed"

        if cg.goal_sent_status:
            print "goal_ok"
            a = True
        else:
            print "goal_failed"
            a = False


if __name__ == "__main__":
    rospy.init_node ("goal_tester")
    rospy.sleep(2)
    g(i="c")
    rospy.spin()