# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include;/usr/include/gazebo-7;/usr/include/sdformat-4.4;/usr/include/ignition/math2;/usr/include/OGRE;/usr/include/OGRE/Terrain;/usr/include/OGRE/Paging".split(';') if "${prefix}/include;/usr/include;/usr/include/gazebo-7;/usr/include/sdformat-4.4;/usr/include/ignition/math2;/usr/include/OGRE;/usr/include/OGRE/Terrain;/usr/include/OGRE/Paging" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;sensor_msgs;gazebo_ros".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgazebo_ros_velodyne_laser;-lgazebo_ros_velodyne_gpu_laser".split(';') if "-lgazebo_ros_velodyne_laser;-lgazebo_ros_velodyne_gpu_laser" != "" else []
PROJECT_NAME = "velodyne_gazebo_plugins"
PROJECT_SPACE_DIR = "/home/katomaran-ros/catkin_ws8/install"
PROJECT_VERSION = "1.0.9"
