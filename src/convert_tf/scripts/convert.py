#!/usr/bin/env python


import rospy
import copy
from geometry_msgs.msg import Transform
from tf2_msgs.msg import TFMessage
from tf import TransformBroadcaster
from tf.transformations import *



Tags = rospy.get_param('Tags', 51654)
#Camera = rospy.get_param('Camera', 51654)
#Robot = rospy.get_param('Robot', 51654)

dict_values1 = ['t.x','t.y','t.z','r.x','r.y','r.z','r.w'] #tags
dict_values2 = ['p.x','p.z','p.y','o.x','o.y','o.z','o.w'] #robo and camera
gh = TransformBroadcaster()

Tags_overall = {}
new_tf = {'p.x':1,'p.y':2,'p.z':3,'o.x':4,'o.y':5,'o.z':4,'o.w':8}
tf_det = []

for i in range(0,len(Tags)):
	a = Tags[i]
	c = Robot[i]
	p = 0
	for j in range(0,len(a)):
		p += 1
		if p <= 7:
			k = Camera[0]
			f = k[dict_values2[j]]
			b = a[dict_values1[j]]
			d = c[dict_values2[j]]
			new_tf[dict_values2[j]] = d
			

	tf_det.append(copy.copy(new_tf))

print tf_det
a = TFMessage()

def callback(data):
	pass

if __name__ == '__main__':
	try:
		rospy.init_node('global_tf', anonymous=True)
		rospy.Subscriber('/guna/tf', TFMessage, callback)
		c = tf_det
		while not rospy.is_shutdown():
			try:
				gh.sendTransform((c[0]['p.x'], c[0]['p.y'], c[0]['p.z']),(c[0]['o.x'], c[0]['o.y'], c[0]['o.z'],c[0]['o.w']), rospy.Time.now(), 'tag41', '/camera')
				gh.sendTransform((c[1]['p.x'], c[1]['p.y'], c[1]['p.z']),(c[1]['o.x'], c[1]['o.y'], c[1]['o.z'],c[1]['o.w']), rospy.Time.now(), 'tag42', '/camera')
				gh.sendTransform((c[2]['p.x'], c[2]['p.y'], c[2]['p.z']),(c[2]['o.x'], c[2]['o.y'], c[2]['o.z'],c[2]['o.w']), rospy.Time.now(), 'tag43', '/camera') 
				gh.sendTransform((c[3]['p.x'], c[3]['p.y'], c[3]['p.z']), (c[3]['o.x'], c[3]['o.y'], c[3]['o.z'],c[3]['o.w']), rospy.Time.now(), 'tag44', '/camera')
				gh.sendTransform((c[4]['p.x'], c[4]['p.y'], c[4]['p.z']), (c[4]['o.x'], c[4]['o.y'], c[4]['o.z'],c[4]['o.w']), rospy.Time.now(), 'tag45', '/camera')
			except KeyboardInterrupt:
				break
		#rospy.spin()
	except KeyboardInterrupt:
		rospy.shutdown()